import os
from environs import Env
import sqlalchemy


class Config(object):
    """
    Common configurations
    """

    # Put any configurations here that are common across all environments
    WTF_CSRF_ENABLED = True
    SQLALCHEMY_ECHO                = True
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SECRET_KEY                     = 'p9Bv<3Eid9%$i01hdjkfhlsajkfl!@#$%^&*()!@#$%^*&^%$#@fdfk+_)(*&^%$#@'

class DockerConfig(Config):
    """
    Docker configurations
    """
    env = Env()
    env.read_env()
    mariaHost = env('MYSQL_DOCK_HOST')
    mariaPort = env('MYSQL_DOCK_PORT')
    mariaUserName = env('MYSQL_ROOT_USER')
    mariaPassword = env('MYSQL_ROOT_PASSWORD')

    SQLALCHEMY_DATABASE_URI = sqlalchemy.engine.url.URL(
        drivername="mysql+pymysql",
        username=mariaUserName,
        password=mariaPassword,
        host=mariaHost,
        port=mariaPort,
        database='geodb',
    )
    SELENIUM_URI = 'http://hub:4444/wd/hub'
    ENV        = env('ENV')
    CACHE_TYPE = 'simple'


class DevelopmentConfig(Config):
    """
    Development configurations
    """
    env = Env()
    env.read_env()
    mariaHost = env('MYSQL_LOCAL_HOST')
    mariaPort = env('MYSQL_LOCAL_PORT')
    mariaUserName = env('MYSQL_ROOT_USER')
    mariaPassword = env('MYSQL_ROOT_PASSWORD')

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
    ENV        = env('ENV')
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
