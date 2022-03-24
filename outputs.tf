output "web-public-ip" {
    value = "Type this in on a terminal to SSH connection to web server: ssh -i ${module.local.filename} ${module.vm.username}@${module.vm.web-public-ip}"
}

output "webapp-url" {
 value = "Web App URL: http://${module.webapp.webapp-name}.azurewebsites.net/"
}