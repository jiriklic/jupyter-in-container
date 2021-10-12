#!/bin/bash

echo "**************************** build jupyterlab-img ******************************"
docker build \
        -t jupyterlab-img \
        --build-arg USER_ID=$(id -u ${USER}) \
        --build-arg GROUP_ID=$(id -g ${USER}) \
        --build-arg USER_NAME=$(id -un ${USER}) \
        --build-arg GROUP_NAME=$(id -gn ${USER}) \
        --no-cache .

echo "OK"