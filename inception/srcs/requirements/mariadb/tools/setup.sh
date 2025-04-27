#!/bin/bash

service mariadb start

until mysqladmin ping -h localhost --silent; do
  echo "Waiting for database server to be ready..."
  sleep 2
done

mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MDB_NAME}.* TO '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASS}';"

# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';"

mysql -u root -p${MDB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p${MDB_ROOT_PASSWORD} shutdown

exec mysqld_safe --user=mysql
