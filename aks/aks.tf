resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = var.ssh_public_key
    }
    }
    
  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count,
    ]
  }

  default_node_pool {
    name       = "default"
    node_count = var.agent_count
    vm_size    = var.vm_size
    max_count = var.max_count
    min_count = var.min_count
    enable_auto_scaling = var.enable_auto_scaling
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
  tags = var.tags
}