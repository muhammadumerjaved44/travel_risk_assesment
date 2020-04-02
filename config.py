import os

import sqlalchemy
from environs import Env


class Config(object):
    """
    Common configurations
    """

    # Put any configurations here that are common across all environments
    WTF_CSRF_ENABLED = True
    SQLALCHEMY_ECHO                = True
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SECRET_KEY                     = 'p9Bv<3Eid9%$i01hdjkfhlsajkfl!@#$%^&*()!@#$%^*&^%$#@fdfk+_)(*&^%$#@'
    env = Env()
    env.read_env()

class DockerConfig(Config):
    """
    Docker configurations
    """
    mariaHost = Config.env('MYSQL_DOCK_HOST')
    mariaPort = Config.env('MYSQL_DOCK_PORT')
    mariaUserName = Config.env('MYSQL_ROOT_USER')
    mariaPassword = Config.env('MYSQL_ROOT_PASSWORD')

    SQLALCHEMY_DATABASE_URI = str(sqlalchemy.engine.url.URL(
        drivername="mysql+pymysql",
        username=mariaUserName,
        password=mariaPassword,
        host=mariaHost,
        port=mariaPort,
        database='geodb',
    ))
    SQLALCHEMY_BINDS = {
            'itira_db':str(sqlalchemy.engine.url.URL(
                drivername="mysql+pymysql",
                username=mariaUserName,
                password=mariaPassword,
                host=mariaHost,
                port=mariaPort,
                database='g1g-itira',
            ))
    }
    SELENIUM_URI = 'http://itira-hub:4444/wd/hub'
    ENV        = Config.env('ENV')
    CACHE_TYPE = 'simple'


class DevelopmentConfig(Config):
    """
    Development configurations
    """
    mariaHost = Config.env('MYSQL_LOCAL_HOST')
    mariaPort = Config.env('MYSQL_LOCAL_PORT')
    mariaUserName = Config.env('MYSQL_ROOT_USER')
    mariaPassword = Config.env('MYSQL_ROOT_PASSWORD')

    SQLALCHEMY_DATABASE_URI = str(sqlalchemy.engine.url.URL(
        drivername="mysql+pymysql",
        username=mariaUserName,
        password=mariaPassword,
        host=mariaHost,
        port=mariaPort,
        database='geodb',
    ))
    SQLALCHEMY_BINDS = {
            'itira_db':str(sqlalchemy.engine.url.URL(
                drivername="mysql+pymysql",
                username=mariaUserName,
                password=mariaPassword,
                host=mariaHost,
                port=mariaPort,
                database='g1g-itira',
            ))
    }
    SELENIUM_URI = 'http://localhost:4444/wd/hub'
    DEBUG                   = True
    ENV        = Config.env('ENV')
    CACHE_TYPE = 'simple'




class ProductionConfig(Config):
    """
    Production configurations
    """

    DEBUG = False

app_config = {
    # set the env from the .evn file e.g. ENV=docker
    'docker' : DockerConfig,
    'development': DevelopmentConfig,
    'production' : ProductionConfig,
}
