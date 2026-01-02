# Azure Secure Landing Zone
# Step 05B - Assign Microsoft Cloud Security Benchmark

$location = "eastus"
$subId = az account show --query id -o tsv
$scope = "/subscriptions/$subId"

# Get the policy set definition ID for Microsoft Cloud Security Benchmark
$benchmarkId = az policy set-definition list `
  --query "[?displayName=='Microsoft Cloud Security Benchmark'].name" `
  -o tsv

# Assign the initiative
az policy assignment create `
  --name "assign-mcsb-baseline" `
  --display-name "Microsoft Cloud Security Benchmark Baseline" `
  --policy-set-definition $benchmarkId `
  --scope $scope `
  --location $location `
  --identity-type SystemAssigned
