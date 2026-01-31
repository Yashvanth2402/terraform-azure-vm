output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "nsg_name" {
  value = azurerm_network_security_group.vm_nsg.name
}

# 🛡️ SAFE OUTPUT — does NOT evaluate VM in CI
output "vm_private_ip" {
  value       = var.enable_vm ? azurerm_network_interface.nic.private_ip_address : null
  description = "VM private IP (only when VM is enabled)"
}
