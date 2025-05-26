FROM debian:bullseye

RUN apt-get -y update && \
    apt-get install -y vsftpd && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./tools/ftp-set.sh /ftp-set.sh

RUN chmod +x /ftp-set.sh

CMD [ "/ftp-set.sh" ]

#EXPOSE 21 30000-30009

#ports:
#	- "21:21"
#	- "30000-30009:30000-30009"


# pasv_enable=YES
# pasv_min_port=30000
# pasv_max_port=30009
