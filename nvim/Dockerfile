FROM alpine

ENV FZF_DEFAULT_COMMAND='fd --type f --exclude .git --exclude node_modules'

ADD sof_raiz.pem /usr/local/share/ca-certificates/
ADD termpix /bin/termpix
ADD fd /bin/fd

RUN apk --no-cache add ca-certificates \
    && update-ca-certificates \
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        neovim \
        python \
        nodejs nodejs-npm \
        xclip \
        git \
        fzf \
    && apk add --no-cache --virtual build-deps \
        python-dev \
        py2-pip \
        curl \
        openssh-client \
        musl-dev \
        gcc \
    && pip2 install --trusted-host pypi.python.org --upgrade pip setuptools \
    && pip2 install --trusted-host pypi.python.org neovim \
    && pip2 install --trusted-host pypi.python.org Pygments \
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
    && git clone https://github.com/junegunn/fzf /root/.fzf \
    && rm /usr/share/nvim/runtime/autoload/htmlcomplete.vim \
    && rm /usr/share/nvim/runtime/ftplugin/html.vim \
    && apk del build-deps build-deps2
