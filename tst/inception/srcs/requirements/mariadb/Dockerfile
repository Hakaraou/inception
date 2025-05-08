FROM	debian:bullseye

RUN		apt-get update && apt-get upgrade -y && \
		apt-get install mariadb-server -y && \
		apt-get install netcat -y && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/*

COPY	./tools /tools
# COPY	./conf /var/lib/mysql/conf.d/

RUN		chmod +x ./tools/*
		# chown -R mysql:mysql /var/lib/mysql && \
		# chown -R mysql:mysql /var/run/mysqld && \
		# chmod 777 /var/run/mysqld
ENTRYPOINT	[ "/tools/setup.sh" ]