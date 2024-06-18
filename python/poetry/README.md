# Docker Python with Poetry

Python Docker image `poetry-img` with custom user and group settings.

* Python 3.11.8


### Platform

The setup was tested on host machine OS

* Ubuntu Focal 20.04 (LTS)


### Requirements

* **[Docker >= 25.0.4](https://docs.docker.com/engine/install/ubuntu/)**

* **[Docker Compose V2](https://docs.docker.com/compose/install/linux/#install-using-the-repository)**


### Setup

build Docker image
```bash
make build
```


### Usage

create and start container
```bash
make run
```

install poetry dependencies
```bash
poetry install --no-root
```

view all `make` options
```bash
make help
```


### Clean up

delete the image once you do not need it
```bash
make clean
```


### Reference material

:book: [Poetry](https://python-poetry.org/)
