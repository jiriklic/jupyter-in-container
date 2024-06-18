ARG UBUNTU_TAG
FROM ubuntu:${UBUNTU_TAG:-jammy-20240227}

LABEL maintainer="Jiri Klic <web@jiriklic.com>"

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME="unknown"
ARG GROUP_NAME="unknown"
ARG PYTHON_VERSION="3.11.8"

# Configure environment
ENV SHELL=/bin/bash \
    USER_NAME=$USER_NAME \
    USER_ID=$USER_ID \
    GROUP_NAME=$GROUP_NAME \
    GROUP_ID=$GROUP_ID \
    PYTHON_VERSION=$PYTHON_VERSION \
    PATH=/home/$USER_NAME/.local/bin:$PATH \
    HOME=/home/$USER_NAME

RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        sudo \
        ca-certificates \
        openssh-client \
        wget \
        git \
    # Ensure sudo group users are not 
    # asked for a password when using 
    # sudo command by ammending sudoers file
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    # create new group and user
    && groupadd -g $GROUP_ID $GROUP_NAME \
    && useradd -l -u $USER_ID -g $GROUP_NAME -ms $SHELL $USER_NAME \
    && usermod -aG sudo $USER_NAME

WORKDIR $HOME

USER $USER_NAME

RUN export DEBIAN_FRONTEND=noninteractive \
    # Fix debconf error message
    && echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections \
    # Fetch system updates
    && sudo apt-get update -y \
    # Install Python build essentials
    && sudo apt-get -qq install -y make build-essential \
        libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
        libsqlite3-dev wget curl llvm libncursesw5-dev \
        xz-utils tk-dev libxml2-dev libxmlsec1-dev \
        libffi-dev liblzma-dev python3-dev \
    # Install pyenv
    && curl https://pyenv.run | bash \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> ~/.bashrc \
    && export PYENV_ROOT="$HOME/.pyenv" \
    && command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" \
    && eval "$(pyenv init -)" \
    # Install Python
    && pyenv install $PYTHON_VERSION \
    && pyenv global $PYTHON_VERSION \
    # Install Poetry
    && curl -sSL https://install.python-poetry.org | python3 - \
    && echo 'export POETRY_HOME="$HOME/.local/bin"' >> ~/.bashrc \
    && echo 'export PATH="$POETRY_HOME:$PATH"' >> ~/.bashrc \
    && export POETRY_HOME="$HOME/.local/bin" \
    && export PATH="$POETRY_HOME:$PATH" \
    && poetry completions bash >> ~/.bash_completion

RUN mkdir -p src/notebooks && chown -R $USER_NAME:$GROUP_NAME .

WORKDIR $HOME/src
