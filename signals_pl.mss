// SPDX-License-Identifier: GPL-3.0-or-later

#railway_signals[zoom>=14] {

  /******************************************/
  /* PL main semaphore signal               */
  /******************************************/
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

    /* PL: can display Sr2 (clear)                    */
    ["feature"="PL-PKP:sr"]["main_states"=~"^(.*;)?PL-PKP:sr2(;.*)?$"] {
      marker-file: url('symbols/de/hp1-semaphore.svg');
      marker-width: 12;
      marker-height: 19;
    }

    /* PL: can display Sr3 (clear slowly)                                */
    ["feature"="PL-PKP:sr"]["main_states"=~"^(.*;)?PL-PKP:sr3(;.*)?$"] {
      marker-file: url('symbols/de/hp2-semaphore.svg');
      marker-width: 12;
      marker-height: 20;
    }
  }

  /**************************************************/
  /* PL distant semaphore signals type On/Od/Ot     */
  /**************************************************/
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

    /* Can display Od2/Ot2  (expect clear) */
    ["distant_states"=~"^(.*;)?PL-PKP:od2(;.*)?$"],
    ["distant_states"=~"^(.*;)?PL-PKP:ot2(;.*)?$"] {
      marker-file: url('symbols/de/vr1-semaphore.svg');
      marker-width: 12;
      marker-height: 19;
      marker-allow-overlap: true;
    }

    /* Can display Ot3  (expect clear slowly) */
    ["distant_states"=~"^(.*;)?DE-ESO:vr2(;.*)?$"],
    ["distant_states"=~"^(.*;)?PL-PKP:ot3(;.*)?$"] {
      marker-file: url('symbols/de/vr2-semaphore.svg');
      marker-width: 12;
      marker-height: 26;
      marker-allow-overlap: true;
    }

    /* Can display On (warning shield) */
    ["distant_states"=~"^(.*;)?PL-PKP:on(;.*)?$"] {
      marker-file: url('symbols/at/vorsignal-vorsicht.svg');
      marker-width: 11;
      marker-height: 11;
      marker-allow-overlap: true;
    }
  }
}
