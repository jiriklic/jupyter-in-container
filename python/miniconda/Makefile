.PHONY: all
all: help

IMAGE_NAME="miniconda-img"

build:
	@echo "Building Docker image.."
	@mkdir -p notebooks
	@docker compose build --no-cache

run:
	@echo "Starting container.."
	@docker compose run --rm condalab /bin/bash

clean:
	@echo "Deleting Docker image.."
	@docker image rm $(IMAGE_NAME)

help:
	@echo "Available make targets:"
	@echo " make help         - Print help"
	@echo " make build        - Build Docker image"
	@echo " make up           - Create and start container"
	@echo " make down         - Stop and remove container"
	@echo " make clean        - Delete Docker image"
	@echo ""