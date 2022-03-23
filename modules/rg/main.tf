# Provides the Resource Group to logically contain resources
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}Rg"
  location = var.location
}