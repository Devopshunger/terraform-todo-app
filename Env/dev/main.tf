module "resorce_group" {
  source   = "../../modules/azurerm_resource_group"
  rg_name  = "dev_rg"
  location = "centralindia"
}

module "storage_account" {
  depends_on = [module.resorce_group]
  source     = "../../modules/azurerm_storage_account"
  stg        = "devstg"
  rg_name    = "dev_rg"
  location   = "centralindia"
}

module "virtual_network" {
  depends_on    = [module.resorce_group]
  source        = "../../modules/azurerm_virtual_network"
  vnet          = "dev_vnet"
  rg_name       = "dev_rg"
  location      = "centralindia"
  address_space = ["10.0.0.0/16"]
}

module "subnet" {
  depends_on    = [module.virtual_network]
  source        = "../../modules/azurerm_subnet"
  subnet        = "dev_subnet"
  rg_name       = "dev_rg"
  vnet_name     = "dev_vnet"
  location      = "centralindia"
  address_prefix = ["10.0.1.0/24"]
}