provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "analytics" {
  name                     = lower("${var.prefix}analytics")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "pump" {
  name                  = "tyk-pump"
  storage_account_name  = azurerm_storage_account.analytics.name
  container_access_type = "private"
}

resource "azurerm_container_registry" "acr" {
  name                = lower("${var.prefix}acr")
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Basic"
  admin_enabled       = true
}
