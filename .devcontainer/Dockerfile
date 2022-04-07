ARG BASE_IMAGE="ubuntu:20.04"
FROM $BASE_IMAGE

LABEL maintainer="Jiri Klic <web@jiriklic.com>"

ARG USER_NAME="defaultname"
ARG GROUP_NAME=$USER_NAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG NODE_VERSION="14"
ARG PYTHON_VERSION="3.9.12"
 
# Configure environment
ENV SHELL=/bin/bash \    
    HOME=/home/$USER_NAME \
    PYENV_ROOT=/home/$USER_NAME/.pyenv

ENV PATH=$PYENV_ROOT/bin:$PYENV_ROOT/shims:$HOME/.local/bin:$PATH

# Create the user
RUN apt-get update && apt-get install -y sudo \
    # Ensure sudo group users are not asked for a password
    # when using sudo command by ammending sudoers file
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    # create new group and user
    && groupadd -g $USER_GID $GROUP_NAME \
    && useradd -l -u $USER_UID -g $GROUP_NAME -ms $SHELL $USER_NAME \
    && usermod -aG sudo $USER_NAME

USER $USER_NAME

RUN sudo apt update && sudo apt install -y \
        software-properties-common \
    && sudo add-apt-repository ppa:git-core/ppa -y \
    && sudo add-apt-repository ppa:longsleep/golang-backports -y \
    && sudo apt update && sudo apt install -y \
        # install Python build dependencies
        git make build-essential libssl-dev zlib1g-dev libreadline-dev \
        libsqlite3-dev libbz2-dev zip maven wget curl llvm \
        # install Go
        golang-go \
    # install pyenv
    && curl https://pyenv.run | bash \
    # install python
    && pyenv install $PYTHON_VERSION \
    && pyenv global $PYTHON_VERSION \
    # install poetry
    && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - \
    # install nvm
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" \
    # loads nvm
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    # loads nvm bash_completion
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
    && nvm install $NODE_VERSION \
    && npm install --global yarn
