FROM ghcr.io/maplibre/martin

COPY martin /config
COPY symbols /symbols
COPY tiles /tiles

CMD ["/tiles", "--listen-addresses", "[::]:3000", "--sprite", "/symbols/nl", "--sprite", "/symbols/de", "--sprite", "/symbols/at", "--sprite", "/symbols/fi", "--sprite", "/symbols/general", "--sprite", "/symbols/flex", "--font", "/config/fonts"]