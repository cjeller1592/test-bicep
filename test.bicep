
var name = 'cjtestbicep'
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: '${name}storage' 
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
 }
}

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: '${name}-launch-plan-starter'
  location: location
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${name}-launch-1'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
