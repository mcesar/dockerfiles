FROM mcesar/nvim

ENV GOPATH=/go

ENV PATH $PATH:$GOPATH/bin

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
    musl-dev \
    go

RUN git clone https://github.com/mcesar/dotfiles.git /tmp/dotfiles \
    && cat /tmp/dotfiles/nvim/init.vim /tmp/dotfiles/nvim-go/init.vim > /dotfiles/nvim/init.vim \
    && sed -e '/call plug#end()/r /tmp/dotfiles/nvim-go/plugins.vim' -e 'x;$G' /dotfiles/nvim/init.vim > /tmp/dotfiles/init.vim \
    && mv /tmp/dotfiles/init.vim /dotfiles/nvim/init.vim \
    && rm -Rf /tmp/dotfiles \
    && nvim --headless +PlugInstall +qall \
    && go get -u github.com/golang/dep/cmd/dep

COPY nvim.sh /

ENTRYPOINT ["/nvim.sh"]
