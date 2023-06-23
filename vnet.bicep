param vnetname string 

param vNetSettings object = {
  addressPrefix: '10.0.0.0/16'
  subnets:[
    {
      name: 'firstsubnet'
      addressPrefix: '10.0.0.0/25'
    }
    {
      name: 'secondsubnet'
      addressPrefix: '10.0.0.128/25'
    }
  ]
}

resource vistualnetwork 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnetname
  location: resourceGroup().location
  properties:{
    addressSpace: {
      addressPrefixes: [
        vNetSettings.addressPrefix
      ]
    }
    subnets:[
      {
        name: vNetSettings.subnets[0].name
        properties:{
          addressPrefix:  vNetSettings.subnets[0].addressPrefix
        }
      }
        {
          name: vNetSettings.subnets[1].name
          properties:{
            addressPrefix: vNetSettings.subnets[1].addressPrefix
          }
        }
    ]
  }
}
