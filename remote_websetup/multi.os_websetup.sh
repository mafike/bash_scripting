#!/bin/bash

# Variable Declaration"
#PACKAGE="wget unzip httpd"
URL="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip > /dev/null"
ART_NAME="2137_barista_cafe"
TEMPDIR="/tmp/webfiles"
#SVC="httpd"

yum --help &> /dev/null

if [ $? -eq 0 ]
then 
    #Set varaibles for CentOS
    PACKAGE="wget unzip httpd"
    SVC="httpd"
    echo "running Setup on Centos"

    # Installing Dependencies 
    echo"#####################################"
    echo"Intsalling packages"
    echo"#####################################"
    sudo yum install $PACKAGE -y > /dev/null

    # Start & Enable service
    echo"#####################################"
    echo"Start & Enabling HTTPD service"
    echo"#####################################"
    sudo systemctl start $SVC
    sudo systemctl enable $SVC
    echo 

    #Creating Temp Directory
    echo"#####################################"
    echo" Starting Artifact Deployment"
    echo"#####################################"

    mkdir -p /$TEMPDIR
    cd /$TEMPDIR

    wget $URL > /dev/null
    unzip $ART_NAME.zip > /dev/null

    sudo cp -r $ART_NAME/* /var/www/html/
    echo

    #Bounce Service 
    echo"#####################################"
    echo"Restarting HTTPD"
    echo"#####################################"

    sudo systemctl restart $SVC
    echo
    #Clean up 
    echo"#####################################"
    echo"Removing Temporary files"
    echo"#####################################"

    rm -rf /$TEMPDIR > /dev/null
    echo

    sudo systemctl status $SVC
    ls /var/www/html/
else
     #Set varaibles for Ubuntu
    PACKAGE="wget unzip apache2"
    SVC="apache2"
    echo "running Setup on Centos"

    # Installing Dependencies
    echo"#####################################"
    echo"Intsalling packages"
    echo"#####################################"
    sudo apt update > /dev/null
    sudo apt install $PACKAGE -y > /dev/null

    # Start & Enable service
    echo"#####################################"
    echo"Start & Enabling HTTPD service"
    echo"#####################################"
    sudo systemctl start $SVC
    sudo systemctl enable $SVC
    echo

    #Creating Temp Directory
    echo"#####################################"
    echo" Starting Artifact Deployment"
    echo"#####################################"

    mkdir -p /$TEMPDIR
    cd /$TEMPDIR

    wget $URL > /dev/null
    unzip $ART_NAME.zip > /dev/null

    sudo cp -r $ART_NAME/* /var/www/html/
    echo

    #Bounce Service
    echo"#####################################"
    echo"Restarting HTTPD"
    echo"#####################################"

    sudo systemctl restart $SVC
    echo
    #Clean up
    echo"#####################################"
    echo"Removing Temporary files"
    echo"#####################################"

    rm -rf /$TEMPDIR > /dev/null
    echo

    sudo systemctl status $SVC
    ls /var/www/html/
fi
