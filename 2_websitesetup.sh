#!/bin/bash

# Installing Dependencies 
echo"#####################################"
echo"Intsalling packages"
echo"#####################################"
sudo yum install wget unzip httpd -y > /dev/null

# Start & Enable service
echo"#####################################"
echo"Start & Enabling HTTPD service"
echo"#####################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo 

#Creating Temp Directory
echo"#####################################"
echo" Starting Artifact Deployment"
echo"#####################################"

mkdir -p /tmp/webfiles
cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2126_antique_cafe.zip > /dev/null
unzip 2126_antique_cafe.zip > /dev/null

sudo cp -r 2126_antique_cafe/* /var/www/html/
echo

#Bounce Service 
echo"#####################################"
echo"Restarting HTTPD"
echo"#####################################"

sudo systemctl restart httpd
echo

#Clean up 
echo"#####################################"
echo"Removing Temporary files"
echo"#####################################"

rm -rf /tmp/webfiles > /dev/null
echo

sudo systemctl status httpd
ls /var/www/html/
