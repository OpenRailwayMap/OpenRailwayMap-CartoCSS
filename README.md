# OpenRailwayMap Vector Map Styles

This repository contains the visualization of railway infrastructure, speed limits, train protection, electrification and railway gauges using vector-based tiles and a web-based user interface. 

Documentation can be found on the [OpenStreetMap Wiki](https://wiki.openstreetmap.org/wiki/OpenRailwayMap).

## Architecture

This repository aims to contain all code, configuration and tooling for the OpenRailwayMap.

- Data is provided by [OpenStreetMap](https://www.openstreetmap.org/about) and [OpenHistoricalMap](https://www.openhistoricalmap.org/about).
- Data is stored in a [PostgreSQL](https://www.postgresql.org/) database, augmented by [PostGIS](https://postgis.net/) for spatial features.
- Data is imported from the OpenStreetMap data files to PostgreSQL using [Osm2pgsql](https://osm2pgsql.org/).
- Vector tiles are rendered from the database with [Martin](https://martin.maplibre.org/) (part of the [MapLibre initiative](https://maplibre.org/)) in the MBtiles format and converted to PMTiles using [ProtoMaps PMTiles](https://docs.protomaps.com/pmtiles/).
- The user interface uses [MapLibre GL JS](https://maplibre.org/maplibre-gl-js/docs/) to visualize the map content.
- The style is specified using the [MapLibre Style Specification](https://maplibre.org/maplibre-style-spec/).
- [Docker](https://www.docker.com/) is used to package the software and data for local development and deployment.
- Continuous Integration and daily data updates are done using [Github Actions](https://docs.github.com/en/actions).

## Changes from the CartoCSS style

A number of changes have been made from the [upstream `OpenRailwayMap-CartoCSS` project](https://github.com/OpenRailwayMap/OpenRailwayMap-CartoCSS):
- The raster tiles have been replaced with vector tiles.
- MapCSS and Mapnik have been replaced with the MapLibre Style Specification and Martin.
- Database views have been collapsed into single views to minimize data transfer.
- Lua code is used to minimize imported data, while retaining the ability to change the database views for adding new features. 
- Visualization of additional signalling has been added.
- Direction of railway signals has been added.
- Fixes have been made for non-functional visualization rules.
- The API runs from a Docker container from static PostgreSQL data optimized for searching.

Upstream changes will be merged into this project.

## API

The API has been adapted from [the OpenRailwayMap API](https://github.com/OpenRailwayMap/OpenRailwayMap-api). The API powers the search in the OpenRailwayMap UI, and provides facility (stations, halts, tram stops, yards, sidings, crossovers, including disused, abandoned, razed, proposed and under construction) searches by name and reference and milestone searches by combination of line number and mileage. The searches are full text, based on PostgreSQL's full text search functionalities.

The API documentation can be found at https://openrailwaymap.app/api.html. You can also view [the raw OpenAPI specification](proxy/api/openapi.yaml).

## Mapping presets

Presets for [JOSM](https://josm.openstreetmap.de/) and [Vespucci](https://vespucci.io/) are generated for mapping assistance. The preset is available for download on https://openrailwaymap.app/preset.zip. The preset is also available directly from the [Tagging Presets register in JOSM Preferences](https://josm.openstreetmap.de/wiki/Help/Preferences/TaggingPresetPreference). [Vespucci](https://vespucci.io/help/en/Presets/) can use the same presets for mobile mapping.

## Contributing

Contributions are welcome!

There are multiple ways to contribute to this project:
- Improving the code and/or tooling.
- Providing more details for visualization on the map, for the infrastructure, speed limit, train protection, electrification or gauge layer.
- Providing icons for visualizing features on the map.
- Providing user interface improvements.
- Providing technical or user documentation.

View the [contribution documentation](CONTRIBUTING.md) for details.

## Development

To run the OpenRailwayMap locally, you can import OpenStreetMap data and run the tile and web server locally.

View the [setup documentation](SETUP.md) for details.

## Deployment

The [deployment documentation](deployment/README.md) describes how the OpenRailwayMap is deployed to https://openrailwaymap.app using [Github Actions](https://docs.github.com/en/actions), Cloudflare and a server running the software.

## License

Copyright © 2024–2025 Hidde Wieringa

The [original map style (CartoCSS)](https://github.com/OpenRailwayMap/OpenRailwayMap-CartoCSS/)
is copyright © 2017–2019 Michael Reichert

The [original map style (MapCSS)](https://github.com/OpenRailwayMap/OpenRailwayMap/tree/master/styles)
is Copyright © 2012 Alexander Matheisen

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see http://www.gnu.org/licenses/.
