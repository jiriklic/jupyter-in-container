# GDAL Docker image - Ubuntu 22.04 Jammy

GDAL Docker image `gdal-ubuntu-img` with custom user and group settings.


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
make up
```

stop and delete container
```bash
make down
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

:package: [UbuntuGIS](https://launchpad.net/~ubuntugis/+archive/ubuntu/ppa)

if `add-apt-repository` is missing, run
```bash
sudo apt-get install -y software-properties-common
```

add `ubuntugis` repository
```bash
sudo add-apt-repository -y ppa:ubuntugis/ppa
sudo apt-get update
```

install GDAL
```bash
sudo apt-get install -y gdal-bin libgdal-dev
```

> **NOTE:** as of 2024-03-23 the default Ubuntu 22.04 repository installs `GDAL 3.4.1`. The ubuntugis repo installs `GDAL 3.6.4`