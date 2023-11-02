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
}
