FROM php:8.2-fpm-alpine

RUN apk update && apk add php-mysqli php-session php-curl php-exif php-gd php-xml php-mbstring

RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress /var/www/html

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD ["/setup.sh"]