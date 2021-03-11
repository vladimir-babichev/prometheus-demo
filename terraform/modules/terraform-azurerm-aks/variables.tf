variable "resource_group_name" {
  description = "The resource group name to be imported"
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
}

variable "location" {
  description = "Resource Group location"
}

variable "admin_username" {
  default     = "azureuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster"
}

variable "admin_ssh_key" {
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7wgWMLT7HCY8UH+C4pxSMPoOrW6Dhu5s2bQDBjEHauPpiBXQHhaxoNSUa/lhztbowoYVw8RAjmMYoKGDI+pGEYUpeu6xggD4Tsl66p5GLkLwLKuyQz7QG+d/AeB6hNP7ipraUOe1LFW/k9XOZEwjYyqWbSt3RFbBEmmLID85UMySZO7a/jkLic3d0z/v0d4QjH0aT8MUZL+Uk0Ij6Z0j12uXKXHYbcmfL24eg872e/TvWM9IyBCtOQgdhnrmW95S5oz38sGk/OTMuATazDibnnF6vnrQbOUwbmFbK2GD+Ye8Yc/OJu/CnHgiRovI7zIUWja1efjGdTHA6KpalKvFQ31NiZKo3bSpdxgkbWVyeOWHgrBBggU9q/YFe7vHRFCMCAu1fhPrthqULLIPoyzCjqqeF06Hj7GAGNxzYk0cCqLVCN008VXDeKt81nasVHKVqhqPoztdklxoTELJ1YoMYgR90VX23YizChfKIbwPzE7PBK0EdErXcsG2Q+oQlB1nfI6aZ4rE7ONteY3qM7F83xD83MO4oV2bdjOijizZrhNdrURT1Ba6QvojMI7QMoNoLGiaWYHNareI7L5TAleFIwsaGKiybCUerL/I+H4PkRRTMiYZ5U0MWAhEJ0HjAwuQOVeYZderuEDmpYfBwYi+25kp6jIVHzH05AYe19CKitQ=="
  description = "Public ssh key to access nodes"
}

variable "agents_size" {
  default     = "Standard_D2s_v3"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  default     = 30
}

variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool"
  default     = 2
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}

variable "enable_log_analytics_workspace" {
  type        = bool
  description = "Enable the creation of azurerm_log_analytics_workspace and azurerm_log_analytics_solution or not"
  default     = false
}
