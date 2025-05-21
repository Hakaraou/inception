FROM	debian:bullseye

RUN		apt-get update && \
		apt-get install mariadb-server mariadb-client -y && \
		apt-get clean && rm -rf /var/lib/apt/lists/*

RUN		mkdir -p /var/lib/mysql && \
		chown -R mysql:mysql /var/lib/mysql && \
		mkdir -p /var/run/mysqld && \
		chown -R mysql:mysql /var/run/mysqld

COPY	./tools ./tools

RUN		chmod +x ./tools/db-set.sh

ENTRYPOINT	[ "./tools/db-set.sh" ]