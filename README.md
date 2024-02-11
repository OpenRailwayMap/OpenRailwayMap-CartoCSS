# OpenRailwayMap CartoCSS Map Styles

This is a port of the OpenRailwayMap Infrastructure map style from
MapCSS to CartoCSS to be able to use Mapnik to render maps.

## Differences to the MapCSS Style

There are a couple of smaller and larger differences to the MapCSS style:

* The rendering of station labels is more sophisticated because Osm2pgsql.
  Stations are ranked by their importance. The importance is defined by the
  number of route relations a station and its platforms and stop position nodes
  belong to. Matching from stops and platforms to stations is based on names
  and spatial proximity. Stop area relations (`type=public_transport`
  + `public_transport=stop_area` are not used). The matching is sensitive to
  differences in spelling.
* Icons (radio towers, level crossings) have a higher priority than most labels.
* The map style uses the Noto Sans font.
* Railway lines have a white halo to improve visibility on colourful background maps.

## Setup Notes

See [SETUP.md](SETUP.md) for details.

## License

Copyright ⓒ 2024 Hidde Wieringa

The [original map style (CartoCSS)](https://github.com/OpenRailwayMap/OpenRailwayMap-CartoCSS/)
is copyright ⓒ 2017–2019 Michael Reichert

The [original map style (MapCSS)](https://github.com/OpenRailwayMap/OpenRailwayMap/tree/master/styles)
is Copyright ⓒ 2012 Alexander Matheisen

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see http://www.gnu.org/licenses/.
