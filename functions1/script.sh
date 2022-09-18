#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd start
sudo yum install git -y
sudo git clone https://github.com/Akash-ambadi/FoodApp.git
cd FoodApp
sudo cp index.html /var/www/html/index.html
sudo service httpd restart