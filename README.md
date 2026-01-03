# Azure Secure Landing Zone (CLI-Based Implementation)

## Overview
This project demonstrates the design and implementation of a **Secure Azure Landing Zone**
aligned with **Microsoft Azure Landing Zone (Enterprise-Scale) architecture principles**.
The solution is deployed using **Azure CLI**, following infrastructure, security, and
governance best practices used in enterprise environments.

This repository serves as a **practical, hands-on proof project** showcasing Azure
Solution Architect–level skills, including governance, networking, security, and monitoring.

---
## Prerequisites

- Azure subscription
- Owner or Contributor role on the subscription
- Azure CLI installed **or** Azure Cloud Shell (PowerShell)
- Basic knowledge of Azure networking and governance

## How to Run (CLI)

All scripts were executed using **Azure Cloud Shell (PowerShell)**.

Step 1: Prerequisites & Environment Setup
Requirements

-Ensure the following are available before running the project:
-An active Azure subscription
-Azure CLI installed
-PowerShell (Cloud Shell or local)
-Contributor access on the Azure subscription
-Git (optional, for cloning the repo)

Verify Azure CLI Login
az login 

Confirm the correct subscription is selected:
az account show -o table

If needed, set the target subscription:
az account set --subscription <SUBSCRIPTION_ID>

Step 2: Create Core Resource Groups (Foundation Layer)
This step establishes logical isolation between networking, compute, and monitoring resources — aligned with enterprise landing zone best practices.

Script Used
cli-scripts/01-resource-groups.ps1

What this step creates
| Resource Group         | Purpose                                             |
| ---------------------- | --------------------------------------------------- |
| `rg-swa-zt-network`    | Networking resources (VNet, subnets, NSGs)          |
| `rg-swa-zt-compute`    | Application and compute resources                   |
| `rg-swa-zt-monitoring` | Centralized monitoring (Log Analytics, diagnostics) |

Run the script
cd cli-scripts
.\01-resource-groups.ps1

Verification
az group list -o table

You should see all three resource groups in East US.

Step 3: Create Virtual Network & Subnets (Zero Trust Network Design)
This step creates a secure VNet architecture that enforces isolation between web, app, data, and private endpoints.

Script used
cli-scripts/02-network-vnet-subnets.ps1

Network Design
| Subnet Name                | Address Space | Purpose                         |
| -------------------------- | ------------- | ------------------------------- |
| `subnet-web`               | `10.0.1.0/24` | Internet-facing tier            |
| `subnet-app`               | `10.0.2.0/24` | Application tier                |
| `subnet-data`              | `10.0.3.0/24` | Backend / data services         |
| `subnet-private-endpoints` | `10.0.4.0/24` | Private Link & PaaS integration |


Private Endpoint network policies are disabled on the private endpoint subnet to support Azure Private Link.

Run the script
.\02-network-vnet-subnets.ps1

Verification
az network vnet subnet list \
  -g rg-swa-zt-network \
  --vnet-name vnet-swa-zt-core \
  -o table

Expected output: all four subnets listed with correct CIDR ranges.

---
## Tools Used

- Azure CLI
- Azure Cloud Shell (PowerShell)
- Azure Policy
- Azure Network Watcher
- Log Analytics Workspace

---
## Validation & Evidence

- Verified all Resource Groups show `ProvisioningState = Succeeded`
- Confirmed VNet and subnet CIDR ranges via Azure CLI
- Validated NSG attachment to each subnet
- Confirmed Log Analytics retention policy
- Azure Policy assignment visible at subscription scope
- Policy compliance page available for ongoing evaluation

Screenshots are available in the `evidence-screenshots/` directory.

---

## Objectives
- Establish a secure and scalable Azure foundation
- Implement governance and compliance using Azure Policy
- Design a hub-and-spoke networking architecture
- Enable centralized monitoring and observability
- Demonstrate Azure CLI–driven deployments with real proof
- Enforce CIS Microsoft Azure Foundations Benchmark using Azure Policy


---

## Architecture Overview
The landing zone follows a **Hub-and-Spoke architecture**:
- **Hub VNet** for shared services and connectivity
- **Spoke VNets** for application and development workloads
- Centralized governance and monitoring

The solution follows a **Hub-and-Spoke architecture** aligned with Microsoft Azure Landing Zone (Enterprise-Scale) best practices.

![Azure Secure Landing Zone Architecture](architecture/azure-secure-landing-zone-architecture.png)

### Architecture Highlights
- Subscription-level governance using **Azure Policy**
- **Management Resource Group** for centralized Log Analytics
- **Hub VNet** for shared connectivity
- **Spoke VNet** for application workloads
- Secure **VNet peering** between Hub and Spoke

---
## Monitoring & Observability

Centralized monitoring is implemented as part of the Secure Landing Zone to ensure visibility,
auditability, and operational readiness across all environments.

### Log Analytics Workspace
- Central Log Analytics workspace deployed in the **management resource group**
- Workspace serves as a centralized log sink for:
  - Activity logs
  - Diagnostic logs
  - Future workload monitoring
- Retention configured to support audit and compliance requirements

### Design Rationale
- Separates monitoring resources from workload subscriptions
- Aligns with Azure Landing Zone enterprise-scale best practices
- Enables future integration with:
  - Azure Monitor
  - Azure Defender for Cloud
  - Sentinel (SIEM)

### Implementation
- Monitoring resources are deployed using Azure CLI
- Script-based deployment ensures repeatability and consistency

Relevant deployment scripts and validation screenshots are included in the repository.

---
## Security & Governance Baseline (CIS)
This landing zone enforces a security-first governance model using **Azure Policy** aligned with the  
**CIS Microsoft Azure Foundations Benchmark v2.0.0**.

The CIS benchmark is assigned at the **subscription scope** to ensure consistent security controls
are applied across all current and future resources.

### Key Governance Controls
- CIS Microsoft Azure Foundations Benchmark v2.0.0 (built-in initiative)
- Subscription-level policy assignment
- System-assigned managed identity for remediation readiness
- Governance enforced *before* workload deployment (shift-left security)

### Compliance State
- Initial compliance shows **100% (0/0 resources)**, which is expected for a newly provisioned landing zone
- Compliance will populate once workload resources exist and policies evaluate them
- No non-compliant initiatives or policies detected
- Demonstrates proactive governance before onboarding workloads

Evidence of policy assignment and compliance is captured in the `evidence-screenshots/` directory.


## Scope of Implementation
### Included
- Resource group organization (connectivity, management, workloads)
- Hub-and-spoke virtual network topology
- Azure VNet peering
- Azure Policy initiative assignment (CIS Azure Foundations Benchmark)
- Centralized Log Analytics workspace
- Evidence screenshots for validation

### Out of Scope (Future Enhancements)
- Azure Firewall / NVA
- Azure Bastion
- CI/CD automation
- Multi-subscription management group hierarchy

---

## Deployment Approach
All resources are deployed using:
- **Azure CLI (PowerShell)**
- Azure built-in policy initiatives
- Incremental, documented deployment steps

Deployment scripts will be available under `/cli-scripts`.

---
### Monitoring (CLI)

- `04-monitoring-log-analytics.ps1`  
  Deploys a centralized Log Analytics workspace for enterprise monitoring and security insights.

---
### Governance & Compliance (CLI)

- `05b-assign-security-benchmark.ps1`  
  Assigns the CIS Microsoft Azure Foundations Benchmark v2.0.0 at subscription scope using Azure CLI.

---
## Evidence & Validation

| Control | Evidence |
|------|--------|
| Log Analytics Workspace | `evidence-screenshots/04-log-analytics-workspace.png` |
| CIS Policy Assignment | `evidence-screenshots/08-policy-assignment-portal.png` |
| CIS Compliance Status | `evidence-screenshots/09-policy-compliance-cis-baseline.png` |


