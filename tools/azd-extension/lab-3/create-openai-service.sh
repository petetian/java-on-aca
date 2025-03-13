#!/bin/bash 

AZURE_CONFIG_FILE="../config/azure-resource.profile"
source $AZURE_CONFIG_FILE

AI_LOCATION=$LOCATION

# Create an Azure OpenAI account
OPEN_AI_SERVICE_NAME=open-ai-account-$UNIQUEID
az cognitiveservices account create \
   --resource-group $RESOURCE_GROUP \
   --name $OPEN_AI_SERVICE_NAME \
   --location $AI_LOCATION \
   --kind OpenAI \
   --sku s0 \
   --custom-domain $OPEN_AI_SERVICE_NAME

# Check if the OpenAI account was created successfully
AI_ID=$(az cognitiveservices account show --resource-group $RESOURCE_GROUP --name $OPEN_AI_SERVICE_NAME -o tsv --query id 2>/dev/null)
if [[ -n $AI_ID ]]; then
    echo -e "${GREEN}INFO:${NC} OpenAI instance $OPEN_AI_SERVICE_NAME already exists"
else
    echo -e "${YELLOW}INFO:${NC} Creating OpenAI instance $OPEN_AI_SERVICE_NAME in region $AI_LOCATION ..."
fi

#  deploy the language model
az cognitiveservices account deployment create \
   --resource-group $RESOURCE_GROUP \
   --name $OPEN_AI_SERVICE_NAME \
   --deployment-name gpt-4o \
   --model-name gpt-4o \
   --model-version 2024-08-06 \
   --model-format OpenAI \
   --sku-name "GlobalStandard" \
   --sku-capacity 10

echo "OPEN_AI_SERVICE_NAME=$OPEN_AI_SERVICE_NAME" >> $AZURE_CONFIG_FILE