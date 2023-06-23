param apiManagementName string

resource apiManagementInstance 'Microsoft.ApiManagement/service@2020-12-01' = {
  name: apiManagementName
  location: resourceGroup().location
  sku:{
    capacity: 1
    name: 'Developer'
  }
  properties:{
    virtualNetworkType: 'None'
    publisherEmail: 'vivek.bharatia@vivcorps.com'
    publisherName: 'vivcorps.com'
  }
}
