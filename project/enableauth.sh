#!/bin/bash
read -p "Enter the virtual host name you want to enable authentication (without .com) : " FILENAME

read -p "Enter user name : " username

sudo htpasswd -c /etc/apache2/.htpasswd ${username}

sudo sed -i 's/AllowOverride None/AllowOverride All/gI' /etc/apache2/apache2.conf

sudo touch  /var/www/${FILENAME}.com/public_html/.htaccess

sudo chmod 777 /var/www/${FILENAME}.com/public_html/.htaccess


sudo cat  << EOF > /var/www/${FILENAME}.com/public_html/.htaccess
AuthType Basic
AuthName "Restricted Content"
AuthUserFile /etc/apache2/.htpasswd
Require valid-user

EOF

sudo service apache2 restart
