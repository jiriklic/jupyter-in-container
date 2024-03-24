.PHONY: all
all: help

.venv:
	@echo "Installing project dependencies.."
	@poetry install --no-root

clean:
	@echo "Removing .venv"
	@rm -rf .venv

help:
	@echo "Available make targets:"
	@echo " make help         - Print help"
	@echo " make .venv        - Print out project configurations"
	@echo " make clean        - Remove all build output"
	@echo ""