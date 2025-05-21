FROM debian:bullseye

WORKDIR /var/www

RUN	apt-get update && \
	apt-get install -y php php-fpm curl php-mysql netcat && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY	./tools/wp-set.sh /usr/wp-set.sh

RUN		chmod +x /usr/wp-set.sh

ENTRYPOINT	[ "/usr/wp-set.sh" ]