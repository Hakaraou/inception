COMPOSE = docker-compose -f ./srcs/docker-compose.yml

up:
	$(COMPOSE) up

upd:
	$(COMPOSE) up -d

build:
	$(COMPOSE) build

downv:
	$(COMPOSE) down -v

down:
	$(COMPOSE) down

clean: downv
	$(COMPOSE) rm -vf

cleanall: clean
	docker rmi -f $$(docker images -aq)

logs:
	$(COMPOSE) logs -f

restart: down up

.PHONY: build up down clean logs restart