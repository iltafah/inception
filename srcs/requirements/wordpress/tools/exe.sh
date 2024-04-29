#!/bin/sh

if [ ! -d '/var/www/html/wordpress' ]; then
    mkdir -p /var/www/html/wordpress
    cd /var/www/html/wordpress
    wp core download
    wp config create --dbname=wordpress --dbuser=tofa7a --dbpass=1337 --dbhost=mariadb

    sed -i "69i\define('WP_REDIS_HOST', 'redis');/*" /var/www/html/wordpress/wp-config.php
    sed -i "69i\*/define('WP_REDIS_PORT', 6379);" /var/www/html/wordpress/wp-config.php

    wp core install --url=localhost --title="uwu" --admin_user=tofa7a --admin_password=1337 --admin_email=tofa7a@uwu.co
    wp user create evaluator evaluator@42.fr --role=author --user_pass=1337
    wp plugin install redis-cache --activate
    chown -R nobody:nobody /var/www/html/wordpress
    wp redis enable
fi

exec "$@"