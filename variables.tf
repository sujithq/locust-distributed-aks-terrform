variable location {
    default = "West Europe"
}

# Use override.tf or replace in pipeline
variable acr {
    type = object({
        name = string
        rg = string
        location = string
        sku = string
        admin_enabled = bool
    })
    default = {
        name = "#{acr-name}#"
        rg = "#{acr-rg}#"
        location = "#{acr-location}#"
        sku = "#{acr-sku}#"
        admin_enabled = false
    }
}

# Use override.tf or replace in pipeline
variable aks {
    type = object({
        ssh_public_key = string
        client_id = string
        client_secret = string
        agent_count = number
        dns_prefix = string
        cluster_name = string
        vm_size = string
        enable_auto_scaling = bool
        min_count = number
        max_count = number
        rg = string
  })
    default = {
        ssh_public_key = "#{aks-ssh_public_key}#"
        client_id = "#{aks-client_id}#"
        client_secret = "#{aks-client_secret}#"
        agent_count = 1
        dns_prefix = "#{aks-dns_prefix}#"
        cluster_name = "#{aks-cluster_name}#"
        vm_size = "#{aks-vm_size}#"
        enable_auto_scaling = false
        min_count = 1
        max_count = 3 
        rg = "#{aks-rg}#"
    }
}
# Use override.tf or replace in pipeline
variable locust {
    type = object({
        app_endpoint = string
        master_count = number
        worker_count = number
        image_url = string
  })
    default = {
        app_endpoint = "#{locust-app_endpoint}#"
        master_count = 1
        worker_count = 3
        image_url = "#{locust-image_url}#"
    }
}