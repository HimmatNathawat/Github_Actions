
data "azurerm_public_ip" "ToDo_pip" {
    for_each = var.ToDo_nic_var
    name                = each.value.Pip_name
    resource_group_name = each.value.rg_name
}
data "azurerm_subnet" "ToDo_subnet" {
    for_each = var.ToDo_nic_var
    name                 = each.value.subnet_id
    virtual_network_name = each.value.Vnet_name
    resource_group_name  = each.value.rg_name
}

# data "azurerm_network_security_group" "nsg" {
#     for_each = var.ToDo_nic_var
#     name                = each.value.nsg_name
#     resource_group_name = each.value.resource_group_name
  
# }
