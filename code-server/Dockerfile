ARG BASE=ubuntu:jammy-20240212
FROM $BASE

LABEL maintainer="Jiri Klic <web@jiriklic.com>"

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME="deltodon"
ARG GROUP_NAME="deltodon"
ARG CODE_VERSION="4.21.2"
ARG PYTHON_VERSION="3.10.12"
ARG NVM_VERSION="0.39.7"


# Configure environment
ENV SHELL=/bin/bash \
    USER_NAME=$USER_NAME \
    USER_ID=$USER_ID \
    GROUP_ID=$GROUP_ID \
    GROUP_NAME=$GROUP_NAME \
    CODE_VERSION=$CODE_VERSION \
    PYTHON_VERSION=$PYTHON_VERSION \
    NVM_VERSION=$NVM_VERSION \
    PATH=/home/$USER_NAME/.local/bin:$PATH \
    HOME=/home/$USER_NAME


RUN apt-get update && apt-get install -y \
        sudo \
        git \
    # Ensure sudo group users are not 
    # asked for a password when using 
    # sudo command by ammending sudoers file
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    # create new group and user
    && groupadd -g $GROUP_ID $GROUP_NAME \
    && useradd -l -u $USER_ID -g $GROUP_NAME -ms $SHELL $USER_NAME \
    && usermod -aG sudo $USER_NAME \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

USER $USER_NAME

WORKDIR $HOME

RUN mkdir src && chown -R $USER_NAME:$GROUP_NAME . 

WORKDIR $HOME/src

RUN export DEBIAN_FRONTEND=noninteractive \
    # Fix debconf error message
    && echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections \
    # Fetch system updates
    && sudo apt-get update -y \
    # Install Python build essentials
    &&sudo apt-get -qq install -y make build-essential \
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
    && poetry completions bash >> ~/.bash_completion \
    # Install nvm and Node.JS
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm \
    && nvm install --lts \
    && npm install --global yarn \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

RUN curl -fOL https://github.com/coder/code-server/releases/download/v${CODE_VERSION}/code-server_${CODE_VERSION}_amd64.deb \
    && sudo dpkg -i code-server_${CODE_VERSION}_amd64.deb \
    && rm code-server_4.21.2_amd64.deb

RUN code-server --version

# install extensions
RUN code-server --install-extension 4ops.terraform \
    && code-server --install-extension bierner.markdown-mermaid \
    && code-server --install-extension bierner.markdown-preview-github-styles \
    && code-server --install-extension hashicorp.hcl \
    && code-server --install-extension julialang.language-julia \
    && code-server --install-extension ms-azuretools.vscode-docker \
    && code-server --install-extension ms-python.isort \
    && code-server --install-extension ms-python.python \
    && code-server --install-extension ms-toolsai.jupyter \
    && code-server --install-extension ms-toolsai.jupyter-keymap \
    && code-server --install-extension ms-toolsai.jupyter-renderers \
    && code-server --install-extension ms-toolsai.vscode-jupyter-cell-tags \
    && code-server --install-extension ms-toolsai.vscode-jupyter-slideshow \
    && code-server --install-extension ms-vscode.cmake-tools \
    && code-server --install-extension ms-vscode.cpptools-themes \
    && code-server --install-extension ms-vscode.makefile-tools \
    && code-server --install-extension njpwerner.autodocstring \
    && code-server --install-extension redhat.vscode-yaml \
    && code-server --install-extension tomoki1207.pdf \
    && code-server --install-extension twxs.cmake \
    && code-server --install-extension vscode-icons-team.vscode-icons

# add custom settings
COPY --chown=$USER_NAME:$GROUP_NAME ./vscode/ $HOME/.local/share/code-server/User/


ENTRYPOINT ["code-server", "--auth", "none", "."]