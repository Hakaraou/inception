FROM alpine:3.18

RUN apk add --no-cache nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY html/ /home/html

# RUN mkdir -p /run/nginx

CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]
