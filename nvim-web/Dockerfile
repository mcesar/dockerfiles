FROM mcesar/nvim

RUN git clone https://github.com/mcesar/dotfiles.git /tmp/dotfiles \
    && cat /tmp/dotfiles/nvim/init.vim /tmp/dotfiles/nvim-web/init.vim > /dotfiles/nvim/init.vim \
    && sed -e '/call plug#end()/r /tmp/dotfiles/nvim-web/plugins.vim' -e 'x;$G' /dotfiles/nvim/init.vim > /tmp/dotfiles/init.vim \
    && mv /tmp/dotfiles/init.vim /dotfiles/nvim/init.vim \
    && rm -Rf /tmp/dotfiles \
    && apk add --no-cache py2-pip \
    && pip2 install --trusted-host pypi.python.org python-language-server[all] \
    && npm install -g javascript-typescript-langserver \
    && npm install -g vue-language-server \
    && nvim --headless +PlugInstall +UpdateRemotePlugins +qall
