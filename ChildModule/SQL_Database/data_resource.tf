data "azurerm_mssql_server" "SQL_server"{
for_each = var.sql_data
    name                = each.value.server_name
    resource_group_name = each.value.resource_group_name
  
}