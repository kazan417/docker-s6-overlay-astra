FROM registry.astralinux.ru/astra/ubi18:latest

MAINTAINER kazan417 <kazan417@mail.ru>

ENV S6_OVERLAY_VERSION=3.2.0.2

RUN DEBIAN_FRONTEND='noninteractive' \
    apt-get update && apt-get install -y xz-utils  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
  rm -f /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz && \
  rm -f /tmp/s6-overlay-x86_64.tar.xz
ENTRYPOINT ["/init"]
