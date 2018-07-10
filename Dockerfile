FROM thawk/nvim

ENV HOME /root
WORKDIR $HOME

RUN apk add --no-cache \
    npm \
    the_silver_searcher \
    clang \
    clang-libs \
 && pip install \
    jedi \
    flake8 \
    flake8-docstrings \
    flake8-isort \
    flake8-quotes \
 && git clone https://github.com/SpaceVim/SpaceVim.git .SpaceVim \
 && git clone https://github.com/thawk/dotspacevim.git .SpaceVim.d \
 && mkdir -p $HOME/.config \
 && ln -s $HOME/.SpaceVim $HOME/.nvim \
 && git clone https://github.com/Shougo/dein.vim.git $HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim \
 && nvim --headless +'call dein#install()' +qall

ENTRYPOINT ["/usr/bin/nvim"]
