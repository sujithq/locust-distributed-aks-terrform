# Lookup Container registry

resource "azurerm_container_registry" "acr" {
  name                     = var.acr.name
  resource_group_name      = var.acr.rg
  location                 = var.location
  sku                      = var.acr.sku
  admin_enabled            = var.acr.admin_enabled
  # georeplication_locations = ["East US", "West Europe"]
}