# Variables
COMPOSE_FILE = docker-compose.yml

# Default target
.PHONY: all
all: build

# Build the Docker images
.PHONY: build
build:
	docker-compose -f $(COMPOSE_FILE) build

# Start the application
.PHONY: up
up:
	docker-compose -f $(COMPOSE_FILE) up -d

# Stop the application
.PHONY: down
down:
	docker-compose -f $(COMPOSE_FILE) down

# Restart the application
.PHONY: restart
restart: down up

# Clean up Docker images, containers, and volumes
.PHONY: clean
clean:
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans

# Display the logs of the services
.PHONY: logs
logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

# List all running containers
.PHONY: ps
ps:
	docker-compose -f $(COMPOSE_FILE) ps