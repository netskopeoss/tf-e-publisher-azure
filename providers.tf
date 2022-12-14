provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.
  features {}
}

# Netskope Provider Block. We recommend to use environment variables instead.
/*
provider "netskope" {
  baseurl  = "<tenant-url>"
  apitoken = "<api-token>"
}
*/