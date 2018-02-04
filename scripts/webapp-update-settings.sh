#!/bin/sh

APP_NAME=<WEB_APP_NAME>
RESOURCE_GROUP=<RESOURCE_GROUP_NAME>
COSMOSDB_CONN_STRING=<COSMOSDB_CONN_STRING>
#example: COSMOSDB_CONN_STRING="mongodb://yoichikamongo01:xxMZAnm9tvGf1OUbbo3veyYseRQKSS9xuyFBoMTXPIGpi62FCVO6znsjTcU4enJvWquvYnKNJN55QYLr1P5gRUA==@yoichikamongo01.documents.azure.com:10255/mean?ssl=true&replicaSet=globaldb"

# App Settings
# az webapp config appsettings set -g <resource_group> -n <app_name> \
#   --settings KEY1=VALUE1 KEY2=VALUE2 KEY3=VALUE4

az webapp config appsettings set \
  -n $APP_NAME \
  -g $RESOURCE_GROUP \
  --settings MONGODB_URI=$COSMOSDB_CONN_STRING WEBSITES_ENABLE_APP_SERVICE_STORAGE=true WEBSITES_PORT=80


