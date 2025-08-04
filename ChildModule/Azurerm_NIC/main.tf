
resource "azurerm_network_interface" "ToDo_NIC" {
    for_each     = var.ToDo_nic_var
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name


  ip_configuration {
    name                          = each.value.name_ip_config
    subnet_id                     = data.azurerm_subnet.ToDo_subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.ToDo_pip[each.key].id
  }

}