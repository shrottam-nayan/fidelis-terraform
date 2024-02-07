#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx start
sudo systemctl enable nginx
sudo echo "Hi Shrottam" >/var/www/html/index.nginx-debian.html