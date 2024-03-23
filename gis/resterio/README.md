# Resterio Docker image

Python Docker image `rasterio-img` with custom user and group settings.



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

:book: [Rasterio](https://rasterio.readthedocs.io/en/stable/)

:book: [Shapely](https://shapely.readthedocs.io/en/stable/manual.html)

:book: [GeoPandas](https://geopandas.org/en/stable/)
