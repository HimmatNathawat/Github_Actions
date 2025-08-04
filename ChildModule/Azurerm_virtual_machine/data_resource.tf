data "azurerm_network_interface" "ToDo_NIC" {
    for_each = var.ToDo_Vm_var
    name                = each.value.name_nic
    resource_group_name = each.value.name_rg  
}

data "azurerm_public_ip" "ToDo_pip" {
    for_each = var.ToDo_Vm_var
    name                = each.value.Pip_name
    resource_group_name = each.value.name_rg  
}

data "azurerm_key_vault" "keyvalt" {

    name = "frontend-pass"
    resource_group_name = "Himmat_Rg_group"
  
}
data "azurerm_key_vault_secret" "secrt" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.keyvalt.id
}