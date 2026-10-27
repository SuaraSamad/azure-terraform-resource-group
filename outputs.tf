output "resource_group_name" {
  description = "Name of the resource group."
  value       = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.main.id
}

output "subnet_ids" {
  description = "IDs of the web and app subnets."
  value = {
    web = azurerm_subnet.web.id
    app = azurerm_subnet.app.id
  }
}

output "nsg_names" {
  description = "Security group attached to each subnet."
  value = {
    web = azurerm_network_security_group.web.name
    app = azurerm_network_security_group.app.name
  }
}
