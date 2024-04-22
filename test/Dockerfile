FROM mariadb:10.11.5

RUN apt update && apt install curl php php-fpm php-mysqli php-phar -y
RUN mkdir -p /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/local/bin/wp

# COPY script.sh /tmp


# RUN chmod +x /tmp/script.sh

# ENTRYPOINT [ "/tmp/script.sh" ]

# wp core download --path="/var/www/html" 

# wp config create --dbname=wordpress --dbuser=tofa7a --dbpass=1337 --path="/var/www/html"