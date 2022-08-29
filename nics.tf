#Create VM NIC for the VM and Assign IP address.
resource "azurerm_network_interface" "nic" {
  name                          = format("%s%s%s%s%s", var.env_prefix, "-", var.vm_prefix, "-", "nic")
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = data.azurerm_resource_group.vn_rg.location
  enable_ip_forwarding          = "false"
  enable_accelerated_networking = "false"

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    primary                       = "true"
  }
}
