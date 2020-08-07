# Lookup Resource group

resource "azurerm_resource_group" "k8stest" {
  name = var.aks.rg
  location = var.location
}