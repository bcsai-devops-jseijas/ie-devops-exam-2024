using '../main.bicep'

param userAlias = '{alias}' //Replace {alias} with your student alias, and use it in your main.bicep as part of the name of the module deployment to avoid deployment conflicts 
param appServiceContainerBackendName = '{alias}-asc-backend' 
param appServicePlanName = '{alias}-asp' 
param containerRegistryName = '{alias}acr' 
param postgreSQLDatabaseName = '{alias}-db'  
param postgreSQLServerName = '{alias}-dbsrv' 

