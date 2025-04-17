all: up

up:
	docker compose -f docker-compose.yml up --build -d

down:
	docker compose -f docker-compose.yml down

clean: down
	sudo rm -rf /home/hakaraou/data/*

fclean: clean
	docker system prune -a

re: fclean up