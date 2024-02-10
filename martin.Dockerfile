FROM ghcr.io/maplibre/martin

COPY martin /config
COPY symbols /symbols

CMD ["--config", "/config/configuration.yml", "--sprite", "/symbols/nl", "--sprite", "/symbols/de", "--sprite", "/symbols/at", "--sprite", "/symbols/fi", "--sprite", "/symbols/general" , "--sprite", "/symbols/flex", "--font", "/config/fonts"]