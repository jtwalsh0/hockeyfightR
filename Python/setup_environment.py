import yaml
import logging
from sqlalchemy import create_engine

log = logging.getLogger(__name__)

def get_db_from_profile(config_name='db_profile.yaml'):
    """
    Set up db connection from given config.

    Args:
    config_name: File containing credentails for PostgreSQL database.
    Includes PGPORT, PGHOST, PGUSER, PGPASSWORD, PGDATABASE

    Returns:
    db engine
    """
    with open(config_name, 'r') as h:
        creds = yaml.load(h)
    
    if not ('PGHOST' in creds.keys() and
            'PGUSER' in creds.keys() and
            'PGPASSWORD' in creds.keys() and
            'PGDATABASE' in creds.keys() and
            'PGPORT' in creds.keys()):
        raise Exception('Bad config file:' + config_name)

    engine = get_engine(creds['PGDATABASE'], creds['PGUSER'], creds['PGHOST'], creds['PGPORT'], creds['PGPASSWORD'])    
    return engine

def get_engine(db, user, host, port, passwd):
    url = 'postgresql://{user}:{passwd}@{host}:{port}/{db}'.format(user=user, passwd=passwd, host=host, port=port, db=db)
    engine = create_engine(url)
    return engine
