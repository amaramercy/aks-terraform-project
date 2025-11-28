variable "subnet_ids" {
  type        = map(string)
  description = "Map of subnet IDs from network module"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name from network module"
}

variable "project_name" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "location" {
  type        = string
}

variable "aks_node_count" {
  type        = number
}

variable "aks_version" {
  type        = string
  default     = "latest"
}

variable "availability_zones" {
  description = "Availability zones for AKS node pool. Leave empty for regions without AZ support."
  type        = list(string)
  default     = []
}

variable "vm_size" {
  description = "VM size for AKS node pool. Defaults to Standard_D2s_v3 (available in most regions)."
  type        = string
  default     = "Standard_D2s_v3"
}
