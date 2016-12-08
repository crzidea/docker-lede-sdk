# docker-openwrt

An environment for compiling OpenWRT packages that just works!

## Example: Complile `shadowsocks-libev`

- Setup a container:

  ```sh
  docker run --rm -it crzidea/openwrt bash
  ```
  
- Run command in container:

  ```sh
  apt install ccache
  cd /openwrt
  ./scripts/feeds install libpcre
  git clone https://github.com/shadowsocks/openwrt-shadowsocks.git package/shadowsocks-libev
  make menuconfig
  make package/shadowsocks-libev/compile V=s
  ```
  
- Copy files to `/packages`

  ```sh
  cp -r bin/packages/* /packages
  ```
