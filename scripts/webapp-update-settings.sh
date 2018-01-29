#!/bin/sh

APP_NAME=<WEB_APP_NAME>
RESOURCE_GROUP=<RESOURCE GROUP NAME>
COSMOSDB_CONN_STRING="mongodb://<COSMOSDB_ACCOUNT>:<COSMOSDB_KEY_NAME>@<COSMOSDB_ACCOUNT>.documents.azure.com:10255/<DATABASE_NAME>?ssl=true&replicaSet=globaldb"

# App Settings
# az webapp config appsettings set -g <resource_group> -n <app_name> \
#   --settings KEY1=VALUE1 KEY2=VALUE2 KEY3=VALUE4

az webapp config appsettings set \
  -n $APP_NAME \
  -g $RESOURCE_GROUP \
  --settings MONGODB_URI=$COSMOSDB_CONN_STRING WEBSITES_ENABLE_APP_SERVICE_STORAGE=true WEBSITES_PORT=4200
