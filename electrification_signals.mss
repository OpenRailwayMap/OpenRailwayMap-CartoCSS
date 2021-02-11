@de-el-size: 18;
@de-el-size-with-arrow: @de-el-size * 1.286;

#electrification-signals[zoom>=17] {
  ["signal_direction"!=null] {
    /*************************************/
    /* DE pantograph down advance El 3   */
    /* AT Ankündigung Stromabnehmer tief */
    /*************************************/
    ["electricity_type"="pantograph_down_advance"]["electricity_form"="sign"] {
      ["signal_electricity"="DE-ESO:el3"],
      ["signal_electricity"="AT-V2:andkündigung_stromabnehmer_tief"] {
        marker-file: url("symbols/de/el3.svg");
        marker-width: @de-el-size;
        marker-height: @de-el-size;
        marker-allow-overlap: true;
      }
    }

    /************************************/
    /* DE power off advance sign El 1v  */
    /* AT Ankündigung Hauptschalter aus */
    /************************************/
    ["electricity_type"="power_off_advance"]["electricity_form"="sign"] {
      ["signal_electricity"="DE-ESO:el1v"],
      ["signal_electricity"="AT-V2:ankündigung_hauptschalter_aus"] {
        marker-file: url("symbols/de/el1v.svg");
        marker-width: @de-el-size;
        marker-height: @de-el-size;
        marker-allow-overlap: true;
      }
    }

    /*******************************************************/
    /* DE end of catenary sign El 6                        */
    /* AT Halt für Fahrzeuge mit angehobenem Stromabnehmer */
    /*******************************************************/
    ["electricity_type"="end_of_catenary"]["electricity_form"="sign"] {
      ["signal_electricity"="DE-ESO:el6"],
      ["signal_electricity"="AT-V2:halt_fuer_fahrzeuge_mit_angehobenem_stromabnehmer"] {
        marker-file: url("symbols/de/el6.svg");
        marker-width: @de-el-size;
        marker-height: @de-el-size;
        marker-allow-overlap: true;

        ["electricity_turn_direction"="right"] {
          marker-file: url("symbols/de/el6-right.svg");
          marker-width: @de-el-size;
          marker-height: @de-el-size-with-arrow;
        }

        ["electricity_turn_direction"="left"] {
          marker-file: url("symbols/de/el6-left.svg");
          marker-width: @de-el-size;
          marker-height: @de-el-size-with-arrow;
        }
      }
    }

    /**************************/
    /* DE power on sign El 2 */
    /* AT Hauptschalter ein   */
    /**************************/
    ["electricity_type"="power_on"]["electricity_form"="sign"] {
      ["signal_electricity"="DE-ESO:el2"],
      ["signal_electricity"="AT-V2:hauptschalter_ein"] {
        marker-file: url("symbols/de/el2.svg");
        marker-width: @de-el-size;
        marker-height: @de-el-size;
        marker-allow-overlap: true;
      }
    }

    /*************************/
    /* DE pantograph up El 5 */
    /* AT Stromabnehmer hoch */
    /*************************/
    ["electricity_type"="pantograph_up"]["electricity_form"="sign"] {
      ["signal_electricity"="DE-ESO:el5"],
      ["signal_electricity"="AT-V2:stromabnehmer_hoch"] {
        marker-file: url("symbols/de/el5.svg");
        marker-width: @de-el-size;
        marker-height: @de-el-size;
        marker-allow-overlap: true;
      }
    }

    /**************************/
    /* DE power off sign El 1 */
    /* AT Hauptschalter aus   */
    /**************************/
    ["electricity_type"="power_off"]["electricity_form"="sign"] {
      ["signal_electricity"="DE-ESO:el1"],
      ["signal_electricity"="AT-V2:hauptschalter_aus"] {
        marker-file: url("symbols/de/el1.svg");
        marker-width: @de-el-size;
        marker-height: @de-el-size;
        marker-allow-overlap: true;
      }
    }

    /***************************/
    /* DE pantograph down El 4 */
    /* AT Stromabnehmer tief   */
    /***************************/
    ["electricity_type"="pantograph_down"]["electricity_form"="sign"] {
      ["signal_electricity"="DE-ESO:el4"],
      ["signal_electricity"="AT-V2:stromabnehmer_tief"] {
        marker-file: url("symbols/de/el4.svg");
        marker-width: @de-el-size;
        marker-height: @de-el-size;
        marker-allow-overlap: true;
      }
    }
  }

  /*******************************************/
  /* DE tram power off shortly signal (St 7) */
  /*******************************************/
  ["signal_electricity"="DE-BOStrab:st7"]["electricity_type"="power_off_shortly"]["electricity_form"="sign"],
  ["signal_electricity"="DE-AVG:st7"]["electricity_type"="power_off_shortly"]["electricity_form"="sign"] {
    marker-file: url("symbols/de/bostrab/st7.svg");
    marker-width: 11;
    marker-height: 12;
    marker-allow-overlap: true;
  }
}
