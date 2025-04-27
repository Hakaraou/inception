# Makefile for testing Docker Compose and building services

# Build and start the containers
up:
	docker-compose -f srcs/docker-compose.yml up --build

# Stop the containers
down:
	docker-compose down

# Clean unused Docker images and volumes
clean:
	docker system prune -f

# Check logs
logs:
	docker-compose logs mariadb