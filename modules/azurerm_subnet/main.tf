resource "azurerm_subnet" "subnet" {
  name                = var.subnet
  resource_group_name = var.rg_name
  location            = var.location
  address_prefix      = var.address_prefix
  vnet_name           = var.vnet_name

}
