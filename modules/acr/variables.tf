variable "project_name" { type = string }
variable "environment" { type = string }
variable "location"    { type = string }

variable "resource_group_name" {
  type        = string
  description = "Resource group name from network module"
}

variable "secondary_location" {
  description = "Secondary Azure region for geo-replication"
  type        = string
  default     = "eastus2"
}

variable "acr_sku" {
  description = "SKU for Azure Container Registry. Use 'Premium' for geo-replication."
  type        = string
  default     = "Standard"
}