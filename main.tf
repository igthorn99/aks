data "azurerm_subscription" "current" {
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg-${var.application}-${var.environment}"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-aks-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.prefix}aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}