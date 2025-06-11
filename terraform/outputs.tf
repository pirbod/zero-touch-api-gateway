output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "pump_container_url" {
  value = "${azurerm_storage_account.analytics.primary_blob_endpoint}${azurerm_storage_container.pump.name}"
}
