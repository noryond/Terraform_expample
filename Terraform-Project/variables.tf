variable "resource_group_name" {
  type        = string
  default     = "rg-terra-project"
  description = "nombre del resource group"
}

variable "location" {
  type        = string
  default     = "eastus2"
  description = "Seleccion de Región"
}

variable "cluster_name" {
  type        = string
  default     = "terra-prod-cluster"
  description = "nombre del cluster"
}

variable "dns_prefix" {
  type        = string
  default     = "k8s-terra-project"
  description = "prefijo dns para el cluster"
}