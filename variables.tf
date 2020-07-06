variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "account_name" {
  type = string
}

variable "failover_location" {
  type = string
}

variable "resource_group" {
  default = {
    location = ""
    name     = ""
  }
}


variable "table_name" {
  type        = string
  default     = "tfex-cosmos-table"
  description = "(optional) describe your variable"
}
