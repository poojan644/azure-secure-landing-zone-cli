# Azure Secure Landing Zone
# Step 02 - Create Resource Groups

$location = "eastus"

az group create `
  --name rg-alz-connectivity `
  --location $location

az group create `
  --name rg-alz-management `
  --location $location

az group create `
  --name rg-alz-workload-dev `
  --location $location
