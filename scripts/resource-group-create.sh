#!/bin/sh

RESOURCE_GROUP=<RESOURCE_GROUP_NAME>
LOCATION=<REGION_LOCATION_NAME>

# Create a resource group
az group create --name $RESOURCE_GROUP --location $LOCATION
