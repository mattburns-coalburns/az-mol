output "web-public-ip" {
    value = "Type this in on a terminal to SSH connection to web server: ssh -i ${module.local.filename} ${module.vm.username}@${module.vm.web-public-ip}"
}