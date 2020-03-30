# -*- coding: utf-8 -*-
import base64
import pandas as pd
import numpy as np
from datetime import datetime
from bs4 import BeautifulSoup
import urllib
from selenium import webdriver
from environs import Env
import os
import sqlalchemy as sa
import pickle
import config as cnf
import country_converter as coco



dir_path = os.path.abspath(os.path.dirname(__file__))
parent_path = os.path.abspath(os.path.join(dir_path, os.pardir))
print('this is path', parent_path)


def save_excel(df, path, columns= None, index=False):
    df.to_excel(path, columns= columns, index=index)

def from_env():
    env = Env()
    env.read_env()
    basic_config = cnf.app_config[env('ENV')]
    return basic_config

def check_connnection(f):
     def wrapped(*args, **kwargs):
#         print('before function')
         db = sa.create_engine(
                args[0],
                # Pool size is the maximum number of permanent connections to keep.
                pool_size=5,
                # Temporarily exceeds the set pool_size if no connections are available.
                max_overflow=2,
                # 'pool_timeout' is the maximum number of seconds to wait when retrieving a
                # new connection from the pool. After the specified amount of time, an
                # exception will be thrown.
                pool_timeout=30,  # 30 seconds
                # 'pool_recycle' is the maximum number of seconds a connection can persist.
                # Connections that live longer than the specified amount of time will be
                # reestablished
                pool_recycle=1800,  # 30 minutes
                )
         try:
            db.connect()
            print(db,' connected succuessfully')
         except:
            print(db,' connection is not estibleshed')
         response = f(*args, **kwargs)
#         print('after function')
         return response, db
#     print('decorating', f)
     return wrapped

def get_geodb_engine():
    basic_config = from_env()
    url=basic_config.SQLALCHEMY_DATABASE_URI
    @check_connnection
    def get_engine(url):
        pass
    return get_engine(url)[1]

def get_itiradb_engine():
    basic_config = from_env()
    url=basic_config.SQLALCHEMY_BINDS['itira_db']
    @check_connnection
    def get_engine(url):
        pass
    return get_engine(url)[1]

def load_browser():
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument(" — incognito")
    print(parent_path)
    browser = webdriver.Chrome(executable_path=parent_path+'/chrome_driver/chromedriver', chrome_options=chrome_options)
    return browser

def save_as_pickel(file_name, data):
    with open(file_name+'.pickle', 'wb') as f:
        # Pickle the 'data' dictionary using the highest protocol available.
        pickle.dump(data, f, pickle.HIGHEST_PROTOCOL)

def load_as_pickel(file_name):
    with open(file_name+'.pickle', 'rb') as f:
        # The protocol version used is detected automatically, so we do not
        # have to specify it.
        data = pickle.load(f)
    return data

def prepare_urls_travel_advisory_canada():
    url = 'https://travel.gc.ca/travelling/advisories'
    html = urllib.request.urlopen(url).read()
    soup = BeautifulSoup(html, 'lxml')
    hrefs = soup.select('td a')
    list_hrefs = [href.get_attribute_list('href')[0] for href in hrefs ]
    return [l.split('/')[2] for l in list_hrefs]

def get_jaccard_sim(str1, str2):
    a = set(str1.split())
    b = set(str2.split())
    c = a.intersection(b)
    val = float(len(c)) / (len(a) + len(b) - len(c))
    return float("{0:.2f}".format(val))

def standerdise_country_name(df, column_name):
    for name in df[column_name].tolist():
        standard_names = coco.convert(names=name, to='name_short', enforce_list=False)
        if type(standard_names) == list:
            df.loc[df[column_name] == name, 'name_short'] = standard_names[0]
        else:
            df.loc[df[column_name] == name, 'name_short'] = standard_names
    return df