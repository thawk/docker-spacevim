# nvim with my SpaceVim configuration (https://github.com/thawk/dotspacevim)
#
# docker run -it --rm -P -v "$(pwd)":/src thawk/spacevim [<files to be edited>]

FROM thawk/spacevim-base:latest

ARG BUILD_DATE
ARG VCS_REF

ENV HOME=/root

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/thawk/docker-spacevim.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN true \
 && apk add --no-cache --virtual build-deps \
    go \
 && /usr/bin/go get -u github.com/jstemmer/gotags \
 && apk del build-deps \
 && true

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/bin/nvim"]
