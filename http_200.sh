#!/bin/bash
# Add Crontab  * * * * *        /opt/http_200.sh
Http_Response=`curl -I https://www.google.com/ --write-out %{http_code} --connect-timeout 3 --max-time 5 2>/dev/null | awk '{print $2}' |cut -d "G" -f1|head -1`
if [ $Http_Response == 200 ]
then
   echo "Site is up and Running "
else
   echo "Site is down Restart service"
   /etc/init.d/httpd restart > /dev/null
   /etc/init.d/mysqld stop > /dev/null
   /etc/init.d/mysqld start > /dev/null
fi
