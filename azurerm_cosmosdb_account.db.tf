resource "azurerm_cosmosdb_account" "db" {
  name                = var.account_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  offer_type          = var.offer_type
  kind                = var.kind

  enable_automatic_failover = true

  /*dynamic block
  capabilities {
    name = var.capabilities_name
  }*/

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  //dyamic block
  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    prefix            = var.account_name
    location          = var.resource_group.location
    failover_priority = 0
  }

  ip_range_filter                   = var.ip_range_filter
  enable_free_tier                  = false
  analytical_storage_enabled        = false
  is_virtual_network_filter_enabled = false
  key_vault_key_id                  = var.key_vault_key_id
  enable_multiple_write_locations   = false

  dynamic "virtual_network_rule" {
    for_each = var.rules
    content {
      id                                   = rule.value["id"]
      ignore_missing_vnet_service_endpoint = rule.value["ignore_missing_vnet_service_endpoint"]
    }
  }

}
