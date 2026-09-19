resource "azurerm_mssql_database" "db" {
  name      = var.database_name
  server_id = var.server_id
  sku_name  = var.sku_name
  collation = var.collation

  tags = {
    environment = "production"
  }
}

output "database_id" {
  value = azurerm_mssql_database.db.id
}

output "database_name" {
  value = azurerm_mssql_database.db.name
}