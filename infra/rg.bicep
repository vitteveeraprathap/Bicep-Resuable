//This script creates a resource group under the existing subscription

targetScope = 'subscription'

// Parameters
param location string
param resourceGroupName string
param tags object

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}
