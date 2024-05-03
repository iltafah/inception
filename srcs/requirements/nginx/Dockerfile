FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add nginx && apk add openssl

RUN mkdir /var/www/html
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" \
    -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY conf/default.conf /etc/nginx/http.d/

CMD nginx -g "daemon off;"

EXPOSE 443
