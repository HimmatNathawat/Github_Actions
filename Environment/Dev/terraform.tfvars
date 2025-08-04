Todo_variable = {
  Rg_01 = {
    name     = "Himmat_ToDo_group"
    location = "japan east"

  }
}

ToDo_Vnet_variable = {
  Vnet_01 = {
    name                = "ToDo_Vnet01"
    location            = "japan east"
    resource_group_name = "Himmat_ToDo_group"
    address_space       = ["10.0.0.0/16"]
  }
}

ToDo_subnet_variable = {
  Subnet_01 = {
    name                 = "ToDo_Subnet_frontend"
    resource_group_name  = "Himmat_ToDo_group"
    virtual_network_name = "ToDo_Vnet01"
    address_prefixes     = ["10.0.1.0/24"]
  }

  Subnet_02 = {
    name                 = "ToDo_Subnet_backend"
    resource_group_name  = "Himmat_ToDo_group"
    virtual_network_name = "ToDo_Vnet01"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
ToDo_pip_variable = {
  PIP_01 = {
    Pip_name          = "ToDoPip01"
    location          = "japan east"
    rg_name           = "Himmat_ToDo_group"
    allocation_method = "Static"
  }
  PIP_02 = {
    Pip_name          = "ToDoPip02"
    location          = "japan east"
    rg_name           = "Himmat_ToDo_group"
    allocation_method = "Static"
  }
}

ToDo_Nic_variable = {
  NIC_01 = {
    nic_name                      = "ToDo_NIC01"
    location                      = "japan east"
    rg_name                       = "Himmat_ToDo_group"
    name_ip_config                = "ToDo_IPConfig01"
    subnet_id                     = "ToDo_Subnet_frontend"
    private_ip_address_allocation = "Dynamic"
    Pip_name                      = "ToDoPIP01"
    Vnet_name                     = "ToDo_Vnet01"

  }
  NIC_02 = {
    nic_name                      = "ToDo_NIC02"
    location                      = "japan east"
    rg_name                       = "Himmat_ToDo_group"
    name_ip_config                = "ToDo_IPConfig02"
    subnet_id                     = "ToDo_Subnet_backend"
    private_ip_address_allocation = "Dynamic"
    Pip_name                      = "ToDoPIP02"
    Vnet_name                     = "ToDo_Vnet01"

} }

ToDo_vm_variable = {
  vm_01 = {
    name_vm        = "ToDo-frontend-vm"
    name_rg        = "Himmat_ToDo_group"
    location       = "japan east"
    vm_size        = "Standard_B1s"
    admin_username = "Username"
    # name_password        = "Himmat@12345"
    name_nic             = "ToDo_NIC01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    image_publisher      = "Canonical"
    image_offer          = "0001-com-ubuntu-server-focal"
    image_sku            = "20_04-lts"
    image_version        = "latest"
    Pip_name             = "ToDoPIP01"
    install_nginx        = true



  }

  vm_02 = {
    name_vm        = "ToDo-backend-vm"
    name_rg        = "Himmat_ToDo_group"
    location       = "japan east"
    vm_size        = "Standard_B1s"
    admin_username = "Username"
    # name_password        = "Himmat@12345"
    name_nic             = "ToDo_NIC02"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    image_publisher      = "Canonical"
    image_offer          = "0001-com-ubuntu-server-focal"
    image_sku            = "20_04-lts"
    image_version        = "latest"
    Pip_name             = "ToDoPIP02"
    install_nginx        = true



  }
}

sql_server = {
  sqlserver01 = {
    name                = "todosqlserver001"
    resource_group_name = "Himmat_ToDo_group"
    location            = "japan east"
    version             = "12.0"
    admin_username      = "username"
    admin_password      = "Himmat@12345"
  }
}

sql_database = {

  sqldatabase01 = {
    name                = "tododatabase"
    server_name         = "todosqlserver001"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    resource_group_name = "Himmat_ToDo_group"

  }
}

nsg_variable = {
  nsg_01 = {
    name                   = "ToDo_NSG"
    location               = "japan east"
    resource_group_name    = "Himmat_ToDo_group"
    name_security_rule     = "ToDo_NSG_rule"
    destination_port_range = "22"
  }
}
ToDo_Nic_var_assoyion = {
  ToDo_NIC_association_01 = {
    nic_id              = "ToDo_NIC01"
    nsg_id              = "ToDo_NSG"
    resource_group_name = "Himmat_ToDo_group"
  }

  //demo test aergijawerweij 

}

