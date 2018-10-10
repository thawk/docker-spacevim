FROM thawk/neovim:latest

ARG BUILD_DATE
ARG VCS_REF

ENV HOME=/root

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/thawk/docker-spacevim.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN \
 apk add --no-cache --virtual build-deps \
    go \
 && go get -u github.com/jstemmer/gotags \
 && git clone --depth 1 --shallow-submodules https://github.com/SpaceVim/SpaceVim.git $HOME/.SpaceVim \
 && git clone --depth 1 --shallow-submodules https://github.com/thawk/dotspacevim.git $HOME/.SpaceVim.d \
 && mkdir -p $HOME/.config \
 && ln -s $HOME/.SpaceVim $HOME/.config/nvim \
 && git clone --depth 1 --shallow-submodules https://github.com/Shougo/dein.vim.git $HOME/.cache/vimfiles/repos/github.com/Shougo/dein.vim \
 && nvim --headless +'call dein#install()' +qall \
 && (find $HOME/.cache/vimfiles -type d -name ".git" | xargs rm -r) \
 && apk del build-deps

COPY viminfo $HOME/.viminfo

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/bin/nvim"]
