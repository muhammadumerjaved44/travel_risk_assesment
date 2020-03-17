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
env = Env()
env.read_env()
basic_config = cnf.app_config[env('ENV')]


dir_path = os.path.abspath(os.path.dirname(__file__))
parent_path = os.path.abspath(os.path.join(dir_path, os.pardir))
print('this is path', parent_path)

