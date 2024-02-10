#!/bin/bash

echo"######################$"
date 
ls /var/run/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
  echo "Httpd process is running."
else
  echo "Httpd process is not running."
  echo "Starting the process"
  systemctl start httpd
  if [ $? -eq 0 ]
  then  
    echo "Process started succesfully."
  else
    echo "Process starting failed, please contact admin."
  fi
fi
echo "####################################################"
echo
