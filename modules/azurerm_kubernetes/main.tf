# resource "azurerm_kubernetes_cluster" "k8" {
#   name                = var.k8_name
#   location            = var.location
#   resource_group_name = var.rg_name
#   dns_prefix          = var.dns_prefix

#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size    = "Standard_D2_v2"
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   tags = {
#     Environment = "dev"
#   }
# }

# output "client_certificate" {
#   value     = var.client_cer_value
#   sensitive = true
# }

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}