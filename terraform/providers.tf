terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.50"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
    host                   = module.aks_primary.kube_config.0.host
    username               = module.aks_primary.kube_config.0.username
    password               = module.aks_primary.kube_config.0.password
    client_certificate     = base64decode(module.aks_primary.kube_config.0.client_certificate)
    client_key             = base64decode(module.aks_primary.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(module.aks_primary.kube_config.0.cluster_ca_certificate)
  }
}
