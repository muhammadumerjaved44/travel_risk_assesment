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
