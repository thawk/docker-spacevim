FROM thawk/vim

WORKDIR /root

RUN apk add --no-cache \
    && npm \
    && the_silver_searcher \
    && clang \
    && clang-libs \
    && git clone https://github.com/SpaceVim/SpaceVim.git .SpaceVim \
    && git clone https://github.com/thawk/dotspacevim.git .SpaceVim.d \
    && git clone https://github.com/Shougo/dein.vim.git $HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim \
    && vim -c "silent! call dein#install()" -c qa

ENTRYPOINT ["/usr/local/bin/vim"]
