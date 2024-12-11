param name string
param location string = resourceGroup().location

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2023-07-01' = {
  name: name
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  } 
  
}

//Extra exercise: declare a deployed Key Vault as existing

//Extra exercise: store the Container Registry (username, password 0, password 1) as key vault secrets

#disable-next-line outputs-should-not-contain-secrets
output acrUsername string = containerRegistry.listCredentials().username
#disable-next-line outputs-should-not-contain-secrets
output acrPassword0 string = containerRegistry.listCredentials().passwords[0].value
#disable-next-line outputs-should-not-contain-secrets
output acrPassword1 string = containerRegistry.listCredentials().passwords[1].value
