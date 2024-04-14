// SPDX-License-Identifier: GPL-3.0-or-later

#railway_signals[zoom>=14] {

  /********************************/
  /*             AT V2            */
  /********************************/

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

  /************************************************/
  /* AT Kreuztafel                                */
  /************************************************/
  ["feature"="AT-V2:kreuztafel"]["distant_form"="sign"] {
    marker-file: url('symbols/de/so106.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }
}
