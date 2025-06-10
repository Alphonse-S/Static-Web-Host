#!/bin/bash
yum update -y
amazon-linux-extras install nginx1 -y
systemctl start nginx
systemctl enable nginx
echo "<h1>Welcome to NGINX on EC2 via Terraform!</h1>" > /usr/share/nginx/html/index.html
