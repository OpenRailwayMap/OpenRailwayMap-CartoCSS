# Setup

## Fetching data

Ensure an OpenStreetMap data file is downloaded, for example from https://download.geofabrik.de/europe.html. The file must be named `data.osm.pbf` or otherwise configured with the environment variable `OSM2PGSQL_DATAFILE`.

## Development

Import the data:
```shell
docker compose up --build import
```

Start the tile server:
```shell
docker compose up --build --force-recreate martin
```

Start the web server:
```shell
docker compose up --build --force-recreate martin-proxy
```

The OpenRailwayMap is now available on http://localhost:8000.

## Deployment

Import the data:
```shell
docker compose up --build import
```

Build the tiles:
```shell
docker compose up --build martin-cp
```

Build and deploy the tile server:
```shell
flyctl deploy --config martin-static.fly.toml --local-only
```

Build and deploy the caching proxy:
```shell
flyctl deploy --config proxy.fly.toml --local-only
```

The OpenRailwayMap is now available on https://openrailwaymap.fly.dev.
