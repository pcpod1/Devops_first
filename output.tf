output "location" {
    value = azurerm_resource_group.aks_rg.location
}

output "Resource_group_name" {
    value = azurerm_resource_group.aks_rg.name
}

output "Resource_group_id" {
    value = azurerm_resource_group.aks_rg.id
}

output "Cluster_version" {
    value = data.azurerm_kubernetes_service_versions.current.latest_version
}

output "azure_ad_group_id" {
  value = azuread_group.new.id
}
output "azure_ad_group_objectid" {
  value = azuread_group.new.object_id
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.newclus.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.newclus.name
}

output "aks_cluster_kubernetes_version" {
  value = azurerm_kubernetes_cluster.newclus.kubernetes_version
}

output "admin_password" {
    value = var.Windowspassword
    sensitive = true
}