#!/bin/sh

if [ ! -d '/var/www/html/wordpress' ]; then
    mkdir -p /var/www/html/wordpress
    cd /var/www/html/wordpress
    wp core download
    wp config create --dbname=wordpress --dbuser=tofa7a --dbpass=1337 --dbhost=mariadb
    wp core install --url=localhost --title="uwu" --admin_user=tofa7a --admin_password=1337 --admin_email=tofa7a@uwu.co
    wp user create evaluator evaluator@42.fr --role=author --user_pass=1337
fi

exec "$@"