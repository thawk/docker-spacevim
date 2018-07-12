FROM thawk/neovim:latest

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/thawk/docker-spacevim.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN git clone --depth 1 --shallow-submodules https://github.com/SpaceVim/SpaceVim.git /root/.SpaceVim \
 && git clone --depth 1 --shallow-submodules https://github.com/thawk/dotspacevim.git /root/.SpaceVim.d \
 && mkdir -p /root/.config \
 && ln -s /root/.SpaceVim /root/.config/nvim \
 && git clone --depth 1 --shallow-submodules https://github.com/Shougo/dein.vim.git /root/.cache/vimfiles/repos/github.com/Shougo/dein.vim \
 && nvim --headless +'call dein#install()' +qall \
 && (find /root/.cache/vimfiles -type d -name ".git" | xargs rm -r)

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/bin/nvim"]
