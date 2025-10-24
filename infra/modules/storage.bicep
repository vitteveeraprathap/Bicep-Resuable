param location string
param storageAccountName string

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: { name: 'Standard_LRS' }
  kind: 'StorageV2'
  properties: { accessTier: 'Hot', supportsHttpsTrafficOnly: true, minimumTlsVersion: 'TLS1_2' }
}

output storageAccountId string = storage.id
