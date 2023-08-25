data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "example" {
  #checkov:skip=CKV_AZURE_189: example"
  #checkov:skip=CKV2_AZURE_32: example
  name                       = "examplekeyvault"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "Purge",
      "Recover"
    ]

    secret_permissions = [
      "Set",
    ]
  }
  purge_protection_enabled = true
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}



resource "azurerm_key_vault_key" "generated" {
  # checkov:skip=CKV_AZURE_40: Test data
  # checkov:skip=CKV_AZURE_112: Test data
  name         = "generated-certificate"
  key_vault_id = azurerm_key_vault.example.id

  expiration_date = timeadd(timestamp(), "90D")
  key_type        = "RSA"
  key_size        = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}
