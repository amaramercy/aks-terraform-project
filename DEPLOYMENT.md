# Deployment Instructions

Requirements:
- Terraform >= 1.4
- Azure CLI logged in (az login)
- Appropriate Azure RBAC to create infra in target subscription

Quick steps (example for `dev` environment):

1. Set subscription and login:
   ```bash
   az login
   az account set --subscription "<SUBSCRIPTION_ID>"
   ```

2. Edit `envs/dev/terraform.tfvars` (copy from `.example`) and set values for:
   - tenant_id, subscription_id, location
   - project, env, acr_prefix
   - vnet_address_space, public_subnet_prefixes, private_subnet_prefixes
   - mysql_admin_user, mysql_sku, mysql_version

3. Initialize & apply:
   ```bash
   cd envs/dev
   terraform init
   terraform plan -out plan.tfplan
   terraform apply plan.tfplan
   ```

4. After AKS is provisioned, fetch kubeconfig:
   ```bash
   bash ../../scripts/get-kubeconfig.sh <resource-group> <cluster-name> ~/.kube/config-dev
   ```

5. Install ingress and storage via Helm (see DEVELOPER_GUIDE.md)

Security notes:
- Do not commit secrets. Store sensitive values in Azure Key Vault and provide only the object IDs / references in TF vars.
- Use separate service principals or managed identities for CI/CD with limited permissions.
