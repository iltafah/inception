#!/bin/sh

if [ ! -d '/var/www/html/wordpress' ]; then
    mkdir -p /var/www/html/wordpress
    cd /var/www/html/wordpress
    wp core download
    wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST}

    sed -i "69i\define('WP_REDIS_HOST', 'redis');/*" /var/www/html/wordpress/wp-config.php
    sed -i "69i\*/define('WP_REDIS_PORT', 6379);" /var/www/html/wordpress/wp-config.php

    wp core install --url=localhost --title="uWu" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=tofa7a@uwu.co
    wp user create ${AUTHOR_USER} evaluator@42.fr --role=author --user_pass=${AUTHOR_PASS}
    wp plugin install redis-cache --activate
    chown -R nobody:nobody /var/www/html/wordpress
    wp redis enable
fi

exec "$@"