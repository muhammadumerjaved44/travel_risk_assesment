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

