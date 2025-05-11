FROM debian:bullseye

WORKDIR /app

RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y nginx openssl && \
	#ca-certificates curl && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt \
		-days 365 \
		-subj "/C=MA/ST=Khouribga/L=City/O=42/OU=42/CN=hakaraou.42.fr/UID=admin_name"

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]

# # create the ssl directory
# RUN mkdir -p /etc/nginx/ssl

# # generate the ssl certificate
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
#     /etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=42/CN=domain_name.fr/UID=admin_name"

# # copy the nginx configuration file
# COPY ./nginx.conf /etc/nginx/nginx.conf

# # create the wordpress directory
# RUN mkdir -p /var/www/wordpress

# # change the owner of the wordpress directory to www-data
# RUN chown -R www-data:www-data /var/www/wordpress
