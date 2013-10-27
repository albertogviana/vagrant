debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'

echo '[Update Ubuntu Server]'
apt-get update

echo '[Prepare environment]'
apt-get install -y php5 php5-cli php5-xdebug php5-mysql phpunit php-apc php5-imagick php5-mcrypt php5-memcache php-pear mysql-server curl imagemagick php5-dev php5-curl php5-sqlite libapache2-mod-php5 apache2 memcached vim git-core mongodb memcached

echo '[Setup MySQL]'
# Enable MySQL remote access
sed -i -e 's/bind-address/#bind-address/g' /etc/mysql/my.cnf 
sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/my.cnf

mysql --user=root --password=root --host=localhost --port=3306 < mysql_bootstrap.sql

service mysql restart