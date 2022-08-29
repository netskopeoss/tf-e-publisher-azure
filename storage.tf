resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = azurerm_resource_group.rg.name
    }

    byte_length = 2
}

/*
An accessible boot diagnostic storage account is necessary for the serial console to function. 
Serial console by design cannot work with storage account firewalls enabled on the boot diagnostics storage account.
*/

resource "azurerm_storage_account" "stg" {
    name                        = lower(format("%s%s%s", var.env_prefix, var.vm_prefix, random_id.randomId.hex))
    resource_group_name         = azurerm_resource_group.rg.name
    location                    = data.azurerm_resource_group.vn_rg.location
    account_replication_type    = "LRS"
    account_tier                = "Standard"
} 

