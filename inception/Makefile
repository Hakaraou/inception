COMPOSE = docker-compose -f ./srcs/docker-compose.yml

up:
	mkdir -p /Users/hakaraou/Desktop/data/wordpress_wp
	mkdir -p /Users/hakaraou/Desktop/data/wordpress_db
	chmod -R 755 /Users/hakaraou/Desktop/data/
	$(COMPOSE) up

up-d:
	mkdir -p /Users/hakaraou/Desktop/data/wordpress_wp
	mkdir -p /Users/hakaraou/Desktop/data/wordpress_db
	chmod -R 755 /Users/hakaraou/Desktop/data/
	$(COMPOSE) up -d

build:
	mkdir -p /Users/hakaraou/Desktop/data/wordpress_wp
	mkdir -p /Users/hakaraou/Desktop/data/wordpress_db
	chmod -R 755 /Users/hakaraou/Desktop/data/
	$(COMPOSE) build

down-v:
	$(COMPOSE) down -v

down:
	$(COMPOSE) down

clean: down-v
	$(COMPOSE) rm -vf

clean-all: clean
	@if [ -n "$$(docker images -aq)" ]; then \
		docker rmi -f $$(docker images -aq); \
	fi
	@if [ -d "/Users/hakaraou/Desktop/data" ]; then \
		rm -rf /Users/hakaraou/Desktop/data; \
	fi

restart: down up

re: clean-all up-d

logs:
	$(COMPOSE) logs -f

.PHONY: build up up-d down down-v clean clean-all logs restart re