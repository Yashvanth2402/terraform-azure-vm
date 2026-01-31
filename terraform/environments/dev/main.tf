# Good: Add tags for cost management
resource "azurerm_resource_group" "rg" {
  name     = "rg-vm-dev"
  location = var.location
  
  tags = {
    Environment = "dev"
    CostCenter  = "IT"
    ManagedBy   = "Terraform"
  }
}

# Good: Add managed disk
resource "azurerm_managed_disk" "data_disk" {
  name                 = "vm-data-disk"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 64
  
  tags = {
    Environment = "dev"
    Purpose     = "DataStorage"
  }
}

# Attach data disk to VM
resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  virtual_machine_id = azurerm_linux_virtual_machine.vm.id
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  lun                = "10"
  caching            = "ReadWrite"
}
