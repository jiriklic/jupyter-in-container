.PHONY: all
all: help

IMAGE_NAME="base-img"

build:
	@echo "Building Docker image.."
	@docker compose build --no-cache

run:
	@echo "Starting container.."
	@docker compose run --rm testbase /bin/bash

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