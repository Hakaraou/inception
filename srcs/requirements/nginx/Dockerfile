FROM alpine:3.18

RUN apk update && apk add nginx openssl

COPY ./tools/nginx.crt /etc/nginx/ssl/nginx.crt
COPY ./tools/nginx.key /etc/nginx/ssl/nginx.key
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]