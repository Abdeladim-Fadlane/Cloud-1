#!bin/sh
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|' etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/wordpress

while ! mariadb -h mariadb -u $SQL_USER -p$SQL_PASSWORD;
do
    echo "waiting..."
    sleep 2
done 
echo "MariaDB is up and running. "

if [ -f "wp-config.php" ]; then
    echo "The 'wp-config.php' file already exists."
else
    wp config create	--allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=mariadb 
fi

wp core install --url=${DOMAIN_NAME} --title=${INCEPTIONABOUASSI} --admin_user=${WP_USER} --admin_password=${WP_PW} --admin_email=${WP_EMAIL} --skip-email --allow-root

if wp user get $U_WP_USER --allow-root > /dev/null 2>&1 ; then
    echo "The '$U_WP_USER' username is already registered."
else
    wp user create $U_WP_USER $U_WP_EMAIL --role=${U_WP_ROLE} --user_pass=${U_WP_PW} --allow-root
fi

exec php-fpm7.4 -F