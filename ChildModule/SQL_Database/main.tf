resource "azurerm_mssql_database" "TodoDB" {
    for_each     = var.sql_data
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.SQL_server[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  zone_redundant = false

}