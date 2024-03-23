ARG GDAL_TAG
FROM ghcr.io/osgeo/gdal:${GDAL_TAG:-alpine-normal-3.8.4}

LABEL maintainer="Jiri Klic <web@jiriklic.com>"

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME="unknown"
ARG GROUP_NAME="unknown"

# Configure environment
ENV SHELL=/bin/bash \
    USER_NAME=$USER_NAME \
    USER_ID=$USER_ID \
    GROUP_NAME=$GROUP_NAME \
    GROUP_ID=$GROUP_ID \
    PATH=/home/$USER_NAME/.local/bin:$PATH \
    HOME=/home/$USER_NAME

RUN apk update && apk add \
        sudo \
        bash \
        py-pip \
        gcc \
        python3-dev \
        musl-dev \
        linux-headers \
    # Ensure sudo group users are not 
    # asked for a password when using 
    # sudo command by ammending sudoers file
    && echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
    # create new group and user
    && addgroup -g $GROUP_ID $GROUP_NAME \
    && adduser -u $USER_ID -D -G $GROUP_NAME $USER_NAME

WORKDIR $HOME

RUN mkdir notebooks && chown -R $USER_NAME:$GROUP_NAME .

COPY ./requirements.txt $HOME/requirements.txt

USER $USER_NAME

# install jupyterlab
RUN pip install -r requirements.txt

ENTRYPOINT [ "jupyter", "lab", "--ip=0.0.0.0" ]