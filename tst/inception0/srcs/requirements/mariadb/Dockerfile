FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

ENV MYSQL_UNIX_PORT=/run/mysqld/mysqld.sock

COPY conf.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld"]
