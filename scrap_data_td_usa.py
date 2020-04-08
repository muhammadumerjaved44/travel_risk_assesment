# -*- coding: utf-8 -*-

from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
import pandas as pd
from helper import do_help as hp
from sqlalchemy.sql import text
import os
from bs4 import BeautifulSoup
from sqlalchemy import select
import json

# dir path here
dir_path = os.path.abspath(os.path.dirname(__file__))

# local initilization here
from helper import do_help as hp

# class deleration here
basic_config = hp.from_env()
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



def load_countries_details(): 
    with open('us_countries.json') as f:
      data = json.load(f)
    data_list = pd.DataFrame.from_dict(data, orient='index', columns=['urls'])
    data_list = data_list.reset_index().rename(columns={"index": "country"})
    return data_list
 
def scrap_country_info(data_list):
    browser = hp.get_any_browser(selenium_url)
    df = data_list.copy()
    def parse_html(string):
        string = string.replace("\n", "").replace("\xa0", " ").replace(r'href="/content', 'href="https://travel.state.gov/content')
        return string
    error_country = {}
    information = []
    for href in df.urls:
        url = f'https://travel.state.gov{href}.html?wcmmode=disabled'
        browser.get(url)
    #    print(url)
        c_url = browser.current_url
    #    country = href.split('/')[2]
        print(c_url)
    #    break
        cnt = url.split('/')[-1]
        if  c_url.partition('404')[1] == '404':
            error_country.update({url: cnt})
        else:
            c_url = browser.current_url
            WebDriverWait(browser, 5)
            soup = BeautifulSoup(browser.page_source, 'lxml')
    #        cleanSoup = BeautifulSoup(str(soup).replace("/content", "https://travel.state.gov/content"))
            cleanSoup = BeautifulSoup(str(soup).replace("data-url", "href"), 'lxml')
            cleanSoup = BeautifulSoup(str(cleanSoup).replace("#/", c_url), 'lxml')
            try:
                let_dict = {}
#                travel_advisory = browser.find_element_by_css_selector('.advisories div.tsg-rwd-eab-type-frame').text.strip()
                update_date = browser.find_element_by_css_selector('.advisories div.tsg-rwd-eab-date-frame').text.strip()
                country_name = browser.find_element_by_css_selector('.advisories h3.tsg-rwd-eab-title-frame').text.split("-")[0].strip()
                alert_status = browser.find_element_by_css_selector('.advisories h3.tsg-rwd-eab-title-frame').text.split("-")[1].strip()
                summary = parse_html(''.join([str(u) for u in cleanSoup.select('.advisories div.tsg-rwd-alert-more-box-content > p')]))
                alert_details = parse_html(''.join([str(u) for u in cleanSoup.select('div.embassy-messages div.rssarchieve > div')]))
                embassy_consulate = parse_html(''.join([str(u) for u in  cleanSoup.select('.tsg-rwd-accordion-copy')[0]]))
                destination_description = parse_html(''.join([str(u) for u in  cleanSoup.select('.tsg-rwd-accordion-copy')[1]]))
                entry_exit =  parse_html(''.join([str(u) for u in  cleanSoup.select('.tsg-rwd-accordion-copy')[2]]))
                safty_security = parse_html(''.join([str(u) for u in  cleanSoup.select('.tsg-rwd-accordion-copy')[3]]))
                local_law = parse_html(''.join([str(u) for u in  cleanSoup.select('.tsg-rwd-accordion-copy')[4]]))
                health =  parse_html(''.join([str(u) for u in  cleanSoup.select('.tsg-rwd-accordion-copy')[5]]))
                travel_transport = parse_html(''.join([str(u) for u in  cleanSoup.select('.tsg-rwd-accordion-copy')[6]]))
#                let_dict.update({"travel_advisory":travel_advisory})
                let_dict.update({"update_date":update_date})
                let_dict.update({"country_name":country_name})
                let_dict.update({"alert_status":alert_status})
                let_dict.update({"summary":summary})
                let_dict.update({"alert_details":alert_details})
                let_dict.update({"embassy_consulate":embassy_consulate})
                let_dict.update({"destination_description":destination_description})
                let_dict.update({"entry_exit":entry_exit})
                let_dict.update({"safty_security":safty_security})
                let_dict.update({"local_law":local_law})
                let_dict.update({"health":health})
                let_dict.update({"travel_transport":travel_transport})
                let_dict.update({"url":c_url})
                information.append(let_dict)
                print('compelete')
    #            time.sleep(0.5)
                pass
            except:
                print('error')
    browser.close()
    browser.quit()
    return information

#umer = '<hr>'.join(information)   
#with open('umer.html', "w") as f:
#    f.write(umer)

data_list  = load_countries_details()
information = scrap_country_info(data_list)
us_information = pd.DataFrame.from_records(information)
us_information_clean = us_information.sort_values('alert_details').drop_duplicates(keep='last', subset='country_name')
us_information_clean = hp.standerdise_country_name(us_information_clean, 'country_name')
us_information_clean = us_information_clean.drop(us_information_clean.loc[us_information_clean['name_short']=='not found'].index).reset_index(drop=True) 

dump_pd  = new_countries.merge(us_information_clean, how='left', on='name_short')
dump_pd = dump_pd.dropna()
dump_pd = dump_pd[['country_id', 'update_date', 'alert_status', 'summary',
       'alert_details', 'embassy_consulate', 'destination_description',
       'entry_exit', 'safty_security', 'local_law', 'health',
       'travel_transport', 'url']]
dump_pd = dump_pd.to_dict(orient='records')

with itira_engine_conn.begin():
        metadata = hp.reflect_tables(itira_engine_conn)
        td_usa = metadata.tables['td_usa']
        # Get Table
        print(td_usa)
        itira_engine_conn.execute(td_usa.insert(),dump_pd)
        print('Records entered successfully into the ',td_usa)

