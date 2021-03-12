variable "name" {
    default = "prometheus-demo"
}

variable "aks_agent_size" {
    default = "Standard_D2s_v3"
}

variable "aks_pool_size" {
    default = "1"
}

variable "location" {
    default = "westeurope"
}

variable "prefix" {
    default = "prometheus-demo"
}

variable "admin_username" {
    default = "azureuser"
}
