variable "project_name" {}
variable "environment" {}
variable "location" {}
variable "sku" {}
variable "tags" {}

variable "resource_group_name" {
  type        = string
  description = "Resource group name from network module"
}
