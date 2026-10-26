# Azure Resource Group with Terraform

A minimal Terraform configuration that creates one Azure resource group.

## Files

| File | Purpose |
| --- | --- |
| `main.tf` | Terraform and azurerm provider setup, plus the resource group |
| `variables.tf` | Inputs: subscription, name, region, tags |
| `outputs.tf` | Prints the resource group ID, name and region |

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) 1.5 or newer
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli), signed in with `az login`

## Usage

```bash
# 1. Sign in and point Terraform at your subscription
az login
export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
# PowerShell: $env:ARM_SUBSCRIPTION_ID = (az account show --query id -o tsv)

# 2. (Optional) edit the defaults in variables.tf: location, resource_group_name, tags

# 3. Initialise, check and preview
terraform init
terraform fmt
terraform validate
terraform plan

# 4. Create the resource group
terraform apply

# 5. Inspect what was created
terraform output
terraform state list
terraform state show azurerm_resource_group.main
az group show --name rg-terraform-demo -o table

# 6. Clean up
terraform destroy
```

You can also override values without editing files:

```bash
terraform apply -var="location=westeurope" -var="resource_group_name=rg-my-demo"
```
