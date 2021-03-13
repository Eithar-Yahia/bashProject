#!/bin/bash
read -p "Enter the virtual host name you want disable it (without .com) : " FILENAME
sudo a2dissite ${FILENAME}.com.conf
sudo service apache2 restart

