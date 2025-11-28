output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_kube_config" {
  # Use the admin kubeconfig raw attribute from the AKS resource
  value = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}
