targetScope = 'subscription'

param RG_Name string

resource bicepRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name:RG_Name
  location: 'centralindia'
}

module nsg './nsg.bicep' ={
scope: bicepRG
name: 'nsg'
params:{
  nsg_name:'nsg'
  allow_rdp: true
}
  
}
