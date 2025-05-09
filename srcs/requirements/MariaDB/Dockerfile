FROM	debian:bullseye

WORKDIR /db-app

RUN		apt-get update && apt-get upgrade -y && \
		apt-get install mariadb-server -y && \
		# apt-get install netcat -y && \
		apt-get clean && rm -rf /var/lib/apt/lists/*

COPY	./tools ./tools
COPY	./conf ./conf

RUN		chmod +x ./tools/db-set.sh
		# chown -R mysql:mysql /var/lib/mysql && \
		# chown -R mysql:mysql /var/run/mysqld && \
		# chmod 777 /var/run/mysqld

EXPOSE 3306

ENTRYPOINT	[ "/db-app/tools/db-set.sh" ]