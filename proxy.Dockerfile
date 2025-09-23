FROM node:22-alpine AS build-yaml

WORKDIR /build

RUN npm install yaml

FROM build-yaml AS build-styles

RUN --mount=type=bind,source=proxy/js/styles.mjs,target=styles.mjs \
  --mount=type=bind,source=features,target=features \
  node /build/styles.mjs

FROM build-yaml AS build-features

RUN --mount=type=bind,source=proxy/js/features.mjs,target=features.mjs \
  --mount=type=bind,source=features,target=features \
  node /build/features.mjs \
    > /build/features.json

FROM python:3-alpine AS build-preset

RUN apk add --no-cache zip

RUN pip install --no-cache-dir \
  pyyaml \
  yattag

WORKDIR /build

ARG PRESET_VERSION
RUN --mount=type=bind,source=proxy/preset.py,target=preset.py \
  --mount=type=bind,source=features,target=features \
  python preset.py \
    > preset.xml

RUN --mount=type=bind,source=symbols,target=symbols \
  zip -o /build/preset.zip -r \
    symbols \
    preset.xml

FROM nginx:1-alpine

COPY proxy/script/with-news-hash.sh /with-news-hash.sh
COPY proxy/proxy.conf.template /etc/nginx/templates/proxy.conf.template
COPY proxy/manifest.json /etc/nginx/public/manifest.json
COPY proxy/index.html /etc/nginx/public/index.html
COPY proxy/news.html /etc/nginx/public/news.html
COPY proxy/api /etc/nginx/public/api
COPY proxy/js /etc/nginx/public/js
COPY proxy/css /etc/nginx/public/css
COPY proxy/image /etc/nginx/public/image
COPY proxy/ssl /etc/nginx/ssl
COPY data/import /etc/nginx/public/import

COPY --from=build-styles \
  /build /etc/nginx/public/style

COPY --from=build-preset \
  /build/preset.zip /etc/nginx/public/preset.zip

COPY --from=build-features \
  /build/features.json /etc/nginx/public/features.json

ENTRYPOINT ["/with-news-hash.sh"]
CMD ["nginx", "-g", "daemon off;"]
