FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add curl php82 php82-fpm php82-mysqli php82-phar php82-mbstring
RUN sed -i "s|127.0.0.1:9000|0.0.0.0:9000|g" /etc/php82/php-fpm.d/www.conf
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html/
COPY tools/exe.sh /tmp/
RUN chmod +x /tmp/exe.sh

ENTRYPOINT ["/tmp/exe.sh"]

CMD php-fpm82 -F

EXPOSE 9000
