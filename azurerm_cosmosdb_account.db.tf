resource "azurerm_cosmosdb_account" "db" {
  name                = var.account_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    prefix            = var.account_name
    location          = var.resource_group.location
    failover_priority = 0
  }
}
