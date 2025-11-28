# K8S Internal Developer Platform — Infrastructure (AKS) — Terraform

This repo provisions the Infrastructure for an internal developer platform on Azure:
- Azure Resource Group, VNet (2 public + 2 private subnets)
- Azure Database for MySQL (Flexible) with Private Endpoint
- Azure Container Registry (ACR)
- Azure Key Vault
- Azure Kubernetes Service (AKS) with nodepools and autoscaler
- Example StorageClass and Ingress instructions (deploy via Helm after cluster created)

Principles:
- Never hardcode values: use variables and `envs/*/terraform.tfvars`.
- Support multiple regions & subscriptions: pass `subscription_id` and `location` per environment.
- Secrets in Azure Key Vault.
- ACR access granted to AKS via role assignment.
- Dev access limited to whitelisted IPs; Stage/Prod access via CI/CD.

Structure:
```
modules/        # reusable modules (network, aks, mysql, acr, keyvault)
envs/           # environment folders (dev, stage, prod)
scripts/        # helper scripts (get-kubeconfig)
README.md
DEPLOYMENT.md
DEVELOPER_GUIDE.md
```

See DEPLOYMENT.md for step-by-step instructions.
