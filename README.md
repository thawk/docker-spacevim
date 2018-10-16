[![](https://images.microbadger.com/badges/image/thawk/spacevim.svg)](https://microbadger.com/images/thawk/spacevim) [![](https://images.microbadger.com/badges/commit/thawk/spacevim.svg)](https://microbadger.com/images/thawk/spacevim) [![](https://images.microbadger.com/badges/version/thawk/spacevim.svg)](https://microbadger.com/images/thawk/spacevim)

A neovim with [SpaceVim](https://spacevim.org) and [my customized configuration](https://github.com/thawk/dotspacevim).

https://hub.docker.com/r/thawk/spacevim

## Usage

```sh
$ docker run -it -v $(pwd):/src thawk/spacevim test.cpp
```

```sh
alias dnvim='docker run -it -v $(pwd):/src thawk/spacevim "$@"'
```

也可以通过镜像中的 dvim 脚本进行调用。
