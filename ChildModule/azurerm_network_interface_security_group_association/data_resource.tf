data "azurerm_network_interface" "ToDo_NIC" {
  for_each = var.ToDo_Nic_var_asso
  name                = each.value.nic_id
  resource_group_name = each.value.resource_group_name
  
}

data "azurerm_network_security_group" "ToDo_NSG" {
  for_each = var.ToDo_Nic_var_asso
  name                = each.value.nsg_id
  resource_group_name = each.value.resource_group_name
}