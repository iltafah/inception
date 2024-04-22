FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add nginx && apk add openssl

RUN mkdir /var/www/html

COPY ./default.conf /etc/nginx/http.d/

CMD nginx -g "daemon off;"

EXPOSE 443
