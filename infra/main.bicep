param location string
param environment string

param appServicePlanName string
param webAppName string
param storageAccountName string
param keyVaultName string
param acrName string
param logAnalyticsName string

module app './modules/app.bicep' = {
  name: 'app'
  params: {
    location: location
    appServicePlanName: appServicePlanName
    webAppName: webAppName
  }
}

module storage './modules/storage.bicep' = {
  name: 'storage'
  params: {
    location: location
    storageAccountName: storageAccountName
  }
}

module security './modules/security.bicep' = {
  name: 'security'
  params: {
    location: location
    keyVaultName: keyVaultName
  }
}

module container './modules/container.bicep' = {
  name: 'container'
  params: {
    location: location
    acrName: acrName
  }
}

module monitoring './modules/monitoring.bicep' = {
  name: 'monitoring'
  params: {
    location: location
    logAnalyticsName: logAnalyticsName
  }
}

output webAppUrl string = app.outputs.webAppUrl
output storageAccountId string = storage.outputs.storageAccountId
output keyVaultId string = security.outputs.keyVaultId
output acrId string = container.outputs.acrId
output logAnalyticsId string = monitoring.outputs.logAnalyticsId
