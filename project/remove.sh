#!/bin/bash
read -p "Enter the virtual host name you want to remove (without .com) : " FILENAME
sudo a2dissite ${FILENAME}.com.conf
sudo service apache2 restart

sudo rm  /etc/apache2/sites-available/${FILENAME}.com.conf
sudo rm -Rf /var/www/${FILENAME}.com
