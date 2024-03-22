.PHONY: all
all: help

NAME="cpplab"

build:
	@echo "Building Docker image.."
	@docker compose build --no-cache

run:
	@echo "Starting container.."
	@docker compose run --rm $(NAME) /bin/bash

clean:
	@echo "Deleting Docker image.."
	@docker image rm $(NAME)-img

help:
	@echo "Available make targets:"
	@echo " make help         - Print help"
	@echo " make build        - Build Docker image"
	@echo " make run          - Start container"
	@echo " make clean        - Delete Docker image"
	@echo ""