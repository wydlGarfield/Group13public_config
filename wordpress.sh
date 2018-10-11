#!/bin/bash

ipurl="$(curl ipinfo.io/ip --max-time 8)"  
siteurl=${ipurl}
adminuser=wordpress
adminpass=admin
adminemail=tom@tom.com
sitetitle="Welcome to ${ipurl}"

sudo -u ubuntu -i -- wp core install --url=${siteurl} --title="${sitetitle}" --admin_user=${adminuser} --admin_password=${adminpass} --path=/var/www/html --admin_email="${adminemail}"
exit
