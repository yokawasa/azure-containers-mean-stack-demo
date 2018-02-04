#!/bin/sh

# 
# az cosmosdb command line
# https://docs.microsoft.com/en-us/cli/azure/cosmosdb?view=azure-cli-latest
#

ACCOUNT_NAME=<COSMOS_ACCOUNT_NAME>
RESOURCE_GROUP=<RESOURCE_GROUP_NAME>
DATABASE_NAME=<DATABASE_NAME>

# Create a MongoDB API Cosmos DB account
az cosmosdb create \
	--name $ACCOUNT_NAME \
	--kind MongoDB \
	--resource-group $RESOURCE_GROUP \

# Create a database 
az cosmosdb database create \
	--name $ACCOUNT_NAME \
	--db-name $DATABASE_NAME \
	--resource-group $RESOURCE_GROUP

# Create a collection
#az cosmosdb collection create \
#	--name $ACCOUNT_NAME \
#	--db-name $DATABASE_NAME \
#	--collection-name $COLLECTION_NAME \
#	--resource-group $RESOURCE_GROUP
