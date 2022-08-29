data "azurerm_resource_group" "vn_rg" {
  name = var.vnet_rg_name
}

data "azurerm_subnet" "snet" {
  name                 = var.snet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_rg_name
}
