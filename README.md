# OpenRailwayMap CartoCSS port

This is a experimental port of the OpenRailwayMap Infrastructure map style from
MapCSS to CartoCSS to be able to use Mapnik to render maps.

## Warning

This project is experimental!

## Setup Notes

This style requires a PostGIS database imported with osm2pgsql. Use either the
style file orm-simple.style from this repository or create view which provide
the database scheme required by this style.

## License

Copyright (C) 2017 Michael Reichert

The [original map style](https://github.com/OpenRailwayMap/OpenRailwayMap/tree/master/styles)
is Copyright (C) 2012 Alexander Matheisen

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see http://www.gnu.org/licenses/.
