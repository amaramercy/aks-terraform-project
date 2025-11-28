output "aks_name" {
  value = module.aks.aks_cluster_name
}

output "aks_fqdn" {
  value = module.aks.aks_fqdn
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

output "keyvault_uri" {
  value = module.keyvault.keyvault_uri
}

output "mysql_fqdn" {
  value = module.mysql.mysql_fqdn
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_ids" {
  value = module.network.subnet_ids
}
