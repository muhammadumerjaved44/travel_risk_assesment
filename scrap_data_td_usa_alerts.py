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
from helper import do_help as hp
from sqlalchemy.sql import text
import os
from bs4 import BeautifulSoup
import logging
import feedparser

from sqlalchemy import create_engine
from sqlalchemy import MetaData
from sqlalchemy import Table
from sqlalchemy import select
from collections import defaultdict
import country_converter as coco


dir_path = os.path.abspath(os.path.dirname(__file__))

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

def load_alert_urls():
    data_list = hp.prepare_urls_travel_advisory_usa()
    df = pd.DataFrame.from_records(data_list, columns=['title', 'levels', 'last_update', 'links'])
    df['country'] = df.title.str.split('Travel Advisory', expand=True)[0].str.strip()
    df = hp.standerdise_country_name(df, 'country')
    return df


data_list = load_alert_urls()    



        


        
        





