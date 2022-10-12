module "cosmosdb" {
  source            = "../../"
  common_tags       = var.common_tags
  resource_group    = azurerm_resource_group.example
  account_name      = var.account_name
  failover_location = var.failover_location
  key_vault_key     = azurerm_key_vault_key.example
  kind              = "GlobalDocumentDB"
}
