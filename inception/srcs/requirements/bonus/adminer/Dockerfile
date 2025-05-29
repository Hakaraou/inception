FROM debian:bookworm-slim

RUN	apt-get update && \
	apt-get install -y wget php php-mysqli php-json && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

ENTRYPOINT [ "php", "-S", "0.0.0.0:99", "-t", "/var/www/html" ]