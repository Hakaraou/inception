FROM node:8 

LABEL maintainer="yourEmail@example.com"

RUN npm install

ADD hello.js /hello.js

EXPOSE 8888

ENTRYPOINT [ "node", "hello.js" ]