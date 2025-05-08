#!/bin/bash

service mariadb start

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';" #ask
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${MDB_ROOT_PASSWORD} shutdown

exec mysqld_safe --bind-address=0.0.0.0 --datadir='/var/lib/mysql' --user=mysql
