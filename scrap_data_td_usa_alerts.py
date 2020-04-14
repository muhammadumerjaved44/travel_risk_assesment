#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Mar 26 10:18:26 2020

@author: g1g
"""
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
import time
import pandas as pd
import os
from bs4 import BeautifulSoup
from sqlalchemy.sql import text
from sqlalchemy import Table, MetaData, and_, inspect, or_, select
from sqlalchemy.sql.expression import bindparam
from collections import defaultdict
import country_converter as coco


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
                 SELECT EXISTS (SELECT 1 FROM td_usa_alerts)
                 ''')
        result = itira_engine_conn.execute(q).fetchone()[0]
    if result == 0:
        return True
    else:
        return False

def load_alert_urls():
    data_list = hp.prepare_urls_travel_advisory_usa()
    df = pd.DataFrame.from_records(data_list, columns=['title', 'levels', 'last_update', 'links'])
    df['country'] = df.title.str.split('Travel Advisory', expand=True)[0].str.strip()
    df = hp.standerdise_country_name(df, 'country')
    return df


data_list = load_alert_urls()    

travel_data  =  new_countries.merge(data_list, on = 'name_short', how = 'left')
travel_data = travel_data.dropna()
travel_data = travel_data[['country_id', 'title', 'levels',
       'last_update', 'links']]
travel_data['level_numbers'] = travel_data['levels'].str.split(expand = True)[1].str.rstrip(':').astype(int)

dump_pd = travel_data.to_dict(orient='records')
with itira_engine_conn.begin():
    metadata = MetaData()
    metadata.reflect(bind=itira_engine_conn)
    # Get Table
    td_usa_alerts = metadata.tables['td_usa_alerts']
    print(td_usa_alerts)
    itira_engine_conn.execute(td_usa_alerts.insert(),dump_pd)
    print('Records entered successfully in to the, ',td_usa_alerts)

        


        
        





