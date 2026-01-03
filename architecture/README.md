## Architecture Overview

This Secure Landing Zone follows a **Hub-and-Spoke** networking model aligned with Azure enterprise-scale principles.

### High-level Design

- **Hub VNet**: Central connectivity layer (shared services, routing, DNS, security controls)
- **Spoke VNets**: Workload isolation for app/data tiers (separate subnets + NSGs)
- **Governance & Security**:
  - Resource groups separated by function (network, compute, monitoring)
  - Azure Policy used to enforce compliance at subscription scope
  - CIS Microsoft Azure Foundations Benchmark initiative assigned for baseline security posture

### Network Layout (Example)

- **VNet:** `vnet-swa-zt-core`
- **Subnets:**
  - `subnet-web` (10.0.1.0/24)
  - `subnet-app` (10.0.2.0/24)
  - `subnet-data` (10.0.3.0/24)
  - `subnet-private-endpoints` (10.0.4.0/24) *(Private Endpoint network policies disabled)*

### Security Controls

- **NSGs** applied per subnet to enforce segmentation:
  - Web tier: restrict inbound to HTTP/HTTPS as required
  - App tier: allow only from web tier
  - Data tier: allow only from app tier
  - Private endpoints: traffic restricted by design

> Tip: Add your exported architecture image in `docs/architecture/` and link it below.

### Diagram

![Architecture Diagram](docs/architecture/azure-secure-landing-zone.png)



