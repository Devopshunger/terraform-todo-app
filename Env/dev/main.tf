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

module "key_vault" {
  depends_on = [module.resorce_group]
  source     = "../../modules/azurerm_key_vault"

  kv_name         = "devkeyvault01"
  location        = module.resorce_group.location
  rg_name         = module.resorce_group.rg_name
  kv_secret_name  = "db-password"
  kv_secret_value = "P@ssw0rd!123"
}

module "kubernetes_cluster" {
  depends_on = [module.resorce_group]
  source     = "../../modules/azurerm_kubernetes"

  aks_name   = "devaks01"
  location   = module.resorce_group.location
  rg_name    = module.resorce_group.rg_name
  dns_prefix = "devaks01"
}

module "sql_server" {
  depends_on = [module.resorce_group]
  source     = "../../modules/azurerm_sql_server"

  sql_server_name = "devsqlserver01"
  location        = module.resorce_group.location
  rg_name         = module.resorce_group.rg_name
  admin_login     = "sqladminuser"
  admin_pass      = "P@ssw0rd!123"
}

module "sql_database" {
  depends_on = [module.sql_server]
  source     = "../../modules/azurerm_sql_database"

  database_name = "devsqldb01"
  server_id     = module.sql_server.sql_server_id
}
