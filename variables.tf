variable "project_name" {}
variable "environment" {}

variable "location" {
  default = "eastus"
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "aks_node_count" {
  type    = number
  default = 2
}

variable "mysql_admin_username" {}
variable "mysql_admin_password" {
  sensitive = true
}

variable "kv_sku" {
  default = "standard"
}
