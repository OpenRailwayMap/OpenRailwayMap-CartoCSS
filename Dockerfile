# Debian Trixie uses libmapnik-dev built with CMake, therefore without mapnik-config script.
# This would make the installation of node-mapnik crash.
FROM node:26-bookworm

# https://serverfault.com/questions/949991/how-to-install-tzdata-on-a-ubuntu-docker-image
ARG DEBIAN_FRONTEND=noninteractive
ARG KOSMTIK_COMMIT=e2e4d1a626f1142f95e1adc60adc9c1e4c89ec00

# Style dependencies
# ca-certificates is needed for wget because the Node image does not contain it.
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        build-essential \
        ca-certificates \
        postgresql-client \
        fonts-hanazono \
        fonts-noto-cjk \
        fonts-noto-hinted \
        fonts-noto-unhinted \
        libmapnik-dev \
        patch \
        fonts-unifont \
        wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# We install kosmtik not from release channel, but directly from a specific commit on Github.
RUN wget --quiet -O kosmtik.tar.gz "https://github.com/kosmtik/kosmtik/archive/$KOSMTIK_COMMIT.tar.gz" && tar -xzf kosmtik.tar.gz && rm kosmtik.tar.gz && mv "kosmtik-$KOSMTIK_COMMIT" /kosmtik
WORKDIR /kosmtik
RUN npm install

RUN node index.js plugins --install kosmtik-fetch-remote \
    && cp /root/.config/kosmtik.yml /tmp/.kosmtik-config.yml

# Closing section
RUN mkdir -p /openrailwaymap
#RUN npm install -g semver
#RUN npm install semver
WORKDIR /openrailwaymap

ENTRYPOINT ["/bin/bash", "docker-startup.sh", "kosmtik"]
