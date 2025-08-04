
variable "ToDo_Nic_var_asso" {}
resource "azurerm_network_interface_security_group_association" "nsg-nic-assoc" {
   for_each = var.ToDo_Nic_var_asso

  network_interface_id      = data.azurerm_network_interface.ToDo_NIC[each.key].id
  network_security_group_id = data.azurerm_network_security_group.ToDo_NSG[each.key].id
}