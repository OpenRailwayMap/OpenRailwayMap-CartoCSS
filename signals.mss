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

@signal-text-fill: @signal-text-fill;
@signal-text-halo-fill: @signal-text-halo-fill;
@signal-text-halo-radius: 1;
@signal-text-halo-radius-large: 3;

/*********************************/
/* DE crossing distant sign Bü 2 */
/*********************************/
[zoom>=15]["feature"="DE-ESO:bü2"] {
  marker-file: url('icons/de/bue2-ds.svg');
  marker-width: 7;
  marker-height: 28;
  marker-allow-overlap: true;

  /* reduced distance */
  ["feature"="DE-ESO:bü2"]["crossing_distant_shortened"="yes"] {
    marker-file: url('icons/de/bue2-ds-reduced-distance.svg');
  }
}

/*********************************/
/* DE whistle sign Bü 4 (DS 301) */
/*********************************/
[zoom>=14]["feature"="DE-ESO:db:bü4"] {
  marker-file: url('icons/de/bue4-ds.svg');
  marker-width: 11;
  marker-height: 16;
  marker-allow-overlap: true;

  /* for trains not stopping at a halt */
  ["ring_only_transit"="yes"] {
    marker-file: url('icons/de/bue4-ds-only-transit.svg');
    marker-width: 12;
    marker-height: 21;
  }
}

/*********************************/
/* DE whistle sign Pf 1 (DV 301) */
/*********************************/
[zoom>=14]["feature"="DE-ESO:dr:pf1"] {
  marker-file: url('icons/de/pf1-dv.svg');
  marker-width: 11;
  marker-height: 16;
  marker-allow-overlap: true;

  /* DE whistle sign Pf 1 (DV 301) for trains not stopping at a halt */
  ["ring_only_transit"="yes"] {
    marker-file: url('icons/de/pf1-dv-only-transit.svg');
    marker-width: 12;
    marker-height: 21;
  }
}

/*********************/
/* DE ring sign Bü 5 */
/*********************/
[zoom>=15]["feature"="DE-ESO:bü5"] {
  marker-file: url('icons/de/bue5.svg');
  marker-width: 11;
  marker-height: 16;
  marker-allow-overlap: true;

  /* DE ring sign Bü 5 for trains not stopping at a halt */
  ["ring_only_transit"="yes"] {
    marker-file: url('icons/de/bue5-only-transit.svg');
    marker-width: 12;
    marker-height: 21;
  }
}

/*****************************/
/* DE crossing signal Bü 0/1 */
/*****************************/
[zoom>=15]["feature"="DE-ESO:bü"] {
  marker-file: url('icons/de/bue1-ds.svg');
  marker-width: 7;
  marker-height: 16;
  marker-allow-overlap: true;

  /* repeaters */
  ["crossing_repeated"="yes"] {
    marker-file: url('icons/de/bue1-ds-repeated.svg');
    marker-width: 9;
    marker-height: 21;
  }
  
  /* shortened breaking distance */
  ["crossing_shortened"="yes"] {
    marker-file: url('icons/de/bue1-ds-shortened.svg');
    marker-width: 9;
    marker-height: 21;
  }

  /* cannot show Bü 1 */
  ["crossing_form"="sign"] {
    marker-file: url('icons/de/bue0-ds.svg');
    marker-width: 7;
    marker-height: 16;

    /* repeaters */
    ["crossing_repeated"="yes"] {
      marker-file: url('icons/de/bue0-ds-repeated.svg');
      marker-width: 9;
      marker-height: 21;
    }
  
    /* shortened breaking distance */
    ["crossing_shortened"="yes"] {
      marker-file: url('icons/de/bue0-ds-shortened.svg');
      marker-width: 9;
      marker-height: 21;
    }
  }
}

/*****************************************************************************/
/* DE crossing signal Bü 0/1 (ex. So 16a/b) which can show Bü 1 (ex. So 16b) */
/*****************************************************************************/
[zoom>=15]["feature"="DE-ESO:so16"]["crossing_form"="light"] {
  marker-file: url('icons/de/bue1-dv.svg');
  marker-width: 7;
  marker-height: 16;
  marker-allow-overlap: true;

  /* repeaters */
  ["crossing_repeated"="yes"] {
    marker-file: url('icons/de/bue1-dv-repeated.svg');
    marker-width: 9;
    marker-height: 21;
  }
  
  /* shortened breaking distance */
  ["crossing_shortened"="yes"] {
    marker-file: url('icons/de/bue1-dv-shortened.svg');
    marker-width: 9;
    marker-height: 21;
  }
}

/**************************/
/* FI crossing signal To  */
/**************************/
[zoom>=15]["crossing"="FI:To"]["crossing_form"="light"] {
  marker-file: url('icons/fi/to1.svg');
  marker-width: 7;
  marker-height: 12;
  marker-allow-overlap: true;
}

/***************************************************/
/* DE tram signal "start of train protection" So 1 */
/***************************************************/
[zoom>=15]["feature"="DE-BOStrab:so1"]["train_protection_form"="sign"],["train_protection_type"="start"],
[zoom>=15]["feature"="DE-AVG:so1"]["train_protection_form"="sign"]["train_protection_type"="start"] {
  marker-file: url('icons/de/bostrab/so1.svg');
  marker-width: 12;
  marker-height: 12;
  marker-allow-overlap: true;
}

/***************************************************/
/* DE tram signal "end of train protection" So 2 */
/***************************************************/
[zoom>=15]["feature"="DE-BOStrab:so2"]["train_protection_form"="sign"]["train_protection_type"="end"],
[zoom>=15]["feature"="DE-AVG:so2"]["train_protection_form"="sign"]["train_protection_type"="end"] {
  marker-file: url('icons/de/bostrab/so2.svg');
  marker-width: 12;
  marker-height: 12;
  marker-allow-overlap: true;
}

/********************************/
/* DE station distant sign Ne 6 */
/********************************/
[zoom>=14]["feature"="DE-ESO:ne6"]["station_distant_form"="sign"] {
  marker-file: url('icons/de/ne6.svg');
  marker-width: 24;
  marker-height: 5;
  marker-allow-overlap: true;
}

/****************************/
/* DE stop demand post Ne 5 */
/****************************/
[zoom>=17]["feature"="DE-ESO:ne5"]["stop_demand_form"="light"],
[zoom>=17]["feature"="DE-ESO:ne5"]["stop_form"="sign"] {
  marker-file: url('icons/de/ne5-sign.svg');
  marker-width: 11;
  marker-height: 16;
  marker-allow-overlap: true;

  ["stop_form"="light"] {
    marker-file: url('icons/de/ne5-light.svg');
  }

  ::text {
    text-name: [ref];
    text-dy: 14;
    text-fill: @signal-text-fill;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    text-halo-radius: @signal-text-halo-radius;
    ["stop_form"="sign"] {
      text-halo-radius: @signal-text-halo-radius-large;
    }
  }
}

/*********************************************/
/* DE shunting stop sign Ra 10               */
/* AT shunting stop sign "Verschubhalttafel" */
/*********************************************/
[zoom>=17]["feature"="DE-ESO:ra10"]["shunting_form"="sign"],
[zoom>=17]["feature"="AT-V2:verschubhalttafel"]["shunting_form"="sign"] {
  marker-file: url('icons/de/ra10.svg');
  marker-width: 16;
  marker-height: 11;
  marker-allow-overlap: true;
}

/********************************************/
/* DE minor semaphore dwarf signals type Sh */
/* DE Sh 0 at buffer stops                  */
/********************************************/
[zoom>=17]["feature"="DE-ESO:sh"]["minor_form"="semaphore"]["minor_height"="dwarf"],
[zoom>=17]["feature"="DE-ESO:sh0"]["minor_form"="sign"] {
  marker-file: url('icons/de/sh0-semaphore-dwarf.svg');
  marker-width: 12;
  marker-height: 11;
  marker-allow-overlap: true;

  ::text {
    text-name: [ref];
    text-dy: 11;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
  }
}

/********************************/
/* DE tram minor stop sign Sh 1 */
