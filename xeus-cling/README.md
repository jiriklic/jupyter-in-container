# Xeus-Cling Docker image

Xeus-Cling Docker image with interactive C++ kernel.

### Platform

The setup is tested on Ubuntu 20.04.2 LTS. 


### Usage

first pre-build the `jupyterlab-img` image using instructions in **[base](../base)**

then navigate back to this directory
```
cd xeus-cling/
```

and run with `docker-compose`
```
docker-compose up
```

The `jupyterlab-img` image can also run GUI applications from Docker container. See OpenAI Gym example in **[base/notebooks](./notebooks)** to see how it is done.


### Requirements

* **[Docker](https://docs.docker.com/engine/install/ubuntu/)**

* **[Docker Compose](https://docs.docker.com/compose/install/)**


