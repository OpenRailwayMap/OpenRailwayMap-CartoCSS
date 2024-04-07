/*
OpenRailwayMap Style File for JOSM and KothicJS
Signalling layer

OpenRailwayMap Copyright (C) 2012 Alexander Matheisen
This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under certain conditions.
See https://wiki.openstreetmap.org/wiki/OpenRailwayMap for details.

Format details:
* https://josm.openstreetmap.de/wiki/Help/Styles/MapCSSImplementation
* https://wiki.openstreetmap.org/wiki/MapCSS/0.2
*/

@signal-text-fill: black;
@signal-text-halo-fill: white;
@signal-text-halo-radius: 1;
@signal-text-halo-radius-large: 3;

#railway_signals[zoom>=14] {

  /************************************/
  /* NL ETCS stopplaatsmarkering 227b */
  /************************************/
  ["feature"="NL:227b"]["train_protection_form"="sign"]["train_protection_type"="block_marker"] {
    marker-file: url('symbols/etcs-stop-marker-arrow-left.svg');
    marker-width: 16;
    marker-height: 16;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /* triangle-shaped stop marker */
    ["feature"="NL:227b"]["train_protection_shape"="triangle"] {
      marker-file: url('symbols/etcs-stop-marker-triangle-left.svg');
    }
  }
}
