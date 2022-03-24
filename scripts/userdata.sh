#! /bin/bash
sudo apt-get update -y &&
sudo apt-get upgrade -y &&
sudo apt install apache2 -y &&
systemctl enable apache2 &&
systemctl start apache2 &&
echo "<h1>Your website has been built successfully.</h1>" > /var/www/html/index.html