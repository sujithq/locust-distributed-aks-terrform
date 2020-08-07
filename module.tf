
provider "azurerm" {
  features {}
}



#####
#
# Kubernetes
#
#####

module "aks" {
  client_id = var.aks.client_id
  client_secret = var.aks.client_secret
  resource_group_name = azurerm_resource_group.k8stest.name
  location = var.location 
  ssh_public_key = var.aks.ssh_public_key
  source = "./aks"
  agent_count = var.aks.agent_count
  dns_prefix = var.aks.dns_prefix
  cluster_name = var.aks.cluster_name
  vm_size = var.aks.vm_size
  enable_auto_scaling = var.aks.enable_auto_scaling
  min_count = var.aks.min_count
  max_count = var.aks.max_count
}

#####
#
# Locust
#
#####

module "locust" {
  source = "./locust"
  id = module.aks.id
  kube_config = module.aks.kube_config
  client_key = module.aks.client_key
  client_certificate = module.aks.client_certificate
  cluster_ca_certificate = module.aks.cluster_ca_certificate
  host = module.aks.host
  app_endpoint = var.locust.app_endpoint
  master_count = var.locust.master_count
  worker_count = var.locust.worker_count
  image_url = var.locust.image_url
}

