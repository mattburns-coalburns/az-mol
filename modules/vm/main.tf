# # Provides Windows Virtual Machine in resource group
# resource "azurerm_windows_virtual_machine" "vm" {
#   name                  = "${var.prefix}Vm"
#   location              = var.location
#   resource_group_name   = var.rg-name
#   size                  = var.size
#   admin_username        = var.username
#   admin_password        = var.password
#   network_interface_ids = [var.nic]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2016-Datacenter"
#     version   = "latest"
#   }
# }

resource "azurerm_linux_virtual_machine" "web" {
  name                = "${var.prefix}-web-vm"
  resource_group_name = var.rg-name
  location            = var.location
  size                = var.size
  admin_username      = var.username
  network_interface_ids = [var.nic]

  admin_ssh_key {
    username   = var.username
    public_key = var.web-tls-public-key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  depends_on = [
    var.web-tls-public-key
  ]
}