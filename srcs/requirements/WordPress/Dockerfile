FROM debian:bullseye

WORKDIR /wp-app

RUN		apt-get update && apt-get upgrade -y && \
		apt-get install -y php php-fpm \
		curl unzip \
		php-mysql mariadb-client && \
		apt-get clean && rm -rf /var/lib/apt/lists/*

COPY	./tools ./tools
COPY	./conf ./conf

RUN		chmod +x ./tools/wp-set.sh

EXPOSE	9000

ENTRYPOINT	[ "/wp-app/tools/wp-set.sh" ]