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

  /*********************************/
  /* DE crossing distant sign Bü 2 */
  /*********************************/
  [zoom>=15]["feature"="DE-ESO:bü2"] {
    marker-file: url('symbols/de/bue2-ds.svg');
    marker-width: 7;
    marker-height: 28;
    marker-allow-overlap: true;

    /* reduced distance */
    ["feature"="DE-ESO:bü2"]["crossing_distant_shortened"="yes"] {
      marker-file: url('symbols/de/bue2-ds-reduced-distance.svg');
    }
  }

  /*********************************/
  /* DE crossing distant sign Bü 3 */
  /*********************************/
  [zoom>=15]["feature"="DE-ESO:bü3"] {
    marker-file: url('symbols/de/bue3.svg');
    marker-width: 5.5;
    marker-height: 26;
    marker-allow-overlap: true;
  }

  /*********************************/
  /* DE whistle sign Bü 4 (DS 301) */
  /*********************************/
  ["feature"="DE-ESO:db:bü4"] {
    marker-file: url('symbols/de/bue4-ds.svg');
    marker-width: 11;
    marker-height: 16;
    marker-allow-overlap: true;

    /* for trains not stopping at a halt */
    ["whistle_only_transit"="yes"] {
      marker-file: url('symbols/de/bue4-ds-only-transit.svg');
      marker-width: 12;
      marker-height: 21;
    }
  }

  /*********************************/
  /* DE whistle sign Pf 1 (DV 301) */
  /*********************************/
  ["feature"="DE-ESO:dr:pf1"] {
    marker-file: url('symbols/de/pf1-dv.svg');
    marker-width: 11;
    marker-height: 16;
    marker-allow-overlap: true;

    /* DE whistle sign Pf 1 (DV 301) for trains not stopping at a halt */
    ["whistle_only_transit"="yes"] {
      marker-file: url('symbols/de/pf1-dv-only-transit.svg');
      marker-width: 12;
      marker-height: 21;
    }
  }

  /*********************/
  /* DE ring sign Bü 5 */
  /*********************/
  [zoom>=15]["feature"="DE-ESO:bü5"] {
    marker-file: url('symbols/de/bue5.svg');
    marker-width: 11;
    marker-height: 16;
    marker-allow-overlap: true;

    /* DE ring sign Bü 5 for trains not stopping at a halt */
    ["ring_only_transit"="yes"] {
      marker-file: url('symbols/de/bue5-only-transit.svg');
      marker-width: 12;
      marker-height: 21;
    }
  }

  /*****************************/
  /* DE crossing signal Bü 0/1 */
  /*****************************/
  [zoom>=15]["feature"="DE-ESO:bü"] {
    marker-file: url('symbols/de/bue1-ds.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;

    /* repeaters */
    ["crossing_repeated"="yes"] {
      marker-file: url('symbols/de/bue1-ds-repeated.svg');
      marker-width: 9;
      marker-height: 21;
    }

    /* shortened breaking distance */
    ["crossing_shortened"="yes"] {
      marker-file: url('symbols/de/bue1-ds-shortened.svg');
      marker-width: 9;
      marker-height: 21;
    }

    /* cannot show Bü 1 */
    ["crossing_form"="sign"] {
      marker-file: url('symbols/de/bue0-ds.svg');
      marker-width: 7;
      marker-height: 16;

      /* repeaters */
      ["crossing_repeated"="yes"] {
        marker-file: url('symbols/de/bue0-ds-repeated.svg');
        marker-width: 9;
        marker-height: 21;
      }

      /* shortened breaking distance */
      ["crossing_shortened"="yes"] {
        marker-file: url('symbols/de/bue0-ds-shortened.svg');
        marker-width: 9;
        marker-height: 21;
      }
    }
  }

  /*****************************************************************************/
  /* DE crossing signal Bü 0/1 (ex. So 16a/b) which can show Bü 1 (ex. So 16b) */
  /*****************************************************************************/
  [zoom>=15]["feature"="DE-ESO:so16"]["crossing_form"="light"] {
    marker-file: url('symbols/de/bue1-dv.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;

    /* repeaters */
    ["crossing_repeated"="yes"] {
      marker-file: url('symbols/de/bue1-dv-repeated.svg');
      marker-width: 9;
      marker-height: 21;
    }

    /* shortened breaking distance */
    ["crossing_shortened"="yes"] {
      marker-file: url('symbols/de/bue1-dv-shortened.svg');
      marker-width: 9;
      marker-height: 21;
    }
  }

  /**************************/
  /* FI crossing signal To  */
  /**************************/
  [zoom>=15]["feature"="FI:To"]["crossing_form"="light"] {
    marker-file: url('symbols/fi/to1.svg');
    marker-width: 7;
    marker-height: 12;
    marker-allow-overlap: true;
  }

  /***************************************************/
  /* DE tram signal "start of train protection" So 1 */
  /***************************************************/
  [zoom>=15]["feature"="DE-BOStrab:so1"],
  [zoom>=15]["feature"="DE-AVG:so1"] {
    ["train_protection_form"="sign"]["train_protection_type"="start"] {
      marker-file: url('symbols/de/bostrab/so1.svg');
      marker-width: 12;
      marker-height: 12;
      marker-allow-overlap: true;
    }
  }

  /***************************************************/
  /* DE tram signal "end of train protection" So 2 */
  /***************************************************/
  [zoom>=15]["feature"="DE-BOStrab:so2"],
  [zoom>=15]["feature"="DE-AVG:so2"] {
    ["train_protection_form"="sign"]["train_protection_type"="end"] {
      marker-file: url('symbols/de/bostrab/so2.svg');
      marker-width: 12;
      marker-height: 12;
      marker-allow-overlap: true;
    }
  }

  /********************************/
  /* DE station distant sign Ne 6 */
  /********************************/
  ["feature"="DE-ESO:ne6"]["station_distant_form"="sign"] {
    marker-file: url('symbols/de/ne6.svg');
    marker-width: 24;
    marker-height: 5;
    marker-allow-overlap: true;
  }

  /****************************/
  /* DE stop demand post Ne 5 */
  /****************************/
  [zoom>=17]["feature"="DE-ESO:ne5"]["stop_demand_form"="light"]["stop_form"=null],
  [zoom>=17]["feature"="DE-ESO:ne5"]["stop_form"="sign"]["stop_demand_form"=null] {
    marker-file: url('symbols/de/ne5-sign.svg');
    marker-width: 11;
    marker-height: 16;
    marker-allow-overlap: true;

    ["stop_form"="light"] {
      marker-file: url('symbols/de/ne5-light.svg');
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
    marker-file: url('symbols/de/ra10.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /*********************************************/
  /* DE wrong road signal Zs 6(DB) /Zs 7(DR)  */
  /*********************************************/
  /* sign DB version */
  [zoom>=17]["wrong_road"="DE-ESO:db:zs6"]["wrong_road_form"="sign"] {
    marker-file: url('symbols/de/zs6-sign.svg');
    marker-width: 12;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /* light DB version */
  [zoom>=17]["wrong_road"="DE-ESO:db:zs6"]["wrong_road_form"="light"] {
    marker-file: url('symbols/de/zs6-db-light.svg');
    marker-width: 12;
    marker-height: 16;
    marker-allow-overlap: true;
  }

    /* light DR version */
  [zoom>=17]["wrong_road"="DE-ESO:dr:zs7"]["wrong_road_form"="light"] {
    marker-file: url('symbols/de/zs7-dr-light.svg');
    marker-width: 12;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /********************************/
  /* DE tram minor stop sign Sh 1 */
  /********************************/
  [zoom>=17]["feature"="DE-BOStrab:sh1"]["minor_form"="sign"] {
    marker-file: url('symbols/de/bostrab/sh1.svg');
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

  /****************************************/
  /* DE tram passing prohibited sign So 5 */
  /****************************************/
  [zoom>=17]["feature"="DE-BOStrab:so5"]["passing_form"="sign"]["passing_type"="no_passing"] {
    marker-file: url('symbols/de/bostrab/so5.svg');
    marker-width: 12;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [passing_caption];
      text-fill: @signal-text-fill;
      text-halo-radius: 3;
      text-halo-fill: @signal-text-halo-fill;
      text-dy: 12;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /********************************************/
  /* DE tram passing prohibited end sign So 6 */
  /********************************************/
  [zoom>=17]["feature"="DE-BOStrab:so6"]["passing_form"="sign"]["passing_type"="passing_allowed"] {
    marker-file: url('symbols/de/bostrab/so6.svg');
    marker-width: 12;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [passing_caption];
      text-fill: @signal-text-fill;
      text-halo-radius: 3;
      text-halo-fill: @signal-text-halo-fill;
      text-dy: 12;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /**************************************************/
  /* DE shunting signal Ra 11 without Sh 1          */
  /* AT Wartesignal ohne "Verschubverbot aufgehoben */
  /**************************************************/
  [zoom>=17]["feature"="DE-ESO:ra11"]["shunting_form"="sign"],
  [zoom>=17]["feature"="AT-V2:wartesignal"]["shunting_form"="sign"] {
    marker-file: url('symbols/de/ra11-sign.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /**************************************/
  /* DE shunting signal Ra 11 with Sh 1 */
  /**************************************/
  [zoom>=17]["feature"="DE-ESO:ra11"]["shunting_form"="light"] {
    marker-file: url('symbols/de/ra11-sh1.svg');
    marker-width: 14;
    marker-height: 15;
    marker-allow-overlap: true;
  }

  /********************************************/
  /* DE shunting signal Ra 11b (without Sh 1) */
  /********************************************/
  [zoom>=17]["feature"="DE-ESO:ra11b"]["shunting_form"="sign"] {
    marker-file: url('symbols/de/ra11b.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /**********************************/
  /* DE minor light signals type Sh */
  /**********************************/
  [zoom>=17]["feature"="DE-ESO:sh"]["minor_form"="light"] {
    /* cannot show Sh 1 or is a dwarf signal */
    marker-file: url('symbols/de/sh0-light-dwarf.svg');
    marker-width: 12;
    marker-height: 8;
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

    /* normal height or no height tagged, can show sh1 or no states are tagged */
    ["minor_height"="normal"]["minor_states"=~"^(.*;)?DE-ESO:sh1(;.*)?$"],
    ["minor_height"="normal"]["minor_states"=null],
    ["minor_height"=null]["minor_states"=~"^(.*;)?DE-ESO:sh1(;.*)?$"],
    ["minor_height"=null]["minor_states"=null] {
      marker-file: url('symbols/de/sh1-light-normal.svg');
      marker-width: 12;
      marker-height: 9;
      marker-allow-overlap: true;
    }
  }

  /************************************************/
  /* DE minor semaphore signals and signs type Sh */
  /************************************************/
  [zoom>=17]["feature"="DE-ESO:sh"]["minor_form"="semaphore"],
  [zoom>=17]["feature"="DE-ESO:sh0"]["minor_form"="sign"] {
    marker-file: url('symbols/de/sh0-semaphore-dwarf.svg');
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

    ["minor_states"=~"^(.*;)?DE-ESO:wn7(;.*)?$"] {
      marker-file: url('symbols/de/wn7-semaphore-normal.svg');
      marker-width: 12;
      marker-height: 11;
      marker-allow-overlap: true;
  }

    ["minor_form"="semaphore"]["minor_height"="normal"],
    ["minor_form"="semaphore"]["minor_height"=null] {
      marker-file: url('symbols/de/sh1-semaphore-normal.svg');
      marker-width: 10;
      marker-height: 12;
      marker-allow-overlap: true;
    }
  }

  /************************************************/
  /* DE signal Sh 2 as signal and at buffer stops */
  /************************************************/
  [zoom>=17]["feature"="DE-ESO:sh2"],
  [zoom>=17]["feature"="DE-BOStrab:sh2"] {
    marker-file: url('symbols/de/sh2.svg');
    marker-width: 16;
    marker-height: 13;
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

  /***********************************************************************/
  /* DE Signalhaltmelder Zugleitbetrieb                                  */
  /* repeats DE-ESO:hp0 of the entrance main signal to the halt position */
  /***********************************************************************/
  [zoom>=17]["feature"="DE-DB:signalhaltmelder"]["main_repeated_form"="light"] {
    marker-file: url('symbols/de/zlb-haltmelder-light.svg');
    marker-width: 10;
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

  /***************************/
  /* DE main entry sign Ne 1 */
  /* AT Trapeztafel          */
  /***************************/
  ["feature"="DE-ESO:ne1"]["main_form"="sign"],
  ["feature"="AT-V2:trapeztafel"]["main_form"="sign"] {
    marker-file: url('symbols/de/ne1.svg');
    marker-width: 16;
    marker-height: 10;
    marker-allow-overlap: true;
  }

  /********************************************************************************/
  /* DE distant light signals type Vr which                                       */
  /*  - are repeaters or shortened                                                */
  /*  - have no railway:signal:states=* tag                                       */
  /*  - OR have railway:signal:states=* tag that does neither include Vr1 nor Vr2 */
  /********************************************************************************/
  ["feature"="DE-ESO:vr"]["distant_form"="light"] {
    marker-file: url('symbols/de/vr0-light.svg');
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

    /*  can display Vr 1 */
    ["distant_states"=~"^(.*;)?DE-ESO:vr1(;.*)?$"] {
      marker-file: url('symbols/de/vr1-light.svg');
    }

    /*  can display Vr 2 */
    ["distant_states"=~"^(.*;)?DE-ESO:vr2(;.*)?$"] {
      marker-file: url('symbols/de/vr2-light.svg');
    }

    ["distant_repeated"="yes"],
    ["distant_shortened"="yes"] {
      marker-file: url('symbols/de/vr0-light-repeated.svg');

      /* can display Vr 1 */
      /* Signals which can Vr 2 as well will match the next rule as well which will overwrite this rule. */
      ["distant_states"=~"^(.*;)?DE-ESO:vr1(;.*)?$"] {
        marker-file: url('symbols/de/vr1-light-repeated.svg');
      }

      /* can display Vr 2 */
      ["distant_states"=~"^(.*;)?DE-ESO:vr2(;.*)?$"] {
        marker-file: url('symbols/de/vr2-light-repeated.svg');
      }
    }
  }

  /********************************************************************************/
  /* DE distant semaphore signals type Vr which                                   */
  /*  - have no railway:signal:states=* tag                                       */
  /*  - OR have railway:signal:states=* tag that does neither include Vr1 nor Vr2 */
  /*                                                                              */
  /* PL distant semaphore signals type On/Od/Ot                                   */
  /********************************************************************************/
  ["feature"="DE-ESO:vr"]["distant_form"="semaphore"],
  ["feature"="PL-PKP:on"]["distant_form"="semaphore"],
  ["feature"="PL-PKP:od"]["distant_form"="semaphore"],
  ["feature"="PL-PKP:ot"]["distant_form"="semaphore"] {
    marker-file: url('symbols/de/vr0-semaphore.svg');
    marker-width: 12;
    marker-height: 26;
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

    /* DE: can display Vr 1                                          */
    /* This rule is overwritten if the signal can show Vr 2 as well. */
    /* PL: can display Od2/Ot2  (expect clear)                       */
    ["feature"="DE-ESO:vr"]["distant_states"=~"^(.*;)?DE-ESO:vr1(;.*)?$"],
    ["feature"="PL-PKP:od"]["distant_states"=~"^(.*;)?PL-PKP:od2(;.*)?$"],
    ["feature"="PL-PKP:ot"]["distant_states"=~"^(.*;)?PL-PKP:ot2(;.*)?$"] {
      marker-file: url('symbols/de/vr1-semaphore.svg');
      marker-width: 12;
      marker-height: 19;
      marker-allow-overlap: true;
    }

    /* DE: can display Vr 2                       */
    /* PL: can display Ot3  (expect clear slowly) */
    ["feature"="DE-ESO:vr"]["distant_states"=~"^(.*;)?DE-ESO:vr2(;.*)?$"],
    ["feature"="PL-PKP:ot"]["distant_states"=~"^(.*;)?PL-PKP:ot3(;.*)?$"] {
      marker-file: url('symbols/de/vr2-semaphore.svg');
      marker-width: 12;
      marker-height: 26;
      marker-allow-overlap: true;
    }

    /* PL: can display On (warning shield) */
    ["feature"="PL-PKP:on"]["distant_states"=~"^(.*;)?PL-PKP:on(;.*)?$"] {
      marker-file: url('symbols/at/vorsignal-vorsicht.svg');
      marker-width: 11;
      marker-height: 11;
      marker-allow-overlap: true;
    }
  }

  /****************************************/
  /* DE Hamburger Hochbahn distant signal */
  /****************************************/
  ["feature"="DE-HHA:v"]["distant_form"="light"] {
    marker-file: url('symbols/de/hha/v1.svg');
    marker-width: 5;
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
  }

  /***************************************/
  /* DE block marker ("Blockkennzeichen) */
  /***************************************/
  ["feature"="DE-ESO:blockkennzeichen"] {
      marker-file: url('symbols/de/blockkennzeichen.svg');
      marker-allow-overlap: true;
      marker-width: 14;
      marker-height: 14;

    ::text {
      text-name: [ref];
      text-dy: 10;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    [zoom=16][height<=1][width<=2],
    [zoom>=17][height<=2][width<=4] {
      shield-file: url('symbols/flex/de/blockkennzeichen-[width]x[height].svg');
      shield-name: [ref_multiline];
      shield-fill: black;
      shield-face-name: @book-fonts;
      shield-size: 10;
      shield-allow-overlap: true;
    }
  }

  /*******************************************/
  /* DE Ne12 resetting switch distant signal */
  /*******************************************/
  [zoom>=17]["feature"="DE-ESO:ne12"]["resetting_switch_distant_form"="sign"] {
    marker-file: url('symbols/de/ne12.svg');
    marker-width: 5.5;
    marker-height: 26;
    marker-allow-overlap: true;
  }

  /***********************************/
  /* DE Ne13 resetting switch signal */
  /***********************************/
  [zoom>=17]["feature"="DE-ESO:ne13"]["resetting_switch_form"="light"] {
    marker-file: url('symbols/de/ne13a.svg');
    marker-width: 12;
    marker-height: 8;
    marker-allow-overlap: true;
  }

  /************************************/
  /* DE ETCS stop marker              */
  /* NL ETCS stopplaatsmarkering 227b */
  /************************************/
  ["feature"="DE-ESO:ne14"]["train_protection_form"="sign"]["train_protection_type"="block_marker"],
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
  /* DE distant signal replacement by sign So 106 */
  /* AT Kreuztafel                                */
  /************************************************/
  ["feature"="DE-ESO:so106"]["distant_form"="sign"],
  ["feature"="AT-V2:kreuztafel"]["distant_form"="sign"] {
    marker-file: url('symbols/de/so106.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /**********************************************/
  /* DE distant signal replacement by sign Ne 2 */
  /**********************************************/
  ["feature"="DE-ESO:db:ne2"]["distant_form"="sign"] {
    marker-file: url('symbols/de/ne2.svg');
    marker-width: 10;
    marker-height: 16;
    marker-allow-overlap: true;

    /* reduced distance */
    ["distant_shortened"="yes"] {
      marker-file: url('symbols/de/ne2-reduced-distance.svg');
      marker-width: 7;
      marker-height: 18;
    }
  }

  /******************************************/
  /* DE main semaphore signals type Hp      */
  /* AT main semaphore signal "Hauptsignal" */
  /* PL main semaphore signal               */
  /******************************************/
  ["feature"="DE-ESO:hp"]["main_form"="semaphore"],
  ["feature"="AT-V2:hauptsignal"]["main_form"="semaphore"],
  ["feature"="PL-PKP:sr"]["main_form"="semaphore"] {
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

    /* DE: can display Hp 1                           */
    /* AT: can display "Frei" (proceed at full speed) */
    /* PL: can display Sr2 (clear)                    */
    ["feature"="DE-ESO:hp"]["main_states"=~"^(.*;)?DE-ESO:hp1(;.*)?$"],
    ["feature"="AT-V2:hauptsignal"]["main_states"=~"^(.*;)?AT-V2:frei(;.*)?$"],
    ["feature"="PL-PKP:sr"]["main_states"=~"^(.*;)?PL-PKP:sr2(;.*)?$"] {
      marker-file: url('symbols/de/hp1-semaphore.svg');
      marker-width: 12;
      marker-height: 19;
    }

    /* DE: can display Hp 2                                              */
    /* AT: can display "Frei mit 40" (proceed at 40 kph)                 */
    /* AT: can display "Frei mit 20" (proceed at 20 kph) -- narrow gauge */
    /* PL: can display Sr3 (clear slowly)                                */
    ["feature"="DE-ESO:hp"]["main_states"=~"^(.*;)?DE-ESO:hp2(;.*)?$"],
    ["feature"="AT-V2:hauptsignal"]["main_states"=~"^(.*;)?AT-V2:frei_mit_40(;.*)?$"],
    ["feature"="AT-V2:hauptsignal"]["main_states"=~"^(.*;)?AT-V2:frei_mit_20(;.*)?$"],
    ["feature"="PL-PKP:sr"]["main_states"=~"^(.*;)?PL-PKP:sr3(;.*)?$"] {
      marker-file: url('symbols/de/hp2-semaphore.svg');
      marker-width: 12;
      marker-height: 20;
    }
  }

  /******************************************/
  /* DE main light signals type Hp which    */
  /******************************************/
  ["feature"="DE-ESO:hp"]["main_form"="light"] {
    marker-file: url('symbols/de/hp0-light.svg');
    marker-width: 9;
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

    /* cannot display Hp 2 */
    ["main_states"=~"^(.*;)?DE-ESO:hp1(;.*)?$"] {
      marker-file: url('symbols/de/hp1-light.svg');
    }

    /*can display Hp 2 */
    ["main_states"=~"^(.*;)?DE-ESO:hp2(;.*)?$"] {
      marker-file: url('symbols/de/hp2-light.svg');
      marker-width: 8;
      marker-height: 16;
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

  /*******************************************************/
  /* DE main, combined and distant light signals type Hl */
  /*******************************************************/
  ["feature"="DE-ESO:hl"] {
    /* =null filters are required to avoid unnecessary filter rules in the resulting XML file */
    ["distant_form"="light"]["main_form"=null]["combined_form"=null] {
      marker-file: url('symbols/de/hl1-distant.svg');
      marker-width: 8;
      marker-height: 12;
      marker-allow-overlap: true;
    }

    ["distant_form"="light"]::text,
    ["combined_form"="light"]::text,
    ["main_form"="light"]::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    ["main_form"="light"]["distant_form"=null]["combined_form"=null] {
      marker-file: url('symbols/de/hl0.svg');
      marker-width: 7;
      marker-height: 16;
      marker-allow-overlap: true;

      /* can display Hl 1 */
      ["main_states"=~"^(.*;)?DE-ESO:hl1(;.*)?$"] {
        marker-file: url('symbols/de/hl1.svg');
      }

      /* can display Hl 3a */
      ["main_states"=~"^(.*;)?DE-ESO:hl3a(;.*)?$"] {
        marker-file: url('symbols/de/hl3a.svg');
      }

      /* can display Hl 3b */
      ["main_states"=~"^(.*;)?DE-ESO:hl3b(;.*)?$"] {
        marker-file: url('symbols/de/hl3b.svg');
        marker-width: 8;
        marker-height: 24;
      }

      /* can display Hl 2 */
      ["main_states"=~"^(.*;)?DE-ESO:hl2(;.*)?$"] {
        marker-file: url('symbols/de/hl2.svg');
        marker-width: 8;
        marker-height: 24;
      }
    }

    ["combined_form"="light"]["main_form"=null]["distant_form"=null] {
      marker-file: url('symbols/de/hl0.svg');
      marker-width: 7;
      marker-height: 16;
      marker-allow-overlap: true;

      /* can display Hl 10 */
      ["combined_states"=~"^(.*;)?DE-ESO:hl10(;.*)?$"] {
        marker-file: url('symbols/de/hl10.svg');
      }

      /* cannot display Hl 12a */
      ["combined_states"=~"^(.*;)?DE-ESO:hl12a(;.*)?$"] {
        marker-file: url('symbols/de/hl12a.svg');
      }

      /* cannot display Hl 12b */
      ["combined_states"=~"^(.*;)?DE-ESO:hl12b(;.*)?$"] {
        marker-file: url('symbols/de/hl12b.svg');
        marker-width: 8;
        marker-height: 24;
      }

      /* can display Hl 11 */
      ["combined_states"=~"^(.*;)?DE-ESO:hl11(;.*)?$"] {
        marker-file: url('symbols/de/hl11.svg');
        marker-width: 8;
        marker-height: 24;
      }
    }
  }

  /*************************************/
  /* DE combined light signals type Sv */
  /*************************************/
  ["feature"="DE-ESO:sv"] {
    /* can display Sv0 */
    ["combined_states"=~"^(.*;)?DE-ESO:sv0(;.*)?$"] {
      marker-file: url('symbols/de/sv-sv0.svg');
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
    }

    /* can display Hp 0 */
    ["combined_states"=~"^(.*;)?DE-ESO:hp0(;.*)?$"] {
      marker-file: url('symbols/de/sv-hp0.svg');
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
    }
  }

  /************************************/
  /* DE tram main signal "Fahrsignal" */
  /************************************/
  [zoom>=15]["feature"="DE-BOStrab:f"]["main_form"="light"],
  [zoom>=15]["feature"="DE-AVG:f"]["main_form"="light"] {
    marker-width: 10;
    marker-height: 20;
    marker-allow-overlap: true;
    marker-file: url('symbols/de/bostrab/f0.svg');

    ::text {
      text-name: [ref];
      text-dy: 16;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /************************************/
    /* DE tram main signal "Fahrsignal" */
    /* can show F 1 (proceed straight)  */
    /************************************/
    ["feature"="DE-BOStrab:f"]["main_form"="light"]["main_states"=~"^(.*;)?DE-BOStrab:f1(;.*)?$"],
    ["feature"="DE-AVG:f"]["main_form"="light"]["main_states"=~"^(.*;)?DE-AVG:f1(;.*)?$"] {
      marker-file: url('symbols/de/bostrab/f1.svg');
    }

    /************************************/
    /* DE tram main signal "Fahrsignal" */
    /* can show F 2 (proceed right)     */
    /************************************/
    ["feature"="DE-BOStrab:f"]["main_form"="light"]["main_states"=~"^(.*;)?DE-BOStrab:f2(;.*)?$"],
    ["feature"="DE-AVG:f"]["main_form"="light"]["main_states"=~"^(.*;)?DE-AVG:f2(;.*)?$"] {
      marker-file: url('symbols/de/bostrab/f2.svg');
    }

    /************************************/
    /* DE tram main signal "Fahrsignal" */
    /* can show F 3 (proceed left)      */
    /************************************/
    ["feature"="DE-BOStrab:f"]["main_form"="light"]["main_states"=~"^(.*;)?DE-BOStrab:f3(;.*)?$"],
    ["feature"="DE-AVG:f"]["main_form"="light"]["main_states"=~"^(.*;)?DE-AVG:f3(;.*)?$"] {
      marker-file: url('symbols/de/bostrab/f3.svg');
    }

    /************************************/
    /* DE tram main signal "Fahrsignal" */
    /* can show F 5 (permissive)        */
    /************************************/
    ["main_states"=~"^(.*;)?(DE-BOStrab|DE-AVG):f5(;.*)?$"] {
      marker-file: url('symbols/de/bostrab/f5.svg');
    }
  }

  /****************************************/
  /* DE Hamburger Hochbahn main signal    */
  /****************************************/
  ["feature"="DE-HHA:h"]["main_form"="light"] {
    marker-file: url('symbols/de/hha/h0.svg');
    marker-width: 6;
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

    /*************************************/
    /* with railway:signal:main:states=* */
    /*************************************/
    ["feature"="DE-HHA:h"]["main_form"="light"]["main_states"!=null] {
      marker-file: url('symbols/de/hha/h1.svg');
    }
  }

  /*************************************************/
  /* DE main, combined and distant signals type Ks */
  /*************************************************/
  ["feature"="DE-ESO:ks"] {
    /* We have to add filters for form=null to avoid unnecessary and duplicated rules in the resulting XML file. */
    ["distant_form"="light"]["main_form"=null]["combined_form"=null] {
      marker-file: url('symbols/de/ks-distant.svg');
      marker-width: 10;
      marker-height: 16;
      marker-allow-overlap: true;

      /* repeaters */
      ["distant_repeated"="yes"] {
        marker-file: url('symbols/de/ks-distant-repeated.svg');
        marker-width: 10;
        marker-height: 16;
        marker-allow-overlap: true;
      }

      /* shortened breaking distance */
      ["distant_shortened"="yes"] {
        marker-file: url('symbols/de/ks-distant-shortened.svg');
        marker-width: 10;
        marker-height: 16;
        marker-allow-overlap: true;
      }
    }

    ["main_form"="light"]::text,
    ["distant_form"="light"]::text,
    ["combined_form"="light"]::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /* main signals */
    ["main_form"="light"]["distant_form"=null]["combined_form"=null] {
      marker-file: url('symbols/de/ks-main.svg');
      marker-width: 10;
      marker-height: 16;
      marker-allow-overlap: true;
    }

    /* combined signals */
    ["combined_form"="light"]["main_form"=null]["distant_form"=null] {
      marker-file: url('symbols/de/ks-combined.svg');
      marker-width: 10;
      marker-height: 16;
      marker-allow-overlap: true;

      /* combined signals, reduced breaking distance */
      ["combined_shortened"="yes"] {
        marker-file: url('symbols/de/ks-combined-shortened.svg');
      }
    }
  }

  /*******************************************************/
  /* PL main, combined and distant light signals */
  /*******************************************************/
  ["feature"="PL-PKP:s"] {
    ["combined_form"="light"]::text {
      text-name: [ref];
      text-dy: 18;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    ["main_form"="light"]::text {
      text-name: [ref];
      text-dy: 10;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    } 

    ["main_form"="light"]["combined_form"=null] {
      marker-file: url('symbols/pl/s1-main.svg');
      marker-width: 10;
      marker-height: 15;
      marker-allow-overlap: true;

      /* can display S2 */
      ["main_states"=~"^(.*;)?PL-PKP:s2(;.*)?$"] {
        marker-file: url('symbols/pl/s2-main.svg');
      }
    }

    ["combined_form"="light"]["main_form"=null] {
      marker-file: url('symbols/pl/s1.svg');
      marker-width: 10;
      marker-height: 30;
      marker-allow-overlap: true;

      /* can display S2 */
      ["combined_states"=~"^(.*;)?PL-PKP:s2(;.*)?$"] {
        marker-file: url('symbols/pl/s2.svg');
      }

      /* can display S5 */
      ["combined_states"=~"^(.*;)?PL-PKP:s5(;.*)?$"] {
        marker-file: url('symbols/pl/s5.svg');
      }

      /* can display S9 */
      ["combined_states"=~"^(.*;)?PL-PKP:s9(;.*)?$"] {
        marker-file: url('symbols/pl/s9.svg');
      }

      /* cannot display S13 */
      ["combined_states"=~"^(.*;)?PL-PKP:s13(;.*)?$"] {
        marker-file: url('symbols/pl/s13.svg');
      }

      /* cannot display S13a */
      ["combined_states"=~"^(.*;)?PL-PKP:s13a(;.*)?$"] {
        marker-file: url('symbols/pl/s13a.svg');
        marker-height: 34;
      }

      /* can display S6 */
      ["combined_states"=~"^(.*;)?PL-PKP:s6(;.*)?$"] {
        marker-file: url('symbols/pl/s6.svg');
      }

      /* can display S10a */
      ["combined_states"=~"^(.*;)?PL-PKP:s10a(;.*)?$"] {
        marker-file: url('symbols/pl/s10a.svg');
        marker-height: 34;
      }

      /* can display S10 */
      ["combined_states"=~"^(.*;)?PL-PKP:s10(;.*)?$"] {
        marker-file: url('symbols/pl/s10.svg');
        marker-height: 34;
      }
    }
  }

  /*******************************************************/
  /* PL main, combined light signal repeaters */
  /*******************************************************/
  ["feature"="PL-PKP:sp"] {
    ["distant_form"="light"] {
      marker-file: url('symbols/pl/sp1.svg');
      marker-width: 10;
      marker-height: 20;
      marker-allow-overlap: true;
    }

    ["distant_form"="light"]::text {
      text-name: [ref];
      text-dy: 13;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /* can display Sp2 */
    ["distant_states"=~"^(.*;)?PL-PKP:sp2(;.*)?$"] {
      marker-file: url('symbols/pl/sp2.svg');
    }
  }

  /*******************************************************/
  /* PL distant light signals                            */
  /*******************************************************/
  ["feature"="PL-PKP:os"] {
    ["distant_form"="light"] {
      marker-file: url('symbols/pl/os1.svg');
      marker-width: 10;
      marker-height: 15;
      marker-allow-overlap: true;
    }

    ["distant_form"="light"]::text {
      text-name: [ref];
      text-dy: 10;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /* can display Os2 */
    ["distant_states"=~"^(.*;)?PL-PKP:os2(;.*)?$"] {
      marker-file: url('symbols/pl/os2.svg');
    }
  }

  /*******************************************************/
  /* PL shunting signals */
  /*******************************************************/
  [zoom>=17]["feature"="PL-PKP:ms"] {
    ["shunting_form"="light"] {
      marker-file: url('symbols/pl/ms1.svg');
      marker-width: 10;
      marker-height: 15;
      marker-allow-overlap: true;
    }

    ["shunting_form"="light"]::text {
      text-name: [ref];
      text-dy: 10;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }
}
