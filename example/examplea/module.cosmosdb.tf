module "cosmosdb" {
  source            = "../../"
  common_tags       = var.common_tags
  resource_group    = azurerm_resource_group.examplea.name
  location          = azurerm_resource_group.examplea.location
  account_name      = "secondaccountjgw"
  failover_location = var.failover_location
  key_vault_key_id  = "https://examplekeyvaultjgw.vault.azure.net/keys/temp"
  kind              = "GlobalDocumentDB"
}


resource "azurerm_resource_group" "examplea" {
  name     = "examplea"
  location = "UK South"
}
