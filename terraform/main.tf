
# provider "template" {
#   version = "~> 2.0"
# }

resource "azurerm_resource_group" "main" {
  name     = var.name
  location = var.location
}


###
#   AKS
###

module "aks_primary" {
  source               = "./modules/terraform-azurerm-aks"
  prefix               = var.prefix
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location

  agents_size   = var.aks_agent_size
  agents_count  = var.aks_pool_size

  admin_username = var.admin_username
  admin_ssh_key  = file("~/.ssh/id_rsa.pub")
}


###
#   HELM CHARTS
###

resource "helm_release" "kube-prometheus-stack" {
  name              = "kube-prometheus-stack"
  chart             = "kube-prometheus-stack"
  repository        = "https://prometheus-community.github.io/helm-charts"
  dependency_update = true

  values = [
    file("${path.module}/../charts/kube-prometheus-stack/values.yaml")
  ]

  depends_on = [module.aks_primary]
}

resource "helm_release" "metrics-app" {
  name              = "metrics-app"
  chart             = "${path.module}/../charts/metrics-app/chart"
  dependency_update = true

  values = [
    file("${path.module}/../charts/metrics-app/values.yaml"),
  ]

  depends_on = [helm_release.kube-prometheus-stack]
}

resource "helm_release" "slo-app" {
  name              = "slo-app"
  chart             = "${path.module}/../charts/slo-app/chart"
  dependency_update = true

  values = [
    file("${path.module}/../charts/slo-app/values.yaml"),
  ]

  depends_on = [helm_release.kube-prometheus-stack]
}
