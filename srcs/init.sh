### Config Access. www-data user for NginX. rwx, r-x, r-x (User, Group, Others)
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

### NginX Setup: Nginx server blocks configuration files are stored in
# /etc/nginx/sites-available directory, which are enabled through symbolic links
# to the /etc/nginx/sites-enabled/ directory.
mkdir /var/www/localhost
cp /tmp/conf-nginx /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled

### SSL creation (self signed for site: localhost)
# Resource: https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-debian-10
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42 Madrid/OU=lucimart/CN=localhost"

### MariaDB (MySQL) Setup
# service is adequate for basic service management, while directly calling systemctl give greater control options.
service mysql start
# To explicitly specify that there is no password and that mysql should not prompt for one, use the --skip-password option. (-u short for --user)
# Create a new database:
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
# GRANT the PRIVILEGES of type ALL (thus everything of course)
# These privileges are for 'wordpress' and it applies to all tables of that database, which is indicated by the .* that follows.
# These privileges are assigned to 'root' when that user is connected through locally, as specified by @'localhost'
# WITH GRANT OPTION privilege enables you to give to other users or remove from other users those privileges that you yourself possess.
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
#when we grant some privileges for a user, running the command flush privileges will reloads the grant
# tables in the mysql database enabling the changes to take effect without reloading or restarting mysql service.
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
# SET on the mysql.user table for user 'root' the plugin mysql_native_password.
# it's the traditional method to authenticate- it is not very secure (it uses just a hash of the password), but it is compatible with older drivers.
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password

### phpMyAdmin Setup (_ is a shell parameter, it expands to last argument of previous command.)
# -x (extract) -f (file)
cd /var/www/localhost/
mv /tmp/phpMyAdmin-latest-all-languages.tar.gz .
tar -xf phpMyAdmin-latest-all-languages.tar.gz && rm "$_"
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv /tmp/conf-phpmyadmin.inc.php /var/www/localhost/phpmyadmin/config.inc.php

### Wordpress Setup
mv /tmp/latest.tar.gz /var/www/localhost/ && cd "$_"
tar -xf latest.tar.gz && rm "$_"
mv /tmp/conf-wp.php /var/www/localhost/wordpress/wp-config.php

### Service starter
service nginx start
service php7.3-fpm start