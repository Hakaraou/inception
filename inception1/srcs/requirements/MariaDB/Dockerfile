FROM	debian:bullseye

WORKDIR /db-app

RUN		apt-get update && apt-get upgrade -y && \
		apt-get install mariadb-server -y && \
		apt-get clean && rm -rf /var/lib/apt/lists/*

RUN		mkdir -p /var/lib/mysql && \
		chown -R mysql:mysql /var/lib/mysql && \
		mkdir -p /var/run/mysqld && \
		chown -R mysql:mysql /var/run/mysqld

COPY	./tools ./tools

RUN		chmod +x ./tools/db-set.sh

EXPOSE 3306

ENTRYPOINT	[ "/db-app/tools/db-set.sh" ]