# -*- coding: 'utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
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

from sqlalchemy import MetaData

dir_path = os.path.abspath(os.path.dirname(__file__))

# load basic configurations
basic_config = hp.from_env()

#laod the uri
selenium_url = basic_config.SELENIUM_URI
geo_engine_conn = hp.get_geodb_engine()
itira_engine_conn = hp.get_itiradb_engine()


with itira_engine_conn.begin():
    q = text('''
         SELECT * FROM `countries`
         ''')
    result = itira_engine_conn.execute(q)
    countries = pd.DataFrame(result.fetchall(), columns = result.keys())
new_countries = countries[['country_id', 'country', 'abbr']]
new_countries = hp.standerdise_country_name(new_countries, 'country')

# load browser for scrapping
try:
    browser = hp.load_browser()
    logging.info('run from the local browser')
except:
    browser = webdriver.Remote(
              command_executor=selenium_url,
              desired_capabilities=DesiredCapabilities.CHROME)
    logging.info('run from the docker browser')

data_list =  hp.prepare_urls_travel_advisory_canada()
df = pd.DataFrame(data_list, columns=['new_country'])


error_country = {}
processed_countries_dic = {}
for country in df.new_country:
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

processed_countries_pd['country'] = df['new_country'].str.replace('-', ' ')
processed_countries_pd = hp.standerdise_country_name(processed_countries_pd, 'country')


dump_pd = new_countries.merge(processed_countries_pd, on = 'name_short', how = 'left')
dump_pd = dump_pd.dropna()
dump_pd = dump_pd[['country_id', 'risk','security', 'entryexit', 'health', 'laws', 'disasters', 'assistance']]
dump_pd = dump_pd.to_dict(orient='records')