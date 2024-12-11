param userAlias string
param appServiceContainerBackendName string
param appServicePlanName string
param containerRegistryName string
param keyVaultName string
param postgreSQLServerName string
param postgreSQLDatabaseName string
param location string = resourceGroup().location

module containerRegistry 'modules/container-registry.bicep' = { 
  name: 'cr-${userAlias}' //Always include your userAlias within the name of the module deployment in order to avoid conflicts with other student's deployment
  params: {
    //Configure the required parameters
  }
}
