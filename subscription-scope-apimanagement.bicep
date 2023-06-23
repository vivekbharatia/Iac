targetScope = 'subscription'

param RG_Name string
param apiManagementGroup string

resource bicepRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name:RG_Name
  location: 'centralindia'
}

module apimanagement './apimanagement.bicep' = {
  scope: bicepRG
  name: apiManagementGroup
  params:{
    apiManagementName: apiManagementGroup
    
  }

}
