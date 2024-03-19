# Base Docker image

Build base Docker image `base-img` with custom user and group settings. This image can be used in interactive mode as installation test bed.



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

run container in interactive mode
```bash
make run
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
