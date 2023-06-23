param sqlServerName string
@secure()
param adminPassword string 
resource sqlServer 'Microsoft.Sql/servers@2021-02-01-preview' ={
  name: 'name'
  location: resourceGroup().location
  properties: {
    administratorLogin: 'sqladmin'
    administratorLoginPassword: adminPassword
    version: '12.0'
  }
}
