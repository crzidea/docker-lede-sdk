FROM buildpack-deps

RUN set -x \
    && apt-get update \
    && apt-get install gawk

ENV LEDE_VERSION=17.01.1
ENV LEDE_ARCH=ar71xx
ENV LEDE_SDK_FILENAME="lede-sdk-17.01.1-ar71xx-nand_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz"
ENV LEDE_MIRROR="https://downloads.lede-project.org"

RUN set -x \
    && curl -SLO "$LEDE_MIRROR/releases/$LEDE_VERSION/targets/$LEDE_ARCH/nand/$LEDE_SDK_FILENAME" \
    && tar -xf $LEDE_SDK_FILENAME \
    && rm $LEDE_SDK_FILENAME \
    && mv lede-sdk-* lede-sdk

WORKDIR /lede-sdk

RUN ./scripts/feeds update packages

#COPY docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
