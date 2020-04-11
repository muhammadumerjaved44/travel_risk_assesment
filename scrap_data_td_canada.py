# -*- coding: 'utf-8 -*-
import logging
import os
import time
import pandas as pd
from datetime import datetime
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from sqlalchemy import MetaData, and_, inspect, or_, select
from sqlalchemy.sql import text
from sqlalchemy.sql.expression import bindparam

# dir path here
dir_path = os.path.abspath(os.path.dirname(__file__))

# local initilization here
from helper import do_help as hp


# load basic configurations
basic_config = hp.from_env()

#laod the uri
selenium_url = basic_config.SELENIUM_URI
geo_engine_conn = hp.get_geodb_engine()
itira_engine_conn = hp.get_itiradb_engine()


def load_countries():
    with itira_engine_conn.begin():
        # Get Table
        metadata = hp.reflect_tables(itira_engine_conn)
        tb_countries = metadata.tables['countries']
        countries_sql = select([tb_countries.c.countryID.label('country_id'), tb_countries])
        countries_sql.cte(name='countries_sql')
        result = itira_engine_conn.execute(countries_sql)
        countries = pd.DataFrame(result.fetchall(), columns = result.keys())
    
    new_countries = countries[['country_id', 'country', 'abbr']]
    new_countries = hp.standerdise_country_name(new_countries, 'country')
    return new_countries


def table_is_empty():
    with itira_engine_conn.begin():
        q = text('''
                 SELECT EXISTS (SELECT 1 FROM td_canada)
                 ''')
        result = itira_engine_conn.execute(q).fetchone()[0]
    if result == 0:
        return True
    else:
        return False
    

def scrap_canada_site():
    browser = hp.get_any_browser(selenium_url)
    data_list = hp.prepare_urls_travel_advisory_canada()
    
    error_country = {}
    processed_countries_dic = {}
    for country in data_list.new_country:
        logging.info(country)
    #    url = f'https://travel.gc.ca{href}'
        url = f'https://travel.gc.ca/destinations/{country}'
    #    print(url)
        browser.get(url)
        c_url = browser.current_url
    #    country = href.split('/')[2]
        print(c_url)
        cnt = url.split('/')[-1]
        if  c_url.partition('404')[1] == '404':
    #        error_country.update({country: url})
            error_country.update({country: cnt})
        else:
            try:
                element_present1 = EC.presence_of_element_located((By.CSS_SELECTOR, '.tgl-panel'))
                element_present2 = EC.presence_of_element_located((By.CSS_SELECTOR, '.tgl-panel h2'))
                WebDriverWait(browser, 5).until(element_present1)
                WebDriverWait(browser, 5).until(element_present2)
            except:
                print('error', url)
                continue
            soup = BeautifulSoup(browser.page_source, 'lxml')
            main = soup.select('.tgl-panel')
            headers = soup.select('.generated li a')
    
            temp = {}
            for h,m in zip(headers, main):
                head_text = h.attrs['aria-controls']
                main_text = m.text.strip()
    
                temp.update({head_text: main_text})
            processed_countries_dic.update({country: temp})
    
            logging.info('no issue in ', url)
        time.sleep(0.5)
    browser.close()
    browser.quit()
    
    data_chunck  = {}
    for i in processed_countries_dic.keys():
        temp  = []
        col_list = []
        for j in processed_countries_dic[i].keys():
            temp.append(processed_countries_dic[i][j])
            data_chunck.update({i: temp})
            colname = '_'.join(j.lower().split())
            col_list.append(colname)
    processed_countries_pd = pd.DataFrame.from_dict(data_chunck, orient='index', columns=col_list)
    processed_countries_pd = processed_countries_pd.reset_index().rename(columns={'index': 'new_country'})
    
    processed_countries_pd['country'] = data_list['new_country'].str.replace('-', ' ')
    processed_countries_pd['alert_dates'] = data_list['alert_dates']
    processed_countries_pd = hp.standerdise_country_name(processed_countries_pd, 'country')
    
    return processed_countries_pd

def prepare_data_to_insert(countries_data, scraped_data):
    dump_pd = countries_data.merge(scraped_data, on = 'name_short', how = 'left')
    dump_pd = dump_pd.dropna()
    dump_pd = dump_pd[['country_id', 'risk','security', 'entryexit', 'health', 'laws', 'disasters', 'assistance', 'alert_dates']]
    dump_pd = dump_pd.to_dict(orient='records')
    
    return dump_pd


#get countires
new_countries = load_countries()

#scrape data
processed_countries_pd = scrap_canada_site()

#prepare data for insertion
dump_pd = prepare_data_to_insert(new_countries, processed_countries_pd)




if table_is_empty():
    print('Ready to insert records')
    with itira_engine_conn.begin():
        metadata = hp.reflect_tables(itira_engine_conn)
        td_canada = metadata.tables['td_canada']
        # Get Table
        print(td_canada)
        itira_engine_conn.execute(td_canada.insert(),dump_pd)
        print('Records entered successfully into the ',td_canada)
else:
    print('Ready to update the records')
    with itira_engine_conn.begin():
        metadata = hp.reflect_tables(itira_engine_conn)
        td_canada = metadata.tables['td_canada']
        q = td_canada.update().\
        where(
              and_(
                      td_canada.c.country_id == bindparam('country_id'),
                      td_canada.c.alert_dates != bindparam('alert_dates'),
              )
        ).\
        values({
            'country_id': bindparam('country_id'),
            'risk': bindparam('risk'),
            'security': bindparam('security'),
            'entryexit': bindparam('entryexit'),
            'health': bindparam('health'),
            'laws': bindparam('laws'),
            'disasters': bindparam('disasters'),
            'assistance': bindparam('assistance'),
            'alert_dates': bindparam('alert_dates')
        })

        itira_engine_conn.execute(q, dump_pd)
        print('Records updated successfully into the ',td_canada)
