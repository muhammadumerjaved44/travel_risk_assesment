# -*- coding: utf-8 -*-

import logging
import os
import re
import string
import time
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from bs4 import BeautifulSoup
from keras.preprocessing.text import Tokenizer, text_to_word_sequence
from nltk import tokenize
from nltk.corpus import stopwords
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk.tokenize import sent_tokenize
from sqlalchemy import MetaData, Table, create_engine, select
from sqlalchemy.sql import text
from sqlalchemy.sql import column
from textblob import TextBlob
import numpy as np

# dir path here
#dir_path = os.path.abspath(os.path.dirname(__file__))

# local initilization here
from helper import do_help as hp

# class deleration here
sia = SentimentIntensityAnalyzer()
geo_engine_conn = hp.get_geodb_engine()
itira_engine_conn = hp.get_itiradb_engine()

#code starts from here

with itira_engine_conn.begin():
    metadata = hp.reflect_tables(itira_engine_conn)
    # Get Table
    tb_countries = metadata.tables['countries']
    td_canada = metadata.tables['td_canada']
    q= select(
            [
                td_canada,
                tb_countries.c.country
             ]
            ).select_from(
                td_canada.join(
                    tb_countries,
                    tb_countries.c.countryID==td_canada.c.country_id,
                    isouter=True)
            )
    print(q)
    result = itira_engine_conn.execute(q)
    raw_text  = pd.DataFrame(result.fetchall(), columns = result.keys())

#select the necessary columns that need to be processed
raw_text = raw_text[['country_id', 'risk', 'security', 'entryexit', 'health', 'laws',
       'disasters', 'assistance']].set_index('country_id')


def feature_processing(df):
    results = df.copy()
    def nonpunc(x):
        remove_sapce = re.sub("\s\s+", " ", x)
        remove_digits = re.sub("\d\d+", "", remove_sapce)
        sent_list = sent_tokenize(remove_digits)
        remove_punc = list(map(lambda x: ' '.join(text_to_word_sequence(x, filters='!"#$%&()*+,-./:;<=>?@[\\][^\d]^_`{|}~\t\n', lower=True, split=' ')), sent_list))
        no_stop = list(map(lambda x: ' '.join(list(filter(lambda xx: xx.lower() not in stopwords.words('english'), x.split()))), remove_punc))
    #    print(no_stop)
        return ' '.join(no_stop)
    
    
    for col in results.columns:
        results[col] = df[col].apply(lambda x: nonpunc(x))
    return results

