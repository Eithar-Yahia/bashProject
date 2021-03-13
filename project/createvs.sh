
#!/bin/bash
read -p "Enter the virtual host name your want (without .com) : " FILENAME

sudo mkdir -p /var/www/${FILENAME}.com/public_html
sudo chown -R $USER:$USER /var/www/${FILENAME}.com/public_html
sudo chmod -R 755 /var/www
sudo cat  << EOF > /var/www/${FILENAME}.com/public_html/index.html
<html>
  <head>
    <title>Welcome in ${FILENAME} </title>
  </head>
  <body>
    <h1>Success! virtual host is working!</h1>
  </body>
</html>

EOF
sudo touch  /etc/apache2/sites-available/${FILENAME}.com.conf
sudo chmod 777 /etc/apache2/sites-available/${FILENAME}.com.conf

sudo cat  << EOF > /etc/apache2/sites-available/${FILENAME}.com.conf
<VirtualHost *:80>
	ServerAdmin root@${FILENAME}.com
 	ServerName ${FILENAME}.com
    	ServerAlias www.${FILENAME}.com
    	DocumentRoot /var/www/${FILENAME}.com/public_html
    	ErrorLog ${APACHE_LOG_DIR}/error.log
    	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF



sudo a2ensite ${FILENAME}.com.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart
