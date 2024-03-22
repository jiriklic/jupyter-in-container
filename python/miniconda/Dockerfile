ARG UBUNTU_TAG
FROM ubuntu:${PYTHON_TAG:-jammy-20240227}

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
    PATH=/home/$USER_NAME/.local/bin:/opt/conda/bin:$PATH \
    HOME=/home/$USER_NAME

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
    && usermod -aG sudo $USER_NAME

WORKDIR $HOME

RUN wget "https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh" -O miniconda.sh -q \
    && mkdir -p /opt \
    && bash miniconda.sh -b -p /opt/conda \
    && rm miniconda.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
    && echo "conda activate base" >> ~/.bashrc \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
    && /opt/conda/bin/conda clean -afy

RUN mkdir notebooks && chown -R $USER_NAME:$GROUP_NAME .

COPY ./requirements.txt $HOME/requirements.txt

USER $USER_NAME

RUN . /opt/conda/etc/profile.d/conda.sh \
    && conda activate base \
    # install jupyterlab
    && pip install -r requirements.txt

ENTRYPOINT [ "jupyter", "lab", "--ip=0.0.0.0" ]