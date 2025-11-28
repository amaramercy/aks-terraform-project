# Developer Guide (short)

## Getting access (dev)
Developers in `dev` can get a kubeconfig if their IP is whitelisted and they have Azure AD access:
```bash
bash scripts/get-kubeconfig.sh <resource-group> <cluster-name> ~/.kube/config-dev
```

Assign RBAC in cluster with Azure AD groups and Kubernetes RoleBindings. Example:
- Azure AD group `dev-team` -> Kubernetes `edit` role in `dev` namespace.

## CI/CD
Stage and Prod should be deployed via CI/CD (GitHub Actions or Azure DevOps):
- CI builds images and pushes to ACR (use service principal or managed identity).
- CD uses kubectl/helm and secrets fetched from Key Vault or an external-secrets operator.

## Secrets
- Application secrets stored in Key Vault.
- For runtime in cluster, use Azure Key Vault Provider for Secrets Store CSI Driver, or sync secrets with External Secrets.
