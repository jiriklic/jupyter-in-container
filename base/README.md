# Base Docker image

Build base Docker image `jupyterlab-img` with same user and group settings as on the host machine.

### Platform

The setup is tested on Ubuntu 20.04.2 LTS. 


### Usage

first pre-build the `jupyterlab-img` image by running the `build.sh` script
```
./build.sh
```

then run with `docker-compose`
```
docker-compose up
```

The `jupyterlab-img` image can also run GUI applications from Docker container. See OpenAI Gym example in **[notebooks](./notebooks)** to see how it is done.


### Requirements

* **[Docker](https://docs.docker.com/engine/install/ubuntu/)**

* **[Docker Compose](https://docs.docker.com/compose/install/)**


