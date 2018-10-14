FROM thawk/spacevim-base:latest

ARG BUILD_DATE
ARG VCS_REF

ENV HOME=/root

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/thawk/docker-spacevim.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

COPY additional.toml $HOME/.SpaceVim.d/

RUN true \
 cat $HOME/.SpaceVim.d/additional.toml >> $HOME/.SpaceVim.d/init.toml \
 apk add --no-cache --virtual build-deps \
    go \
 && go get -u github.com/jstemmer/gotags \
 && apk del build-deps \
 && true

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/bin/nvim"]
