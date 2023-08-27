variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type        = string
  description = "Azure Region to use"
  default     = "UK South"
}

variable "failover_location" {
  type        = string
  description = "Azure Region to use to fail over to"
  default     = "France South"
}
