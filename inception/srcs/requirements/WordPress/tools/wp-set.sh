#!/bin/bash

set -x

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php

cd /var/www/html

wp core download --allow-root

sleep 5

MARIADB_PASSWORD=$(cat /run/secrets/db_user_password)
WP_ADMIN_PASS=$(cat /run/secrets/wp_admin_password)
WP_USER_PASS=$(cat /run/secrets/wp_user_password)

wp config create \
	--dbname=$MARIADB_DATABASE \
	--dbuser=$MARIADB_USER \
	--dbpass=$MARIADB_PASSWORD \
	--dbhost=$MARIADB_HOST:3306 \
	--allow-root

chown -R www-data:www-data /var/www/html
chmod 640 wp-config.php

wp core install \
	--url="$DOMAIN_NAME" \
	--title="$WP_TITLE" \
	--admin_user="$WP_ADMIN_USER" \
	--admin_password="$WP_ADMIN_PASS" \
	--admin_email="$WP_ADMIN_EMAIL" \
	--allow-root

wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" \
	--user_pass="$WP_USER_PASS" \
	--role="$WP_USER_ROLE" \
	--allow-root

#bonus
wp plugin install redis-cache --activate
wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp redis enable --allow-root
#bonus

exec /usr/sbin/php-fpm7.4 -F
