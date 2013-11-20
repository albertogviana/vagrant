#!/bin/bash

debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'

echo '[Update Ubuntu Server]'
apt-get update

echo '[Prepare environment]'
apt-get install -y php5 php5-cli php5-xdebug php5-mysql phpunit php-apc php5-imagick php5-intl php5-mcrypt php5-memcache php5-memcached php-pear mysql-server curl imagemagick php5-dev php5-curl php5-sqlite libapache2-mod-php5 apache2 memcached vim git-core mongodb build-essential

pear config-set auto_discover 1
pear update-channels
pear upgrade-all

pecl update-channels
pecl upgrade-all

pecl install mongo

echo '[mongo]' >> /etc/php5/apache2/php.ini 
echo 'extension=mongo.so' >> /etc/php5/apache2/php.ini 

echo '[mongo]' >> /etc/php5/cli/php.ini 
echo 'extension=mongo.so' >> /etc/php5/cli/php.ini 

echo '[Setup vagrant folder]'
rm -rf /var/www
ln -fs /vagrant /var/www


path="/vagrant"
sh $path"/apache.sh"
sh $path"/mysql.sh"