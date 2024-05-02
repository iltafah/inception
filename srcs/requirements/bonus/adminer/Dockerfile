FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add wget php82 php82-mysqli php82-session uwu

RUN mkdir -p /var/www/html/
RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

CMD php -S 0.0.0.0:8080 /var/www/html/adminer.php

EXPOSE 8080
