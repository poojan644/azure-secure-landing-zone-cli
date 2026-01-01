# Azure Secure Landing Zone
# Step 03 - Hub and Spoke Networking

$location = "eastus"

# Create Hub VNet
az network vnet create `
  --resource-group rg-alz-connectivity `
  --name vnet-hub `
  --address-prefix 10.0.0.0/16 `
  --subnet-name snet-hub `
  --subnet-prefix 10.0.1.0/24 `
  --location $location

# Create Spoke VNet - Dev
az network vnet create `
  --resource-group rg-alz-workload-dev `
  --name vnet-spoke-dev `
  --address-prefix 10.10.0.0/16 `
  --subnet-name snet-dev `
  --subnet-prefix 10.10.1.0/24 `
  --location $location

# Create Spoke VNet - App
az network vnet create `
  --resource-group rg-alz-workload-dev `
  --name vnet-spoke-app `
  --address-prefix 10.20.0.0/16 `
  --subnet-name snet-app `
  --subnet-prefix 10.20.1.0/24 `
  --location $location

# Get VNet IDs
$hubVnetId = az network vnet show -g rg-alz-connectivity -n vnet-hub --query id -o tsv
$devVnetId = az network vnet show -g rg-alz-workload-dev -n vnet-spoke-dev --query id -o tsv
$appVnetId = az network vnet show -g rg-alz-workload-dev -n vnet-spoke-app --query id -o tsv

# Peering: Hub to Spokes
az network vnet peering create `
  --name hub-to-dev `
  --resource-group rg-alz-connectivity `
  --vnet-name vnet-hub `
  --remote-vnet $devVnetId `
  --allow-vnet-access

az network vnet peering create `
  --name hub-to-app `
  --resource-group rg-alz-connectivity `
  --vnet-name vnet-hub `
  --remote-vnet $appVnetId `
  --allow-vnet-access

# Peering: Spokes to Hub
az network vnet peering create `
  --name dev-to-hub `
  --resource-group rg-alz-workload-dev `
  --vnet-name vnet-spoke-dev `
  --remote-vnet $hubVnetId `
  --allow-vnet-access

az network vnet peering create `
  --name app-to-hub `
  --resource-group rg-alz-workload-dev `
  --vnet-name vnet-spoke-app `
  --remote-vnet $hubVnetId `
  --allow-vnet-access
