#
# Dockerfile for hass-arm (Home Assistant)
#

FROM multiarch/alpine:armhf-v3.12
MAINTAINER EasyPi Software Foundation

ENV HASS_CLI_VERSION=4.9.0
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
    && wget https://github.com/home-assistant/cli/releases/download/${HASS_CLI_VERSION}/ha_${HASS_CLI_ARCH} -O /usr/local/bin/ha \
    && chmod +x /usr/local/bin/ha

VOLUME /etc/hass
EXPOSE 8123
ENTRYPOINT ["hass", "--config", "/etc/hass"]
