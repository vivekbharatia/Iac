@allowed([
  'test'
  'prod'
])
param tierType string
var deplomentSettings = {
  test:{
    aksname: 'AKS-Test'
    vmSize:'Standard_D2_v4'
    nodes: 1
  }
  prod:{
    aksname: 'AKS-Prod'
    vmSize: 'Standard_D8_v4'
    nodes: 3
  }
}

resource aks 'Microsoft.ContainerService/managedClusters@2023-03-01'={
  name:deplomentSettings[tierType].aksname
  location: resourceGroup().location
  identity:{
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: 'aks'
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: deplomentSettings[tierType].nodes
        vmSize: deplomentSettings[tierType].vmSize
        mode: 'System'
      }
    ]
  }
}

output fqdn string = aks.properties.fqdn
