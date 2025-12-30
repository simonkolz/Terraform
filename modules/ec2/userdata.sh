#!/bin/bash
set -e

apt update -y
apt install -y apache2 php php-mysql mysql-server wget unzip

systemctl start apache2
systemctl enable apache2
systemctl start mysql
systemctl enable mysql

cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
chown -R www-data:www-data wordpress
chmod -R 755 wordpress

systemctl restart apache2
