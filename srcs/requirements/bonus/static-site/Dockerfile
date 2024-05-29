FROM alpine:3.19

RUN apk upgrade && apk update

RUN apk add npm apache2

WORKDIR /var/www/localhost/htdocs

COPY ./tools .

RUN chmod 755 .

RUN npm install vanilla-tilt@1.8.1

CMD /usr/sbin/httpd -D FOREGROUND

EXPOSE 80
