ARG PYTHON_TAG
FROM python:${PYTHON_TAG:-3.11.8-bookworm}

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

RUN apt-get update && apt-get install -y \
        sudo \
    # Ensure sudo group users are not 
    # asked for a password when using 
    # sudo command by ammending sudoers file
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    # create new group and user
    && groupadd -g $GROUP_ID $GROUP_NAME \
    && useradd -l -u $USER_ID -g $GROUP_NAME -ms $SHELL $USER_NAME \
    && usermod -aG sudo $USER_NAME

WORKDIR $HOME

RUN mkdir notebooks && chown -R $USER_NAME:$GROUP_NAME .

COPY ./requirements.txt $HOME/requirements.txt

USER $USER_NAME

# install jupyterlab
RUN pip install -r requirements.txt

ENTRYPOINT [ "jupyter", "lab", "--ip=0.0.0.0" ]