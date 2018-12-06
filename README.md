[![](https://images.microbadger.com/badges/image/thawk/spacevim.svg)](https://microbadger.com/images/thawk/spacevim) [![](https://images.microbadger.com/badges/commit/thawk/spacevim.svg)](https://microbadger.com/images/thawk/spacevim) [![](https://images.microbadger.com/badges/version/thawk/spacevim.svg)](https://microbadger.com/images/thawk/spacevim)

A neovim with [SpaceVim](https://spacevim.org) and [my customized configuration](https://github.com/thawk/dotspacevim).

https://hub.docker.com/r/thawk/spacevim

Based on: https://hub.docker.com/r/thawk/spacevim-base

## Usage

```sh
$ docker run -it --rm -v $(pwd):/src thawk/spacevim test.cpp
```

```sh
alias dnvim='docker run -it --rm -v $(pwd):/src thawk/spacevim "$@"'
```

