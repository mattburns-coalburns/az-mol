# Invokes Resource Group module
module "rg" {
  source    = "./modules/rg"
  prefix = var.prefix
  location  = var.location
}

# Invokes Virtual Network Module
module "network" {
  source    = "./modules/vnet"
  prefix = var.prefix
  location = var.location
  rg-name    = module.rg.rg_name_output
  vnetCidr  = ["10.0.0.0/16"]
  snetCidr  = ["10.0.1.0/24"]

}

# Invokes Virtual Machine Module
module "vm" {
  source    = "./modules/vm"
  prefix = var.prefix
  location = var.location
  rg-name    = module.rg.rg_name_output
  size      = "Standard_DS1"
  username     = "tf-admin"
  # password       = module.kv.randomKvPassword
  nic       = module.network.nic_output
  web-tls-public-key = module.tls.web-tls-public-key
}

# Invoke Key Vault module
module "kv" {
  source   = "./modules/kv"
    prefix = var.prefix
  location = var.location
  rg-name   = module.rg.rg_name_output
  rgId     = module.rg.rg_id
}

module "tls" {
  source = "./modules/tls"  
}