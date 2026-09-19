module "resorce_group" {
  source   = "../../modules/azurerm_resource_group"
  rg_name  = "dev_rg"
  location = "centralindia"
}

module "storage_account" {
  depends_on = [module.resorce_group]
  source     = "../../modules/azurerm_storage_account"
  stg        = "devstg"
  rg_name    = module.resorce_group.rg_name
  location   = module.resorce_group.location
}

module "virtual_network" {
  depends_on    = [module.resorce_group]
  source        = "../../modules/azurerm_virtual_network"
  vnet          = "dev_vnet"
  rg_name       = module.resorce_group.rg_name
  location      = module.resorce_group.location
  address_space = ["10.0.0.0/16"]
}

module "subnet" {
  depends_on    = [module.virtual_network]
  source        = "../../modules/azurerm_subnet"
  subnet        = "dev_subnet"
  rg_name       = module.resorce_group.rg_name
  vnet_name     = module.virtual_network.vnet_name
  address_prefix = "10.0.1.0/24"
}