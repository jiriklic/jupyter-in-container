.PHONY: all
all: help

IMAGE_NAME="poetry-img"

build:
	@echo "Building Docker image.."
	@mkdir -p src/notebooks
	@docker compose build --no-cache

run:
	@echo "Starting container.."
	@docker compose run --rm poetrylab /bin/bash

clean:
	@echo "Deleting Docker image.."
	@docker image rm $(IMAGE_NAME)

help:
	@echo "Available make targets:"
	@echo " make help         - Print help"
	@echo " make build        - Build Docker image"
	@echo " make run          - Start container"
	@echo " make clean        - Delete Docker image"
	@echo ""