variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string
  default     = "rg-terraform-demo"
}

variable "location" {
  description = "Azure region, e.g. eastus, westeurope, uksouth."
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Tags applied to the resource group."
  type        = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
    project     = "terraform-demo"
  }
}
