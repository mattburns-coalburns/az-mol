terraform {
  required_version = "~>1.1.7"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.99.0"
    }
    # tls = {
    #   source = "hashicorp/tls"
    #   version = "3.1.0"
    # }
    # local = {
    #   source = "hashicorp/local"
    #   version = "2.2.2"
    # }
  }
}

provider "azurerm" {
  features {
    
  }
}

# provider "tls" {
#   # Configuration options
# }

# provider "local" {
#   # Configuration options
# }