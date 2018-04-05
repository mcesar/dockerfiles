FROM mcesar/nvim

RUN git clone https://github.com/mcesar/dotfiles.git /tmp/dotfiles \
    && cat /tmp/dotfiles/nvim/init.vim /tmp/dotfiles/nvim-java/init.vim > /dotfiles/nvim/init.vim \
    && rm -Rf /tmp/dotfiles \
    && apk add --no-cache openjdk8

ADD jdt-ls.tar.gz /
ADD lombok.jar /jdt-ls
