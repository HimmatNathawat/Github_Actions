resource "azurerm_resource_group" "ToDo_Resource_Group" {
  for_each = var.Todo_var
  name     = each.value.name
  location = each.value.location
}