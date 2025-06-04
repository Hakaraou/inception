COMPOSE = docker-compose -f ./srcs/docker-compose.yml

	# mkdir -p /home/hakaraou/data/wordpress_db
	# mkdir -p /home/hakaraou/data/wordpress_wp
	# chmod -R 775 /home/hakaraou/data

up:
	$(COMPOSE) up

up-d:
	$(COMPOSE) up -d

build:
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

restart: down up

re: clean-all up-d

logs:
	$(COMPOSE) logs -f

.PHONY: build up up-d down down-v clean clean-all logs restart re