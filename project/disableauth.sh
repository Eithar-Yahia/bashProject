#!/bin/bash

read -p "Enter the virtual host name you want to disable authentiation (without .com) : " FILENAME
sudo rm  /var/www/${FILENAME}.com/public_html/.htaccess
