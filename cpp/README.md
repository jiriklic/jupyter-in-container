# C++ Docker image

C++ Docker image `cpplab-img` with Xeus-Cling interactive kernel.

* Python 3.11.8
* conda 24.1.2

![](../docs/images/jupyter-cpp.PNG)


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

There is an issue in how C++ kernels are initiated when running jupyerlab from Docker `ENTRYPOINT`. So the `docker compose up` does not work well. So use instead the container in interactive mode.



start container in interactive mode
```bash
make up
```

run jupyterlab inside the container
```bash
jupyter lab
```

exit the container once you are finished with the jupyterlab
```bash
exit
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


