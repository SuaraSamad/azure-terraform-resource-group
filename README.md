# Azure Network with Security Rules (Terraform)

Terraform that builds a small two-tier Azure network:

- a **virtual network** (`10.0.0.0/16`)
- a public-facing **web subnet** (`10.0.1.0/24`) whose security group allows only HTTPS (443) inbound
- a private **app subnet** (`10.0.2.0/24`) whose security group allows only the web subnet, on port 8080
- an explicit deny-all-other-inbound rule on both

Virtual networks, subnets and network security groups have no running cost in Azure.

## Files

| File | Purpose |
| --- | --- |
| `main.tf` | Provider setup, resource group, network, subnets, security groups and their subnet attachments |
| `variables.tf` | Inputs: names, region, IP ranges, allowed HTTPS source, app port, tags |
| `outputs.tf` | Prints the network ID, subnet IDs and security group names |

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) 1.5 or newer
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli), signed in with `az login`

## Usage

```bash
# 1. Sign in. Terraform uses the Azure CLI's active subscription.
az login
# Optional, if you have several subscriptions:
# az account set --subscription "<name or id>"

# 2. (Optional) edit variables.tf: region, IP ranges, allowed_https_source, app_port

# 3. Initialise, check and preview
terraform init
terraform fmt
terraform validate
terraform plan

# 4. Build it
terraform apply

# 5. Inspect what was created
terraform output
terraform state list
terraform state show azurerm_network_security_group.web
az network vnet subnet list -g rg-network-demo --vnet-name vnet-demo -o table
az network nsg rule list -g rg-network-demo --nsg-name nsg-web -o table
az network nsg rule list -g rg-network-demo --nsg-name nsg-app -o table

# 6. Clean up
terraform destroy
```

To restrict HTTPS to just your own IP address:

```bash
terraform apply -var="allowed_https_source=$(curl -s https://api.ipify.org)/32"
```
