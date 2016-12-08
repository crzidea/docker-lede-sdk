FROM buildpack-deps

RUN set -x \
    && apt-get update \
    && apt-get install gawk

ENV OPENWRT_VERSION=15.05.1
ENV OPENWRT_SDK_FILENAME="OpenWrt-SDK-$OPENWRT_VERSION-ar71xx-generic_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2"
ENV OPENWRT_MIRROR="https://mirrors.tuna.tsinghua.edu.cn/openwrt"

RUN set -x \
    && curl -SLO "$OPENWRT_MIRROR/chaos_calmer/$OPENWRT_VERSION/ar71xx/generic/$OPENWRT_SDK_FILENAME" \
    && tar -xjf $OPENWRT_SDK_FILENAME \
    && rm $OPENWRT_SDK_FILENAME \
    && mv OpenWrt-SDK-* openwrt

WORKDIR /openwrt

RUN ./scripts/feeds update packages

#COPY docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
