variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "rg-name" {
  type        = string
  description = "Name of the resource group"
}

variable "rgId" {
  description = "ID of the Resource Group"
}

variable "prefix" {
  type        = string
  description = "The base name for the resource group and storage account"
}