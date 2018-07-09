FROM thawk/nvim

ENV HOME /root
WORKDIR $HOME

RUN apk add --no-cache \
    npm \
    the_silver_searcher \
    clang \
    clang-libs \
 && git clone https://github.com/SpaceVim/SpaceVim.git .SpaceVim \
 && git clone https://github.com/thawk/dotspacevim.git .SpaceVim.d \
 && mkdir -p $HOME/.config
 && ln -s $HOME/.SpaceVim $HOME/.nvim
 && git clone https://github.com/Shougo/dein.vim.git $HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim \
 && nvim --headless +'call dein#install()' +qall

ENTRYPOINT ["/usr/local/bin/nvim"]
