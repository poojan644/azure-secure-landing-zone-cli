# azure-secure-landing-zone-cli
# Azure Secure Landing Zone (CLI-Based Implementation)

## Overview
This project demonstrates the design and implementation of a **Secure Azure Landing Zone**
aligned with **Microsoft Azure Landing Zone (Enterprise-Scale) architecture principles**.
The solution is deployed using **Azure CLI**, following infrastructure, security, and
governance best practices used in enterprise environments.

This repository serves as a **practical, hands-on proof project** showcasing Azure
Solution Architect–level skills, including governance, networking, security, and monitoring.

---

## Objectives
- Establish a secure and scalable Azure foundation
- Implement governance and compliance using Azure Policy
- Design a hub-and-spoke networking architecture
- Enable centralized monitoring and observability
- Demonstrate Azure CLI–driven deployments with real proof

---

## Architecture Overview
The landing zone follows a **Hub-and-Spoke architecture**:
- **Hub VNet** for shared services and connectivity
- **Spoke VNets** for application and development workloads
- Centralized governance and monitoring

📌 Architecture diagram will be added under `/architecture`.

---

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

## Repository Structure
