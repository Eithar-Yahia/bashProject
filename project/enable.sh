#!/bin/bash
read -p "Enter the virtual host name you want enable it (without .com) : " FILENAME

sudo a2ensite ${FILENAME}.com.conf
sudo service apache2 restart
