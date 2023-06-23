. '.\00 Variables.ps1'

$Vnets=5
#Powershell
for($vnetno=1;$vnet -le $Vnets; $vnetno++){
    $Vnetname ="PSVnet_$vnetno"
    az deployment group create --resource-group $RG --template-file .\vnet.bicep --parameter=$Vnetname
}

az network vnet list -g $RG -o table
