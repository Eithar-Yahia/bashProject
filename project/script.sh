#!/bin/sh
sudo apt update
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get remove --purge apache2 apache2-utils
sudo apt-get install apache2
sudo service apache2 start

