variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "account_name" {
  type = string
}

variable "failover_location" {
  type = string
}

variable "resource_group" {
}

variable "table_name" {
  type        = string
  default     = "tfex-cosmos-table"
  description = "(optional) describe your variable"
}

variable "offer_type" {
  type    = string
  default = "Standard"
}

variable "kind" {
  type = string
}

variable "ip_range_filter" {
  type    = string
  default = ""
}

variable "rules" {
  type    = list(any)
  default = []
}

variable "key_vault_key" {
}
