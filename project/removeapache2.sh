#!/bin/sh
sudo service apache2 stop
sudo apt-get remove purge apache2 apache2-utils 
sudo apt-get autoremove apache2
sudo rm -rf  /usr/sbin/apache2 /usr/lib/apache2 /etc/apache2 /usr/share/apache2 /usr/share/man/man8/apache2.8.gz
