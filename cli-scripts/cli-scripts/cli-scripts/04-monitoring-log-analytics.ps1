# Azure Secure Landing Zone
# Step 04 - Centralized Monitoring (Log Analytics)

$location = "eastus"

az monitor log-analytics workspace create `
  --resource-group rg-alz-management `
  --workspace-name law-alz-core `
  --location $location
