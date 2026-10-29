# Azure Resource Group (Terraform)

Terraform that creates one tagged Azure resource group. A resource group has no running cost in Azure.

## Files

| File | Purpose |
| --- | --- |
| `main.tf` | Provider setup and the resource group |
| `variables.tf` | Inputs: resource group name, region, tags |
| `outputs.tf` | Prints the resource group ID and name |

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) 1.5 or newer
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli), signed in with `az login`

## Usage

```bash
az login                # Terraform uses the Azure CLI's active subscription
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy       # clean up
```
