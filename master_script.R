##########################
## LOAD PACKAGES

library('aws.s3')
require('rjson')
require('rstan')
require('tidyverse')
require('RPostgreSQL')




##########################
## LOAD CONFIGURATION

configuration = fromJSON(file='config.json')

credentials_file = configuration$files$credentials
credentials = fromJSON(file = credentials_file)


##########################
## CONNECT TO S3

Sys.setenv(
  "AWS_ACCESS_KEY_ID" = credentials$aws$AWS_ACCESS_KEY_ID
  ,"AWS_SECRET_ACCESS_KEY" = credentials$aws$AWS_SECRET_ACCESS_KEY
  ,"AWS_DEFAULT_REGION" = credentials$aws$AWS_DEFAULT_REGION
)






##########################
## CONNECT TO DATABASE

# creates a connection to the postgres database
con <- dbConnect(drv = dbDriver('PostgreSQL')
                 ,host = credentials$db$PGHOST
                 ,dbname = credentials$db$PGDATABASE
                 ,user = credentials$db$PGUSER
                 ,password = credentials$db$PGPASSWORD
                 ,port = credentials$db$PGPORT
                 )



##########################
## RUN SCRIPTS

# source('R/prepare_data.R')
# source('R/model.R')


##########################
## DISCONNECT FROM DATABASE
dbDisconnect(con)
