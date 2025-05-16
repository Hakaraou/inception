#!/bin/bash

set -e

wp core download --allow-root

sleep 5

wp config create \
	--dbname=$WP_DB_NAME \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=$WP_DB_HOST:3306 \
	--allow-root

mkdir -p /run/php
chown -R www-data:www-data /var/www/html
chmod 777 wp-config.php

wp core install \
	--url="$WP_SITE_URL" \
	--title="$WP_TITLE" \
	--admin_user="$WP_ADMIN_USER" \
	--admin_password="$WP_ADMIN_PASS" \
	--admin_email="$WP_ADMIN_EMAIL" \
	--allow-root

wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" \
	--user_pass="$WP_USER_PASS" \
	--role="$WP_USER_ROLE" \
	--allow-root

exec /usr/sbin/php-fpm7.4 -F
