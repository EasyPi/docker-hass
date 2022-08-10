#
# Dockerfile for hass (Home Assistant)
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG TARGETARCH

ARG HASS_CLI_VERSION=4.18.0
ARG HASS_CLI_ARCH=${TARGETARCH:-amd64}
ARG HASS_CLI_URL=https://github.com/home-assistant/cli/releases/download/${HASS_CLI_VERSION}/ha_${HASS_CLI_ARCH}

RUN set -xe \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        cargo \
        build-base \
        libffi-dev \
        linux-headers \
        openssl-dev \
        python3 \
        python3-dev \
        py3-pip \
    && pip3 install --no-cache-dir homeassistant

RUN set -xe \
    && DOWNLOAD_URL=$(echo ${HASS_CLI_URL} | sed -e 's/arm64/aarch64/' -e 's/arm/armv7/') \
    && wget ${DOWNLOAD_URL} -O /usr/local/bin/ha \
    && chmod +x /usr/local/bin/ha

VOLUME /etc/hass
EXPOSE 8123
ENTRYPOINT ["hass", "--config", "/etc/hass"]
