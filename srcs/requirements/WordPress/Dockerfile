FROM debian:bullseye

WORKDIR /var/www

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y php php-fpm \
		curl \
		php-mysql mariadb-client && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

COPY	./tools/wp-set.sh /usr/wp-set.sh

RUN		chmod +x /usr/wp-set.sh

EXPOSE	9000

ENTRYPOINT	[ "/usr/wp-set.sh" ]