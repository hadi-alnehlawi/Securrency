import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    DEBUG = False
    TESTING = False
    SECRET_KEY = 'notejam-flask-secret-key'
    WTF_CSRF_ENABLED = True
    CSRF_SESSION_KEY = 'notejam-flask-secret-key'
    DBUSER=os.environ.get("DBUSER")
    DBPASS=os.environ.get("DBPASS")
    DBHOST=os.environ.get("DBHOST")
    DBPORT=os.environ.get("DBPORT")
    DBNAME=os.environ.get("DBNAME")
    postgres_url = f"postgresql://{DBUSER}:{DBPASS}@{DBHOST}:{DBPORT}/{DBNAME}"
    print(postgres_url)
    SQLALCHEMY_DATABASE_URI = postgres_url


class ProductionConfig(Config):
    DEBUG = False


class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True


class TestingConfig(Config):
    TESTING = True
    WTF_CSRF_ENABLED = False
