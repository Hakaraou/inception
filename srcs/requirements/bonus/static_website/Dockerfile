FROM alpine:3.18

RUN apk add --no-cache nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./index.html /home/html

CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]
