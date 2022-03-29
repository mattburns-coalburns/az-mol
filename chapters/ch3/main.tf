# Invokes Resource Group module
module "rg" {
  source    = "./rg"
  prefix = var.prefix
  location  = var.location
}

# Invokes Web App Module
module "webapp" {
  source = "./webapp"
  prefix = var.prefix
  location = var.location
  rg-name    = module.rg.rg_name
}
