resource "azurerm_resource_group" "rg" {
  name     = format("%s%s%s%s%s", var.env_prefix, "-", var.vm_prefix, "-", "rg")
  location = data.azurerm_resource_group.vn_rg.location
  tags = local.commonTags
  }