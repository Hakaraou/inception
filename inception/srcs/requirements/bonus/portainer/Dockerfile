FROM alpine:3.18

RUN mkdir -p /var/lib/portainer && \
	adduser -D -h /var/lib/portainer portainer

RUN apk add --no-cache curl tar && \
	curl -L https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz | tar -xz && \
	mv portainer /usr/local && \
    chmod +x /usr/local && \
	rm -rf portainer-2.19.4-linux-amd64.tar.gz

CMD [ "/usr/local/portainer/portainer", "--bind", "0.0.0.0:2112"]
