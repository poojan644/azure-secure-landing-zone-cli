# Azure Secure Landing Zone
# Step 05A - Governance Baseline (Built-in Policy Initiative)

$location = "eastus"
$subId = az account show --query id -o tsv
$scope = "/subscriptions/$subId"

# List a few built-in initiatives (policy set definitions)
az policy set-definition list --query "[?policyType=='BuiltIn'].{Name:name, DisplayName:displayName}" -o table

# Pick one built-in initiative you want to assign by displayName, then set its name/ID below.
# Example: "CIS Microsoft Azure Foundations Benchmark" (varies by tenant/region)
# We'll assign using the initiative ID once we confirm it exists in your subscription.

Write-Host "Subscription Scope:" $scope
