
# Set all the variables with <> and keep the others unchanged

# This part is for lab 2 & Lab 3

# Pay attention to this, use command 'openssl rand -hex 3' to generate a unique id and put value here, don't put command here
UNIQUEID=<unique-id>

SUBSCRIPTION=<subscription-id>
LOCATION=<region>
AI_LOCATION=<region>
GRAFANA_LOCATION=<region>
SQL_LOCATION=<region>
APPNAME=petclinic
RESOURCE_GROUP=rg-$APPNAME-$UNIQUEID

# MySQL Server

MYSQL_SERVER_NAME=mysql-$APPNAME-$UNIQUEID
MYSQL_ADMIN_USERNAME=sqladmin
MYSQL_ADMIN_PASSWORD="<sqladmin-password>"
DATABASE_NAME=petclinic

# Azure Container Registry
MYACR=acr$APPNAME$UNIQUEID

# Azure OpenAI Service
OPEN_AI_SERVICE_NAME=open-ai-account-$UNIQUEID

###############  Optional  ###############
# Set RUN_OPTIONAL to true if you want to deploy resources for Lab 4 & Lab 5
RUN_OPTIONAL=false

# Set the below variables if RUN_OPTIONAL=true

# Azure Monitoring
WORKSPACE=la-$APPNAME-$UNIQUEID

# Application Insights
APP_INSIGHTS_NAME=app-insights-$APPNAME-$UNIQUEID

# Azure Managed Grafana
GRAFANA_NAME=amg-$UNIQUEID
