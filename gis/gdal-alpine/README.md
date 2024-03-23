# GDAL Docker image - Alpine linux

GDAL Docker image `gdal-alpine-img` with custom user and group settings.



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

:whale: [OSGeo/gdal/docker](https://github.com/OSGeo/gdal/tree/master/docker)

> **WARNING!** as of 2024-03-23 (release 3.8.4) the Ubuntu based Docker images are broken. Trying to run `apt-get update` inside Dockerfile will return a build error
> ```
> E: Failed to fetch https://apache.jfrog.io/artifactory/arrow/ubuntu/dists/jammy/InRelease  Clearsigned file isn't valid, got 'NOSPLIT' (does the network require authentication?)
> E: The repository 'https://apache.jfrog.io/artifactory/arrow/ubuntu jammy InRelease' is not signed.
> ```
> Use Alpine based images instead.

:book: [Alpine Package Keeper](https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper)
