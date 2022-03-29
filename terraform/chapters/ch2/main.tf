# Invokes Resource Group module
module "rg" {
  source    = "./rg"
  prefix = var.prefix
  location  = var.location
}

# Invokes Virtual Network Module
module "network" {
  source    = "./vnet"
  prefix = var.prefix
  location = var.location
  rg-name    = module.rg.rg_name
  vnet-cidr  = ["10.0.0.0/16"]
  subnet-cidr  = ["10.0.1.0/24"]

}

# Invokes Virtual Machine Module
module "vm" {
  source    = "./vm"
  prefix = var.prefix
  location = var.location
  rg-name    = module.rg.rg_name
  size      = "Standard_DS1"
  username     = "tf-admin"
  nic       = module.network.nic_output
  web-tls-public-key = module.tls.web-tls-public-key
}

# Invokes TLS Module
module "tls" {
  source = "./tls"  
}

# Invokes Locals Module
module "local" {
  source = "./local"
  web-tls-private-key = module.tls.web-tls-private-key
}

