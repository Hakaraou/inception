FROM debian:bookworm-slim

RUN apt-get -y update && \
    apt-get install -y redis-server && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g" /etc/redis/redis.conf

RUN sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf

RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]

# RUN     chmod -R 755 /etc/redis/*