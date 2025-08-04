resource "azurerm_virtual_network" "ToDo_Vnet" {
    for_each = var.ToDo_Vnet_var
  
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

  
}