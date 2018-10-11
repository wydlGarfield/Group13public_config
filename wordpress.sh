#!/bin/bash

sudo cp -a /var/www/html/wordpress/. /var/www/html

#salts

perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' /var/www/html/wp-config.php


chown ubuntu:www-data  -R /var/www/html/* 
find /var/www/html/ -type d -exec chmod 755 {} \;  # Change directory permissions rwxr-xr-x
find /var/www/html/ -type f -exec chmod 644 {} \;

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp
cd ..
rm -rf temp
mv /var/www/html/index.html /var/www/html/apachedefault.html

ipurl="$(curl ipinfo.io/ip --max-time 8)"  
siteurl=${ipurl}
adminuser=wordpress
adminpass=admin
adminemail=tom@tom.com
sitetitle="Welcome to ${ipurl}"

sudo -u ubuntu -i -- wp core install --url=${siteurl} --title="${sitetitle}" --admin_user=${adminuser} --admin_password=${adminpass} --path=/var/www/html --admin_email="${adminemail}"
exit
