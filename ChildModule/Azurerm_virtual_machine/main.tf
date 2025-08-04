resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.ToDo_Vm_var
  name                            = each.value.name_vm
  resource_group_name             = each.value.name_rg
  location                        = each.value.location
  size                            = each.value.vm_size
  admin_username                  = each.value.admin_username
  admin_password                  = data.azurerm_key_vault_secret.secrt.value
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.ToDo_NIC[each.key].id]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  # provisioner "remote-exec" {
  #   when = create
  #   on_failure = continue

  #   connection {
  #     type = "ssh"
  #     user = each.value.admin_username
  #     password = data.azurerm_key_vault_secret.secrt.value
  #     host = data.azurerm_public_ip.ToDo_pip[each.key].ip_address
  #     timeout = "5m"
      
  #   }


  #   inline = each.value.install_nginx ? [ "sudo apt-get update -y",
  #     "sudo apt-get install -y nginx",
  #     "sudo systemctl enable nginx",
  #   "sudo systemctl start nginx"] : []
 
  
  # }

  
}