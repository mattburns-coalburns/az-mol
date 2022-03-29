output "webapp-url" {
 value = "http://${module.webapp.webapp-name}.azurewebsites.net/"
}