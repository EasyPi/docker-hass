#
# Dockerfile for hass-arm (Home Assistant)
#

FROM multiarch/alpine:armhf-v3.10
MAINTAINER EasyPi Software Foundation

ENV HASS_CLI_VERSION=3.1.1
ENV HASS_CLI_ARCH=armhf

RUN set -xe \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        build-base \
        libffi-dev \
        linux-headers \
        openssl-dev \
        python3 \
        python3-dev \
    && pip3 install --no-cache-dir homeassistant \
    && wget https://github.com/home-assistant/hassio-cli/releases/download/${HASS_CLI_VERSION}/hassio_${HASS_CLI_ARCH} -O /usr/local/bin/hassio \
    && chmod +x /usr/local/bin/hassio

VOLUME /etc/hass
EXPOSE 8123
ENTRYPOINT ["hass", "--config", "/etc/hass"]
