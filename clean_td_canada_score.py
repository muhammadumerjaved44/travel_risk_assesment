# -*- coding: utf-8 -*-

import logging
import os, sys
import re
import string
import time
import pandas as pd
from bs4 import BeautifulSoup
from keras.preprocessing.text import Tokenizer, text_to_word_sequence
import nltk
nltk.download('vader_lexicon')
nltk.download('stopwords')
nltk.download('punkt')
from nltk import tokenize
from nltk.corpus import stopwords
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from nltk.tokenize import sent_tokenize
from sqlalchemy import MetaData, Table, create_engine, select
from sqlalchemy.sql import text
from sqlalchemy.sql import column
from sqlalchemy.sql.expression import bindparam
from sqlalchemy import MetaData, and_, inspect, or_, select
import numpy as np

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
sia = SentimentIntensityAnalyzer()

#code starts from here

def load_canada_table():
    with itira_engine_conn.begin():
        metadata = hp.reflect_tables(itira_engine_conn)
        # Get Table
        td_canada = metadata.tables['td_canada']
        q= select([td_canada])
        print(q)
        result = itira_engine_conn.execute(q)
        raw_text  = pd.DataFrame(result.fetchall(), columns = result.keys())

#select the necessary columns that need to be processed
    raw_text = raw_text[['country_id', 'risk', 'security', 'entryexit', 'health', 'laws',
           'disasters', 'assistance']].set_index('country_id')
    if raw_text.empty:
        return False, raw_text
    else:
        return True, raw_text
    
def table_is_empty():
    with itira_engine_conn.begin():
        q = text('''
                 SELECT EXISTS (SELECT 1 FROM td_canada_score)
                 ''')
        result = itira_engine_conn.execute(q).fetchone()[0]
    if result == 0:
        return True
    else:
        return False

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

def calculate_sentiments(df):
    results = df.copy()
    
    def sent(x):
        return sia.polarity_scores(x)['neg']+1
    
    for col in df.columns:
        results[col] = df[col].apply(lambda x: sent(x))
    return results

def fit_normalization(df):
    results = df.copy()
    new_max = 0
    new_min = 5
    for feature_name in df.columns:
        old_min = df[feature_name].min()
        old_max = df[feature_name].max()
#        result[feature_name] = (df[feature_name] - min_value) / (max_value - min_value)
        results[feature_name] = df[feature_name].apply(lambda x: ( (x - old_min) / (old_max - old_min) ) * (new_max - new_min) + new_min)
    return results


flag, raw_text = load_canada_table()

if not flag:
    print("Table td_canada has no text")
    sys.exit()
else:
    noise_removed = feature_processing(raw_text)
    sentiments = calculate_sentiments(noise_removed)
    normalize_scores = fit_normalization(sentiments)
    normalize_scores = normalize_scores.reset_index()
    
    dump_pd = normalize_scores.to_dict(orient='records')
    
    if table_is_empty():
        print('Ready to insert records')
        with itira_engine_conn.begin():
                metadata = hp.reflect_tables(itira_engine_conn)
                td_canada_score = metadata.tables['td_canada_score']
                # Get Table
                print(td_canada_score)
                itira_engine_conn.execute(td_canada_score.insert(),dump_pd)
                print('Records entered successfully into the ',td_canada_score)
    else:
        print('Ready to update the records')
        with itira_engine_conn.begin():
            metadata = hp.reflect_tables(itira_engine_conn)
            td_canada_score = metadata.tables['td_canada_score']
            q = td_canada_score.update().\
            where(
                  td_canada_score.c.country_id == bindparam('country_id')
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
            })
    
            itira_engine_conn.execute(q, dump_pd)
            print('Records updated successfully into the ',td_canada_score)
    




