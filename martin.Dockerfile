FROM ghcr.io/maplibre/martin

COPY martin /config
COPY symbols /symbols

CMD ["--config", "/config/configuration.yml", "--sprite", "/symbols", "--font", "/config/fonts"]