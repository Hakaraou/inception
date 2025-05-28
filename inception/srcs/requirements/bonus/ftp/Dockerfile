FROM debian:bullseye

RUN apt-get -y update && \
    apt-get install -y vsftpd && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./tools/ftp-set.sh /ftp-set.sh
RUN chmod +x /ftp-set.sh

RUN mkdir -p /run/vsftpd/empty
RUN chmod 755 /run/vsftpd/empty

CMD [ "/ftp-set.sh" ]
