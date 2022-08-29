#Create NSG for each VM
resource "azurerm_network_security_group" "nsg" {
  name                = format("%s%s%s%s%s%s%s", var.env_prefix, "-", var.vm_prefix, "-", "nic", "-", "nsg")
  resource_group_name = azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.vn_rg.location
}

resource "azurerm_network_security_rule" "rules" {
  for_each                    = local.rules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefixes     = each.value.source_address_prefixes
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

#Assign NSG to VMs
resource "azurerm_network_interface_security_group_association" "nic_nsg_accociation" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
