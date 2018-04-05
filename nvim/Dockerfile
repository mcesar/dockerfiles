FROM alpine

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        neovim \
        python \
        nodejs nodejs-npm \
        xclip \
        git \
    && apk add --no-cache --virtual build-deps \
        python-dev \
        py2-pip \
        curl \
        openssh-client \
        musl-dev \
        gcc \
    && pip2 install --trusted-host pypi.python.org --upgrade pip setuptools \
    && pip2 install --trusted-host pypi.python.org neovim \
    && apk add --no-cache \
        python3 \
    && apk add --no-cache --virtual build-deps2 \
        python3-dev \
    && pip3 install --trusted-host pypi.python.org --upgrade pip setuptools \
    && pip3 install --trusted-host pypi.python.org neovim \
    && pip3 install --trusted-host pypi.python.org ujson \
    && npm config set strict-ssl false \
    && npm install -g neovim \
    && git clone https://github.com/mcesar/dotfiles.git \
    && cd dotfiles/ \
    && git config --global http.sslVerify false \
    && mkdir -p ~/.config \
    && ln -sfv /dotfiles/nvim/ ~/.config/nvim \
    && curl -k -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && update-ca-certificates \
    && nvim --headless +PlugInstall +UpdateRemotePlugins +qall \
    && rm /usr/share/nvim/runtime/autoload/htmlcomplete.vim \
    && rm /usr/share/nvim/runtime/ftplugin/html.vim \
    && apk del build-deps build-deps2
