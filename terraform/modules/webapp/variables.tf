variable "prefix" {
  type        = string
  description = "The base name for the Virtual Machine"
}

variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "rg-name" {
  type        = string
  description = "Name of the resource group"
}