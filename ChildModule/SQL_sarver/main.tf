resource "azurerm_mssql_server" "SQL_server" {
    for_each = var.sql_ser
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.admin_username
  administrator_login_password = each.value.admin_password
 

  }