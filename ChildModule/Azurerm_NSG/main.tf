resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg_var
     name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    
  }

  
}