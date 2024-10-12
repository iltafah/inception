FROM alpine:3.19

RUN apk upgrade && apk update

RUN apk add npm apache2

WORKDIR /var/www/localhost/htdocs

COPY ./tools .

RUN chmod -R 755 .

RUN npm install vanilla-tilt@1.8.1


RUN apk add --no-cache gettext # Install envsubst
ARG BASE_URL
ENV BASE_URL=${BASE_URL}
RUN envsubst < index.html > index_env_subst.html
RUN rm index.html && mv index_env_subst.html index.html

CMD /usr/sbin/httpd -D FOREGROUND

EXPOSE 80
