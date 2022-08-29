output "private_ip_address" {
  description = "IP address to Connect to Publisher"
  value       = azurerm_network_interface.nic.private_ip_addresses
}
