FROM alpine:3.19

RUN apk upgrade && apk update
RUN apk add curl mariadb mariadb-client mariadb-openrc openrc

COPY tools/exe.sh /tmp/
RUN chmod +x /tmp/exe.sh

RUN sed -i "s|#bind-address=0.0.0.0|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i "s|skip-networking|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["/tmp/exe.sh"]

CMD /usr/bin/mariadbd-safe --datadir='/var/lib/mysql'

# CMD mysqld_safe

# CMD tail -f /dev/null

EXPOSE 3306
