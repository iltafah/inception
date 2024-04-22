FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add curl php82 php82-phar php82-fpm
RUN mkdir -p /var/www/html/

RUN echo "<?php echo phpinfo();?>" > /var/www/html/index.php

RUN sed -i "s|127.0.0.1:9000|0.0.0.0:9000|g" /etc/php82/php-fpm.d/www.conf

CMD php-fpm82 -F

EXPOSE 9000
