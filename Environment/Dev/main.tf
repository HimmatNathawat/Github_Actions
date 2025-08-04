module "ToDo_Rg_module" {
  source   = "../../ChildModule/Azurerm_resource_group"
  Todo_var = var.Todo_variable
}

module "ToDo_Vnet_module" {
  source        = "../../ChildModule/virtual_network"
  ToDo_Vnet_var = var.ToDo_Vnet_variable
  depends_on    = [module.ToDo_Rg_module]

}

module "ToDo_subnet_module" {
  source          = "../../ChildModule/Azurerm_subnet"
  ToDo_subnet_var = var.ToDo_subnet_variable
  depends_on      = [module.ToDo_Vnet_module]

}

module "ToDo_pip_module" {
  source       = "../../ChildModule/Azurerm_public_IP"
  ToDo_pip_var = var.ToDo_pip_variable
  depends_on   = [module.ToDo_Rg_module]

}

module "ToDo_Nic_module" {
  source       = "../../ChildModule/Azurerm_NIC"
  ToDo_nic_var = var.ToDo_Nic_variable
  depends_on   = [module.ToDo_subnet_module, module.ToDo_pip_module]

}

module "ToDo_Vm_module" {
  source      = "../../ChildModule/Azurerm_virtual_machine"
  ToDo_Vm_var = var.ToDo_vm_variable
  depends_on  = [module.ToDo_Nic_module]

}

module "ToDo_SQL_server_module" {
  source     = "../../ChildModule/SQL_sarver"
  sql_ser    = var.sql_server
  depends_on = [module.ToDo_Rg_module, module.ToDo_Vm_module]
}

module "ToDo_SQL_database_module" {
  source     = "../../ChildModule/SQL_database"
  sql_data   = var.sql_database
  depends_on = [module.ToDo_SQL_server_module]
}

module "nsg_module" {
  source     = "../../ChildModule/Azurerm_NSG"
  nsg_var    = var.nsg_variable
  depends_on = [module.ToDo_Rg_module, module.ToDo_Vnet_module, module.ToDo_Nic_module]

}

module "ToDo_NIC_association_module" {
  source            = "../../ChildModule/azurerm_network_interface_security_group_association"
  ToDo_Nic_var_asso = var.ToDo_Nic_var_assoyion
  depends_on        = [module.nsg_module, module.ToDo_Nic_module]
}

