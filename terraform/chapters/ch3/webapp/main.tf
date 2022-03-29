# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "${var.prefix}-webapp-asp-${random_integer.ri.result}"
  location            = var.location
  resource_group_name = var.rg-name
  sku {
    tier = "Free"
    size = "F1"
  }
}
# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "webapp" {
  name                = "${var.prefix}-webapp-${random_integer.ri.result}"
  location            = var.location
  resource_group_name = var.rg-name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  
  source_control {
    repo_url           = "https://github.com/mattburns-coalburns/nodejs-docs-hello-world"
    branch             = "main"
    manual_integration = true
    use_mercurial      = false
  }
}