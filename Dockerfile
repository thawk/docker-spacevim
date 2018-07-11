FROM thawk/neovim:latest

RUN git clone https://github.com/SpaceVim/SpaceVim.git .SpaceVim \
 && git clone https://github.com/thawk/dotspacevim.git .SpaceVim.d \
 && mkdir -p /root/.config \
 && ln -s /root/.SpaceVim /root/.config/nvim \
 && git clone https://github.com/Shougo/dein.vim.git /root/.cache/vimfiles/repos/github.com/Shougo/dein.vim \
 && nvim --headless +'call dein#install()' +qall

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/bin/nvim"]
