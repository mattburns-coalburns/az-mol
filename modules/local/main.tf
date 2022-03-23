resource "local_file" "web-server-key" {
    content  = var.web-tls-private-key
    filename = "webkey_private.pem"
}