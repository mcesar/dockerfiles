FROM debian:buster

RUN apt-get update && apt-get install -y \
        neovim \
        python-pip \
        curl \
        gnupg \
        xclip \
        git \
        texlive-full \
    && pip2 install neovim \
    && pip2 install Pygments \
    && apt-get install -y python3-pip \
    && pip3 install neovim \
    && curl -sL https://deb.nodesource.com/setup_8.x -o /nodesource_setup.sh \
    && chmod +x /nodesource_setup.sh \
    && ./nodesource_setup.sh \
    && apt-get install -y nodejs \
    && npm install -g neovim

RUN git clone https://github.com/mcesar/dotfiles.git \
    && cat /dotfiles/nvim/init.vim /dotfiles/nvim-tex/init.vim > /tmp/init.vim \
    && sed -e '/call plug#end()/r /dotfiles/nvim-tex/plugins.vim' -e 'x;$G' /tmp/init.vim > /tmp/init2.vim \
    && mv /tmp/init2.vim /dotfiles/nvim/init.vim \
    && cd dotfiles/ \
    && mkdir -p ~/.config \
    && ln -sfv /dotfiles/nvim/ ~/.config/nvim \
    && curl -k -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && nvim --headless +PlugInstall +UpdateRemotePlugins +qall \
    && git clone https://github.com/junegunn/fzf /root/.fzf \
    && /root/.fzf/install --all \
    && rm /usr/share/nvim/runtime/autoload/htmlcomplete.vim \
    && rm /usr/share/nvim/runtime/ftplugin/html.vim \
    && apt-get autoclean && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
