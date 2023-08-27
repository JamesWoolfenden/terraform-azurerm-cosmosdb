resource "azurerm_cosmosdb_account" "db" {
  name                = var.account_name
  location            = var.location
  resource_group_name = var.resource_group
  offer_type          = var.offer_type
  kind                = var.kind

  enable_automatic_failover     = true
  public_network_access_enabled = false

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  //dynamic block
  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    location          = var.location
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

  access_key_metadata_writes_enabled = false
  local_authentication_disabled      = true
}
