#!/bin/sh

openrc && touch /run/openrc/softlevel
rc-service mariadb setup
# /etc/init.d/mariadb setup
rc-service mariadb start

mariadb -e "CREATE DATABASE wordpress";
mariadb -e "CREATE USER '${DB_USER}'@'%.${DOCKER_NETWORK}' IDENTIFIED BY '${DB_PASS}'";
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'tofa7a'@'%.${DOCKER_NETWORK}'";
mariadb -e "FLUSH PRIVILEGES";

rc-service mariadb stop


exec "$@"




# docker run -it --name mariadbtest -e MYSQL_ROOT_PASSWORD=mypass -p 3306:3306 -d docker.io/library/mariadb:10.3 bash


# docker run --name some-mariadb -e MARIADB_ROOT_PASSWORD=password -d mariadb:10.11.5
