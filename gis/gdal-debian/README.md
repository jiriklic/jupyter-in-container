# GDAL Docker image - Debian linux

GDAL Docker image `gdal-debian-img` with custom user and group settings.


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

:package: [PyPI GDAL 3.8.4 - Dependencies](https://pypi.org/project/GDAL/)

* libgdal (3.8.4 or greater) and header files (gdal-devel)
* numpy (1.0.0 or greater) and header files (numpy-devel) (not explicitly required, but many examples and utilities will not work without it)

:book: [Install GDAL/OGR](https://mothergeo-py.readthedocs.io/en/latest/development/how-to/gdal-ubuntu-pkg.html#install-gdal-ogr)

:newspaper: [ImportError: cannot import name '_gdal_array' from 'osgeo'](https://stackoverflow.com/questions/75372275/importerror-cannot-import-name-gdal-array-from-osgeo)

fixed with
```bash
pip install --no-cache-dir --force-reinstall "GDAL[numpy]==$(gdal-config --version)" 
```
