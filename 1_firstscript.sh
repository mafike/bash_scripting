#!/bin/bash
### Ths scripts prints system info ##

echo "Welcome to bash script."

echo
#checking system uptime
echo "#############################"
echo "The uptime of the system is;"
uptime

#checking system memory utilization
echo "############################"
echo"Memory utilzation"
free -m 
#Disk utilization
echo "############################"
echo "Disk Utilisation"
df -h



