.PHONY: all
all: help

NAME="rasterio"

build:
	@echo "Building Docker image.."
	@docker compose build --no-cache

up:
	@echo "Creating and starting container.."
	@docker compose up

down:
	@echo "Stopping and removing container.."
	@docker compose down

clean:
	@echo "Deleting Docker image.."
	@docker image rm $(NAME)-img

help:
	@echo "Available make targets:"
	@echo " make help         - Print help"
	@echo " make build        - Build Docker image"
	@echo " make up           - Create and start container"
	@echo " make down         - Stop and remove container"
	@echo " make clean        - Delete Docker image"
	@echo ""