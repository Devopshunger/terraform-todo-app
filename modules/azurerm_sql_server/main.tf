resource "azurerm_mssql_server" "mssql" {
  name                         = var.mssql_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.adm_login
  administrator_login_password = var.adm_pass
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = var.login_username
    object_id      = var.object_id
  }

  tags = {
    environment = "production"
  }
}