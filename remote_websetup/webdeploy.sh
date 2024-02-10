USR='devops'
for host in `cat remhosts`
do
  echo
  echo "##################################################"
  echo " Connecting to $host "
  echo " Pushing script to $host "
  scp multi.os_websetup.sh $USR@$host:/tmp/
  echo "Executing Script on $host"
  ssh $USR@$host sudo /tmp/multi.os_websetup.sh
  ssh $USR@$host sudo rm -rf tmp/multi.os_websetup.sh
  echo "###################################################"
  echo
done
 
