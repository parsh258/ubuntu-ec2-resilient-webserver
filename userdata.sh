#!/bin/bash
# Update the Ubuntu package repository database
sudo apt-get update -y
# Install Apache2 web server
sudo apt-get install apache2 -y
# Ensure Apache starts up on boot automatically
sudo systemctl start apache2
sudo systemctl enable apache2
# Overwrite default Apache file with our landing text
echo "<h1>Welcome to my Resilient Ubuntu Cloud Web Server!</h1>" > /var/www/html/index.html
