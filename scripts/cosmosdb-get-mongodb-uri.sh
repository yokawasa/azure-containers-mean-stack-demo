#!/bin/sh

ACCOUNT_NAME=<COSMOS_ACCOUNT_NAME>
RESOURCE_GROUP=<RESOURCE_GROUP_NAME>
DATABASE_NAME=<DATABASE_NAME>

## List the access keys for a Azure Cosmos DB database account.
## https://docs.microsoft.com/en-us/cli/azure/cosmosdb?view=azure-cli-latest#az_cosmosdb_list_keys
ACCESS_KEY=$(az cosmosdb list-keys --name $ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query "primaryMasterKey" |sed s/\"//g)

MONGODB_URI="mongodb://$ACCOUNT_NAME:$ACCESS_KEY@$ACCOUNT_NAME.documents.azure.com:10255/$DATABASE_NAME?ssl=true&sslverifycertificate=false"

echo $MONGODB_URI

