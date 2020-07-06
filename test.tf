resource "azurerm_cosmosdb_table" "example" {
  name                = var.table_name
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  throughput          = 400
}


variable "table_name" {
  type        = string
  default     = "tfex-cosmos-table"
  description = "(optional) describe your variable"
}
