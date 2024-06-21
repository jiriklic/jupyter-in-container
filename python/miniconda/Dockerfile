ARG UBUNTU_TAG
FROM ubuntu:${UBUNTU_TAG:-jammy-20240227}

LABEL maintainer="Jiri Klic <web@jiriklic.com>"

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME="unknown"
ARG GROUP_NAME="unknown"
ARG CONDA_VERSION="py311_24.1.2-0"

# Configure environment
ENV SHELL=/bin/bash \
    USER_NAME=$USER_NAME \
    USER_ID=$USER_ID \
    GROUP_NAME=$GROUP_NAME \
    GROUP_ID=$GROUP_ID \
    PATH=/home/$USER_NAME/.local/bin:/home/$USER_NAME/conda/bin:$PATH \
    HOME=/home/$USER_NAME \
    CONDA_DIR=/home/$USER_NAME/conda 

RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        sudo \
        ca-certificates \
        openssh-client \
        wget \
    # Ensure sudo group users are not 
    # asked for a password when using 
    # sudo command by ammending sudoers file
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    # create new group and user
    && groupadd -g $GROUP_ID $GROUP_NAME \
    && useradd -l -u $USER_ID -g $GROUP_NAME -ms $SHELL $USER_NAME \
    && usermod -aG sudo $USER_NAME \
    # clean Docker Cache
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

WORKDIR $HOME

USER $USER_NAME

RUN mkdir notebooks && chown -R $USER_NAME:$GROUP_NAME .

COPY ./environment.yml $HOME/environment.yml

RUN wget --no-hsts --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O $HOME/miniforge.sh \
    && /bin/bash $HOME/miniforge.sh -b -p $CONDA_DIR \
    && rm $HOME/miniforge.sh \
    && conda clean --tarballs --index-cache --packages --yes \
    && find ${CONDA_DIR} -follow -type f -name '*.a' -delete \
    && find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete \
    && find ${CONDA_DIR} -follow -type f -name '*.js.map' -delete \
    && conda clean --force-pkgs-dirs --all --yes \
    && conda env create -f environment.yml \
    && echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate dev" >> ${HOME}/.bashrc
