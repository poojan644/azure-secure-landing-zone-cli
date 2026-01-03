## Monitoring & Observability

This landing zone enables centralized visibility using Azure-native monitoring services.

### Log Analytics Workspace (Central Logs)

A **Log Analytics Workspace** is created to collect and query logs across resources.

- **Resource Group:** `rg-swa-zt-monitoring`
- **Workspace:** `law-swa-zt-core`
- **Region:** `eastus`
- **Retention:** `30 days`

Example verification command:
```bash
az monitor log-analytics workspace show -g rg-swa-zt-monitoring -n law-swa-zt-core --query "{Name:name, Location:location, Retention:retentionInDays}"



