resource "azurerm_resource_group" "pipelinetest" {
  name     = "rg-ahl-test-jenkinspipeline-sc"
  location = var.primary_location
  tags     = var.appinsght_resources_tags
}


resource "azurerm_kubernetes_cluster" "pipelinetest" {
  name                = "ahlpipelinetest"
  location            = azurerm_resource_group.pipelinetest.location
  resource_group_name = azurerm_resource_group.pipelinetest.name
  dns_prefix          = "akscluster1"


  default_node_pool {
    name       = "aksnode"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }


  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.pipelinetest.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.pipelinetest.kube_config_raw

  sensitive = true
}