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
