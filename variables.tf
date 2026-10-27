variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string
  default     = "rg-network-demo"
}

variable "location" {
  description = "Azure region, e.g. eastus, westeurope, uksouth."
  type        = string
  default     = "eastus"
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "vnet-demo"
}

variable "vnet_address_space" {
  description = "IP range for the whole virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "web_subnet_prefix" {
  description = "IP range for the public-facing web subnet. Must sit inside vnet_address_space."
  type        = string
  default     = "10.0.1.0/24"
}

variable "app_subnet_prefix" {
  description = "IP range for the private app subnet. Must sit inside vnet_address_space."
  type        = string
  default     = "10.0.2.0/24"
}

variable "allowed_https_source" {
  description = "Who may reach the web subnet on HTTPS: \"Internet\" for everyone, or a CIDR such as your own IP/32."
  type        = string
  default     = "Internet"
}

variable "app_port" {
  description = "Port the app tier accepts from the web tier."
  type        = number
  default     = 8080
}

variable "tags" {
  description = "Tags applied to every resource that supports them."
  type        = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
    project     = "network-demo"
  }
}
