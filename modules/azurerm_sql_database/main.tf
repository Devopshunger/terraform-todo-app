resource "azurerm_mssql_database" "db" {
  name      = var.database_name
  server_id = var.server_id
  sku_name  = "S0"
  collation = "SQL_Latin1_General_CP1_CI_AS"

  tags = {
    environment = "dev"
  }
}

output "database_id" {
  value = azurerm_mssql_database.db.id
}

output "database_name" {
  value = azurerm_mssql_database.db.name
}