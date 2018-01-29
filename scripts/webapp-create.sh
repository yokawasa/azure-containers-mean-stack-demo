#!/bin/sh

APP_NAME=<WEB_APP_NAME>
RESOURCE_GROUP=<RESOURCE GROUP NAME>
APP_PLAN=<APP SERVICE PLAN NAME>
CONTAINER_IMAGE=yoichikawasaki/mean-demo:0.0.1

# Create Web App for Container
az webapp create \
  -n $APP_NAME \
  -g $RESOURCE_GROUP \
  -p $APP_PLAN \
  -i $CONTAINER_IMAGE
