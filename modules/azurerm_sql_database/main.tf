resource "azurerm_mssql_server" "mssqldb" {
  name                         = var.mssqldb_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_pass
}

data "azurerm_mssql_database" "mssql" {
  name      = var.mssql_name
  server_id = var.server_id
}

output "database_id" {
  value = data.azurerm_mssql_database.example.id
}