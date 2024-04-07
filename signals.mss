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

  /**************************/
  /* FI crossing signal To  */
  /**************************/
  [zoom>=15]["feature"="FI:To"]["crossing_form"="light"] {
    marker-file: url('symbols/fi/to1.svg');
    marker-width: 7;
    marker-height: 12;
    marker-allow-overlap: true;
  }

  /*********************************************/
  /* AT shunting stop sign "Verschubhalttafel" */
  /*********************************************/
  [zoom>=17]["feature"="AT-V2:verschubhalttafel"]["shunting_form"="sign"] {
    marker-file: url('symbols/de/ra10.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /**************************************************/
  /* AT Wartesignal ohne "Verschubverbot aufgehoben */
  /**************************************************/
  [zoom>=17]["feature"="AT-V2:wartesignal"]["shunting_form"="sign"] {
    marker-file: url('symbols/de/ra11-sign.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* FI shunting light signals type Ro (new) */
  /*******************************************/
  [zoom>=17]["feature"="FI:Ro"]["shunting_states"=~"^(.*;)?FI:Ro0(;.*)?$"]["shunting_form"="light"] {
    marker-file: url('symbols/fi/ro0-new.svg');
    marker-width: 11;
    marker-height: 12;
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

  /******************************************************/
  /* FI minor light signals type Lo at moveable bridges */
  /******************************************************/
  [zoom>=17]["feature"="FI:Lo"]["minor_states"=~"^(.*;)?FI:Lo0(;.*)?$"]["minor_form"="light"] {
    marker-file: url('symbols/fi/lo0.svg');
    marker-width: 7;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-size: 10;
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
    }
  }

  /***********************************************/
  /* AT shunting light signals (Verschubverbot)  */
  /***********************************************/
  [zoom>=17]["feature"="AT-V2:verschubsignal"]["shunting_form"="light"] {
    marker-file: url('symbols/at/verschubverbot-aufgehoben.svg');
    marker-width: 10;
    marker-height: 14;
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

  /*************************************************/
  /* AT minor light signals (Sperrsignale) as sign */
  /*************************************************/
  [zoom>=17]["feature"="AT-V2:weiterfahrt_verboten"]["minor_form"="sign"] {
    marker-file: url('symbols/at/weiterfahrt-verboten.svg');
    marker-width: 12;
    marker-height: 12;
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

  /**************************************************************/
  /* AT minor light signals (Sperrsignale) as semaphore signals */
  /**************************************************************/
  [zoom>=17]["feature"="AT-V2:sperrsignal"]["minor_form"="semaphore"] {
    marker-file: url('symbols/at/weiterfahrt-erlaubt.svg');
    marker-width: 7;
    marker-height: 14;
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

  /****************************/
  /* AT distant light signals */
  /****************************/
  ["feature"="AT-V2:vorsignal"]["distant_form"="light"] {
    marker-file: url('symbols/at/vorsignal-vorsicht.svg');
    marker-width: 11;
    marker-height: 11;
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

    /* can show proceed with full speed                                  */
    /* if the signal can also show other aspects, later rules will match */
    ["distant_states"=~"^(.*;)?AT-V2:hauptsignal_frei(;.*)?$"] {
      marker-file: url('symbols/at/vorsignal-hauptsignal-frei.svg');
      marker-width: 11;
      marker-height: 11;
      marker-allow-overlap: true;
    }

    /* can show proceed with 40 kph speed (on narrow gauge lines 20 kph) */
    ["distant_states"=~"^(.*;)?AT-V2:hauptsignal_frei_mit_40(;.*)?$"],
    ["distant_states"=~"^(.*;)?AT-V2:hauptsignal_frei_mit_20(;.*)?$"] {
      marker-file: url('symbols/at/vorsignal-hauptsignal-frei-mit-40.svg');
      marker-width: 11;
      marker-height: 11;
      marker-allow-overlap: true;
    }

    /* can show proceed with 60 kph speed                                */
    ["distant_states"=~"^(.*;)?AT-V2:hauptsignal_frei_mit_60(;.*)?$"] {
      marker-file: url('symbols/at/vorsignal-hauptsignal-frei-mit-60.svg');
      marker-width: 11;
      marker-height: 11;
      marker-allow-overlap: true;
    }
  }

  /********************************/
  /* AT distant semaphore signals */
  /********************************/
  ["feature"="AT-V2:vorsignal"]["distant_form"="semaphore"] {
    marker-file: url('symbols/at/vorsicht-semaphore.svg');
    marker-width: 12;
    marker-height: 19;
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
  }

  /****************************/
  /* FI distant light signals */
  /****************************/
  ["feature"="FI:Eo"]["distant_form"="light"],
  ["feature"="FI:Eo-v"]["distant_form"="light"] {
    ["distant_repeated"!="yes"] {
      ::text {
        text-name: [ref];
        text-dy: 12;
        text-fill: @signal-text-fill;
        text-halo-radius: @signal-text-halo-radius;
        text-halo-fill: @signal-text-halo-fill;
        text-face-name: @bold-fonts;
        text-size: 10;
      }

      ["feature"="FI:Eo"] {
        marker-width: 9;
        marker-height: 15;
        marker-file: url('symbols/fi/eo0-new.svg');
      }

      ["feature"="FI:Eo-v"] {
        marker-width: 10;
        marker-height: 10;
        marker-file: url('symbols/fi/eo0-old.svg');
      }

      /* can display Eo 1 (expect proceed) */
      /* new type */
      ["distant_states"=~"^(.*;)?FI:Eo1(;.*)?$"] {
        marker-file: url('symbols/fi/eo1-new.svg');
      }
      /* old type */
      ["distant_states"=~"^(.*;)?FI:Eo1(;.*)?$"] {
        marker-file: url('symbols/fi/eo1-old.svg');
      }

      /* can display Eo 2 (expect proceed) -- new type */
      ["distant_states"=~"^(.*;)?FI:Eo2(;.*)?$"] {
        marker-file: url('symbols/fi/eo2-new.svg');
      }
    }
  }

  /************************************************/
  /* AT Kreuztafel                                */
  /************************************************/
  ["feature"="AT-V2:kreuztafel"]["distant_form"="sign"] {
    marker-file: url('symbols/de/so106.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /******************************************/
  /* AT main semaphore signal "Hauptsignal" */
  /******************************************/
  ["feature"="AT-V2:hauptsignal"]["main_form"="semaphore"] {
    marker-file: url('symbols/de/hp0-semaphore.svg');
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

    /* AT: can display "Frei" (proceed at full speed) */
    ["feature"="AT-V2:hauptsignal"]["main_states"=~"^(.*;)?AT-V2:frei(;.*)?$"] {
      marker-file: url('symbols/de/hp1-semaphore.svg');
      marker-width: 12;
      marker-height: 19;
    }

    /* AT: can display "Frei mit 40" (proceed at 40 kph)                 */
    /* AT: can display "Frei mit 20" (proceed at 20 kph) -- narrow gauge */
    ["feature"="AT-V2:hauptsignal"]["main_states"=~"^(.*;)?AT-V2:frei_mit_40(;.*)?$"],
    ["feature"="AT-V2:hauptsignal"]["main_states"=~"^(.*;)?AT-V2:frei_mit_20(;.*)?$"] {
      marker-file: url('symbols/de/hp2-semaphore.svg');
      marker-width: 12;
      marker-height: 20;
    }
  }

  /*************************/
  /* AT main light signals */
  /*************************/
  ["feature"="AT-V2:hauptsignal"]["main_form"="light"] {
    marker-file: url('symbols/at/hauptsignal-halt.svg');
    marker-width: 8;
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

    /* can show proceed with full speed */
    ["main_states"=~"^(.*;)?AT-V2:frei(;.*)?$"] {
      marker-file: url('symbols/at/hauptsignal-frei.svg');
    }

    /* can show proceed with 40 kph or 20 kph */
    /* On narrow gauge railway lines "frei mit 40" is called "frei mit 20" but has the same appearance. */
    ["main_states"=~"^(.*;)?AT-V2:frei_mit_40(;.*)?$"],
    ["main_states"=~"^(.*;)?AT-V2:frei_mit_20(;.*)?$"] {
      marker-file: url('symbols/at/hauptsignal-frei-mit-40.svg');
    }

    /* can show proceed with 60 kph    */
    ["main_states"=~"^(.*;)?AT-V2:frei_mit_60(;.*)?$"] {
      marker-file: url('symbols/at/hauptsignal-frei-mit-60.svg');
    }
  }

  /*************************/
  /* FI main light signals */
  /*************************/
  /* new type */
  ["feature"="FI:Po"]["main_form"="light"] {
    marker-file: url('symbols/fi/po0-new.svg');
    marker-width: 9;
    marker-height: 15;
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

    /* can display Po1 */
    ["main_states"=~"^(.*;)?FI:Po1(;.*)?$"] {
      marker-file: url('symbols/fi/po1-new.svg');
    }

    /* can display Po2 */
    ["main_states"=~"^(.*;)?FI:Po2(;.*)?$"] {
      marker-file: url('symbols/fi/po2-new.svg');
    }
  }

  /* old type */
  ["feature"="FI:Po-v"]["main_form"="light"] {
    marker-file: url('symbols/fi/po0-old.svg');
    marker-width: 7;
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

    /* can display Po1 */
    ["main_states"=~"^(.*;)?FI:Po1(;.*)?$"] {
      marker-file: url('symbols/fi/po1-old.svg');
    }

    /* can display Po2 */
    ["main_states"=~"^(.*;)?FI:Po2(;.*)?$"] {
      marker-file: url('symbols/fi/po2-old.svg');
    }
  }

  /************************************/
  /* FI combined block signal type So */
  /************************************/
  ["feature"="FI:So"]["combined_form"="light"]["combined_states"=~"^(.*;)?FI:Po1(;.*)?$"]["combined_states"=~"^(.*;)?FI:Eo1(;.*)?$"] {
    marker-file: url('symbols/fi/eo1-po1-combined-block.svg');
    marker-width: 12;
    marker-height: 15;
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
  }
}
