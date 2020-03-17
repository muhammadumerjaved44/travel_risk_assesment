# -*- coding: utf-8 -*-
from helper import do_help as hp
import config as cnf
from environs import Env
env = Env()
env.read_env()
base_config = cnf.app_config[env('ENV')]

