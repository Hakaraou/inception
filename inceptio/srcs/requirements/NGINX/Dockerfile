FROM debian:bullseye

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y nginx openssl && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -newkey rsa:2048 \
		-keyout /etc/ssl/private/inception.key \
		-out /etc/ssl/certs/inception.crt \
		-days 365 \
		-subj "/C=MA/ST=Khouribga/L=City/O=42/OU=42/CN=${DOMAIN_NAME}/UID=admin_name"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 443

CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]
