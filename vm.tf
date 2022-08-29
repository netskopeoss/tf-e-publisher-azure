resource "azurerm_linux_virtual_machine" "vm" {
  name                            = format("%s%s%s%s%s", var.env_prefix, "-", var.vm_prefix, "-", "VM")
  location                        = data.azurerm_resource_group.vn_rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  admin_username                  = var.admin_username
  disable_password_authentication = true

  identity {
    type = "SystemAssigned"
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.admin_ssh_key)
  }
  custom_data = base64encode(templatefile("${path.root}/scripts/bootstrap.tpl", { token = "${netskope_publishers.npa.token}"}))
  
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
  size = var.vm_size

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.stg.primary_blob_endpoint
  }
  source_image_reference {
    publisher = "netskope"
    offer     = "netskope-npa-publisher"
    sku       = var.img_sku
    version   = var.img_version
  }

  plan {
    name      = "npa_publisher"
    product   = "netskope-npa-publisher"
    publisher = "netskope"
  }

  os_disk {
    name                 = format("%s%s%s%s%s", var.env_prefix, "-", var.vm_prefix, "-", "disk")
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = "32"
  }
}
