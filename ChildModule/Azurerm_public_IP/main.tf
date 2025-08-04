
resource "azurerm_public_ip" "ToDo_pip" {
  for_each = var.ToDo_pip_var
  name                = each.value.Pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}