resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku_name
  admin_enabled       = var.admin_user_enabled
  tags                = var.tags

  dynamic "retention_policy" {
    for_each = (var.images_retention_enabled && var.sku_name == "Premium") ? ["enabled"] : []
    content {
      enabled = var.images_retention_enabled
      days    = var.images_retention_days
    }
  }

  dynamic "trust_policy" {
    for_each = (var.trust_policy_enabled && var.sku_name == "Premium") ? ["enabled"] : []
    content {
      enabled = var.trust_policy_enabled
    }
  }

  dynamic "georeplications" {
    for_each = (var.georeplication_locations != null && var.sku_name == "Premium") ? var.georeplication_locations : []
    content {
      location                  = try(georeplications.value.location, georeplications.value)
      zone_redundancy_enabled   = try(georeplications.value.zone_redundancy_enabled, null)
      regional_endpoint_enabled = try(georeplications.value.regional_endpoint_enabled, null)
      tags                      = try(georeplications.value.tags, null)
    }
  }
}
