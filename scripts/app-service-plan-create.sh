#!/bin/sh

RESOURCE_GROUP=<RESOURCE_GROUP_NAME>
APP_PLAN=<APP_SERVICE_PLAN_NAME>

az appservice plan create --name $APP_SERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP_NAME --sku S1 --is-linux
