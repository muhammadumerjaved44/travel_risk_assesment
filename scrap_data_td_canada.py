# -*- coding: 'utf-8 -*-
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
import time
import pandas as pd
from helper import do_help as hp
from sqlalchemy.sql import text
import os
from bs4 import BeautifulSoup
import logging

from sqlalchemy import MetaData, select,inspect
from sqlalchemy import select, or_, and_
from sqlalchemy.sql.expression import bindparam
from datetime import datetime
#dir_path = os.path.abspath(os.path.dirname(__file__))

# load basic configurations
basic_config = hp.from_env()

#laod the uri
selenium_url = basic_config.SELENIUM_URI
geo_engine_conn = hp.get_geodb_engine()
itira_engine_conn = hp.get_itiradb_engine()


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


# load browser for scrapping

with itira_engine_conn.begin():
    q = text('''
             SELECT EXISTS (SELECT 1 FROM td_canada)
             ''')
    result = itira_engine_conn.execute(q).fetchone()[0]

browser = hp.get_any_browser(selenium_url)
data_list =  hp.prepare_urls_travel_advisory_canada()



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
        element_present1 = EC.presence_of_element_located((By.CSS_SELECTOR, '.tgl-panel'))
        element_present2 = EC.presence_of_element_located((By.CSS_SELECTOR, '.tgl-panel h2'))
        WebDriverWait(browser, 3).until(element_present1)
        WebDriverWait(browser, 3).until(element_present2)
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

hp.save_as_pickel('processed_countries', processed_countries_dic)
processed_countries_dic = hp.load_as_pickel('processed_countries')
#hp.save_as_pickel('swap_countries_dic', swap_countries_dic


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


dump_pd = new_countries.merge(processed_countries_pd, on = 'name_short', how = 'left')
dump_pd = dump_pd.dropna()
dump_pd = dump_pd[['country_id', 'risk','security', 'entryexit', 'health', 'laws', 'disasters', 'assistance', 'alert_dates']]
dump_pd = dump_pd.to_dict(orient='records')

if result == 0:
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
        
    
    