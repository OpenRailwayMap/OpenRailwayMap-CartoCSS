@text-halo-color: white;
@text-halo-radius: 1;

@construction-dashes: 6,6;
@dual-construction-dashes: 3,9;
@multi-construction-dashes: 0,2,2,8;

@proposed-dashes: 4,8;

@dual-gauge-dashes: 9,9;
@multi-gauge-dashes: 0,6,6,6;

@color_gauge_0064: #006060;
@color_gauge_0089: #008080;
@color_gauge_0127: #00A0A0;
@color_gauge_0184: #00C0C0;
@color_gauge_0190: #00E0E0;
@color_gauge_0260: #00FFFF;
@color_gauge_0381: #80FFFF;
@color_gauge_0500: #A0FFFF;
@color_gauge_0597: #C0FFFF;
@color_gauge_0600: #E0FFFF;
@color_gauge_0610: #FFE0FF;
@color_gauge_0700: #FFC0FF;
@color_gauge_0750: #FFA0FF;
@color_gauge_0760: #FF80FF;
@color_gauge_0762: #FF60FF;
@color_gauge_0785: #FF40FF;
@color_gauge_0800: #FF00FF;
@color_gauge_0891: #E000FF;
@color_gauge_0900: #C000FF;
@color_gauge_0914: #A000FF;
@color_gauge_0950: #8000FF;
@color_gauge_1000: #6000FF;
@color_gauge_1009: #4000FF;
@color_gauge_1050: #0000FF;
@color_gauge_1067: #0000E0;
@color_gauge_1100: #0000C0;
@color_gauge_1200: #0000A0;
@color_gauge_1372: #000080;
@color_gauge_1422: #000060;
@color_gauge_1432: #000040;
@color_gauge_1435: #000000;
@color_gauge_1440: #400000;
@color_gauge_1445: #600000;
@color_gauge_1450: #700000;
@color_gauge_1458: #800000;
@color_gauge_1495: #A00000;
@color_gauge_1520: #C00000;
@color_gauge_1522: #E00000;
@color_gauge_1524: #FF0000;
@color_gauge_1581: #FF6000;
@color_gauge_1588: #FF8000;
@color_gauge_1600: #FFA000;
@color_gauge_1668: #FFC000;
@color_gauge_1676: #FFE000;
@color_gauge_1700: #FFFF00;
@color_gauge_1800: #E0FF00;
@color_gauge_1880: #C0FF00;
@color_gauge_2000: #A0FF00;
@color_gauge_miniature: #80C0C0;
@color_gauge_monorail: #C0C080;
@color_gauge_broad: #FFC0C0;
@color_gauge_narrow: #C0C0FF;
@color_gauge_standard: #808080;
@color_gauge_unknown: #C0C0C0;

/**
  * Railway tracks with dual gauge or multiple gauge are rendered with a second symbolizer
  * called railway_dual_gauge_line and a third symbolizer called railway_multi_gauge_line.
  * It adds dashed lines on top of existing lines (e.g. a red dashed line
  * on a black line, for the dual gauge 1435mm/1524mm).
  *
  * Common rules in common.mss are defined for the ::fill and ::casing symbolizers only.
  * Therefore, the rules from common.mss for ::fill need to be repeated here.
  */
#railway_dual_gauge_line[zoom>=9],
#railway_multi_gauge_line[zoom>=9] {
  ["railway"="rail"] {
    ["usage"="main"]["service"=null] {
      line-color: @railway_fill_color;
      line-width: 1.5;

      [zoom>=6][zoom<=8] {
        line-width: 2.5;
      }

      [zoom>=9] {
        line-width: 3.5;
      }
    }

    [zoom>=8]["usage"="branch"]["service"=null] {
      line-color: @railway_fill_color;
      line-width: 2.5;

      [zoom>=9] {
        line-width: 3.5;
      }
    }

    [zoom=10]["usage"="industrial"]["service"=null],
    [zoom>=11]["usage"="industrial"] {
      line-color: @railway_fill_color;
      line-width: 2;

      ["service"!=null] {
        line-width: 1.5;
      }
    }

    [zoom>=13]["usage"=null]["service"=null],
    [zoom>=11]["usage"=null]["service"="siding"],
    [zoom>=11]["usage"=null]["service"="crossover"] {
      line-color: @railway_fill_color;
      line-width: 2;
    }

    [zoom>=12]["usage"=null]["service"="yard"],
    [zoom>=11]["usage"=null]["service"="spur"] {
      line-color: @railway_fill_color;
      line-width: 1.5;
    }
  }

  ["railway"="narrow_gauge"] {
    [zoom>=10]["service"=null],
    [zoom>=11]["service"="spur"],
    [zoom>=11]["service"="siding"],
    [zoom>=11]["service"="crossover"],
    [zoom>=12]["service"="yard"] {
      line-width: 3;
      line-color: @railway_fill_color;

      ["usage"="industrial"],
      ["service"="spur"],
      ["service"!=null] {
        line-width: 2;
      }
    }
  }

  [zoom>=9] ["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9] ["railway"="construction"]["construction_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="subway"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="light_rail"]["service"=null],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"="narrow_gauge"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"=null],
  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"],
  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"],
  [zoom>=11]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"] {
    line-color: @railway_fill_color;
    line-width: 3;

    [service!=null] {
      line-width: 1.5;
    }
  }
}

#railway_line_low[zoom<=7]::fill,
#railway_line_med[zoom=8]::fill,
#railway_line_fill[zoom>=9]::fill,
#railway_dual_gauge_line[zoom>=9],
#railway_multi_gauge_line[zoom>=9] {
  ["railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=8]["railway"="rail"]["usage"="branch"]["service"=null],
  [zoom=10]["railway"="rail"]["usage"="industrial"]["service"=null],
  [zoom>=13]["railway"="rail"]["usage"=null]["service"=null],
  [zoom>=11]["railway"="rail"]["usage"="industrial"],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="siding"],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="crossover"],
  [zoom>=12]["railway"="rail"]["usage"=null]["service"="yard"],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="spur"],
  [zoom>=10]["railway"="narrow_gauge"]["service"=null],
  [zoom>=11]["railway"="narrow_gauge"]["service"="spur"],
  [zoom>=11]["railway"="narrow_gauge"]["service"="siding"],
  [zoom>=11]["railway"="narrow_gauge"]["service"="crossover"],
  [zoom>=12]["railway"="narrow_gauge"]["service"="yard"],
  /* service!=null is required to get a smaller Mapnik XML style with the Carto compiler. */
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="subway"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="light_rail"]["service"=null],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"="narrow_gauge"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"=null],
  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"]["service"!=null],
  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"]["service"!=null],
  [zoom>=11]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"]["service"!=null],
  [zoom>=10]["railway"="monorail"]["service"=null],
  [zoom>=13]["railway"="monorail"]["service"!=null],
  [zoom>=11]["railway"="miniature"]["service"=null],
  [zoom>=13]["railway"="miniature"]["service"!=null] {

    /* fill rules for monorail and miniature */
    [zoom>=10]["railway"="monorail"]["service"=null],
    [zoom>=13]["railway"="monorail"]["service"!=null],
    [zoom>=11]["railway"="miniature"]["service"=null],
    [zoom>=13]["railway"="miniature"]["service"!=null] {
      line-width: 3;

      [service!=null] {
        line-width: 1.5;
      }
    }

    #railway_line_fill["railway"="construction"] {
      line-dasharray: @construction-dashes;
    }

    #railway_dual_gauge_line["railway"="construction"] {
      line-dasharray: @dual-construction-dashes;
    }

    #railway_multi_gauge_line["railway"="construction"] {
      line-dasharray: @multi-construction-dashes;
    }

    #railway_dual_gauge_line["railway"!="construction"] {
      line-dasharray: @dual-gauge-dashes;
    }

    #railway_multi_gauge_line["railway"!="construction"] {
      line-dasharray: @multi-gauge-dashes;
    }

    /* color for unknown low numeric gauge values */

    [gaugeint>0][gaugeint<63] {
      line-color: @color_gauge_unknown;
    }

    /* colors for numeric gauge values */

    [gaugeint>=63][gaugeint<88] {
      line-color: @color_gauge_0064;
    }

    [gaugeint>=88][gaugeint<127] {
      line-color: @color_gauge_0089;
    }

    [gaugeint>=127][gaugeint<184] {
      line-color: @color_gauge_0127;
    }

    [gaugeint>=184][gaugeint<190] {
      line-color: @color_gauge_0184;
    }

    [gaugeint>=190][gaugeint<260] {
      line-color: @color_gauge_0190;
    }

    [gaugeint>=260][gaugeint<380] {
      line-color: @color_gauge_0260;
    }

    [gaugeint>=380][gaugeint<500] {
      line-color: @color_gauge_0381;
    }

    [gaugeint>=500][gaugeint<597] {
      line-color: @color_gauge_0500;
    }

    [gaugeint>=597][gaugeint<600] {
      line-color: @color_gauge_0597;
    }

    [gaugeint>=600][gaugeint<609] {
      line-color: @color_gauge_0600;
    }

    [gaugeint>=609][gaugeint<700] {
      line-color: @color_gauge_0610;
    }

    [gaugeint>=700][gaugeint<750] {
      line-color: @color_gauge_0700;
    }

    [gaugeint>=750][gaugeint<760] {
      line-color: @color_gauge_0750;
    }

    [gaugeint>=760][gaugeint<762] {
      line-color: @color_gauge_0760;
    }

    [gaugeint>=762][gaugeint<785] {
      line-color: @color_gauge_0762;
    }

    [gaugeint>=785][gaugeint<800] {
      line-color: @color_gauge_0785;
    }

    [gaugeint>=800][gaugeint<891] {
      line-color: @color_gauge_0800;
    }

    [gaugeint>=891][gaugeint<900] {
      line-color: @color_gauge_0891;
    }

    [gaugeint>=900][gaugeint<914] {
      line-color: @color_gauge_0900;
    }

    [gaugeint>=914][gaugeint<950] {
      line-color: @color_gauge_0914;
    }

    [gaugeint>=950][gaugeint<1000] {
      line-color: @color_gauge_0950;
    }

    [gaugeint>=1000][gaugeint<1009] {
      line-color: @color_gauge_1000;
    }

    [gaugeint>=1009][gaugeint<1050] {
      line-color: @color_gauge_1009;
    }

    [gaugeint>=1050][gaugeint<1066] {
      line-color: @color_gauge_1050;
    }

    [gaugeint>=1066][gaugeint<1100] {
      line-color: @color_gauge_1067;
    }

    [gaugeint>=1100][gaugeint<1200] {
      line-color: @color_gauge_1100;
    }

    [gaugeint>=1200][gaugeint<1372] {
      line-color: @color_gauge_1200;
    }

    [gaugeint>=1372][gaugeint<1422] {
      line-color: @color_gauge_1372;
    }

    [gaugeint>=1422][gaugeint<1432] {
      line-color: @color_gauge_1422;
    }

    [gaugeint>=1432][gaugeint<1435] {
      line-color: @color_gauge_1432;
    }

    [gaugeint>=1435][gaugeint<1440] {
      line-color: @color_gauge_1435;
    }

    [gaugeint>=1440][gaugeint<1445] {
      line-color: @color_gauge_1440;
    }

    [gaugeint>=1445][gaugeint<1450] {
      line-color: @color_gauge_1445;
    }

    [gaugeint>=1450][gaugeint<1458] {
      line-color: @color_gauge_1450;
    }

    [gaugeint>=1458][gaugeint<1495] {
      line-color: @color_gauge_1458;
    }

    [gaugeint>=1495][gaugeint<1520] {
      line-color: @color_gauge_1495;
    }

    [gaugeint>=1520][gaugeint<1522] {
      line-color: @color_gauge_1520;
    }

    [gaugeint>=1522][gaugeint<1524] {
      line-color: @color_gauge_1522;
    }

    [gaugeint>=1524][gaugeint<1581] {
      line-color: @color_gauge_1524;
    }

    [gaugeint>=1581][gaugeint<1588] {
      line-color: @color_gauge_1581;
    }

    [gaugeint>=1588][gaugeint<1600] {
      line-color: @color_gauge_1588;
    }

    [gaugeint>=1600][gaugeint<1668] {
      line-color: @color_gauge_1600;
    }

    [gaugeint>=1668][gaugeint<1672] {
      line-color: @color_gauge_1668;
    }

    [gaugeint>=1672][gaugeint<1700] {
      line-color: @color_gauge_1676;
    }

    [gaugeint>=1700][gaugeint<1800] {
      line-color: @color_gauge_1700;
    }

    [gaugeint>=1800][gaugeint<1880] {
      line-color: @color_gauge_1800;
    }

    [gaugeint>=1880][gaugeint<2000] {
      line-color: @color_gauge_1880;
    }

    [gaugeint>=2000][gaugeint<3000] {
      line-color: @color_gauge_2000;
    }

    /* color for unknown high numeric gauge values */

    [gaugeint>=3000] {
      line-color: @color_gauge_unknown;
    }

    /* miniature tracks with inaccurate gauge value */

    ["railway"="miniature"]["gauge"="narrow"],
    ["railway"="miniature"]["gauge"="broad"],
    ["railway"="miniature"]["gauge"="standard"],
    ["railway"="miniature"]["gauge"="unknown"],
    ["railway"="miniature"]["gauge"=null] {
      line-color: @color_gauge_miniature;
    }

    /* other tracks with inaccurate gauge value */

    ["railway"="narrow_gauge"]["gauge"="narrow"],
    ["railway"="narrow_gauge"]["gauge"="broad"],
    ["railway"="narrow_gauge"]["gauge"="standard"],
    ["railway"="narrow_gauge"]["gauge"="unknown"],
    ["railway"="narrow_gauge"]["gauge"=null],
    ["railway"="rail"]["gauge"="narrow"],
    ["railway"="light_rail"]["gauge"="narrow"],
    ["railway"="subway"]["gauge"="narrow"],
    ["railway"="tram"]["gauge"="narrow"] {
      line-color: @color_gauge_narrow;
    }

    ["railway"="rail"]["gauge"="broad"],
    ["railway"="light_rail"]["gauge"="broad"],
    ["railway"="subway"]["gauge"="broad"],
    ["railway"="tram"]["gauge"="broad"] {
      line-color: @color_gauge_broad;
    }

    ["railway"="rail"]["gauge"="standard"],
    ["railway"="light_rail"]["gauge"="standard"],
    ["railway"="subway"]["gauge"="standard"],
    ["railway"="tram"]["gauge"="standard"] {
      line-color: @color_gauge_standard;
    }

    /* monorails or tracks with monorail gauge value */

    ["railway"="monorail"],
    ["railway"="rail"]["gauge"="monorail"],
    ["railway"="light_rail"]["gauge"="monorail"],
    ["railway"="subway"]["gauge"="monorail"],
    ["railway"="tram"]["gauge"="monorail"] {
      line-color: @color_gauge_monorail;
    }
  }
}

#railway_text_med[zoom=8],
#railway_text_high[zoom>=9] {
  ["railway"="rail"]["usage"="main"]["service"=null],
  ["railway"="rail"]["usage"="branch"]["service"=null],
  [zoom=10]["railway"="rail"]["usage"="industrial"]["service"=null],
  [zoom>=13]["railway"="rail"]["usage"=null]["service"=null],
  [zoom>=11]["railway"="rail"]["usage"="industrial"],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="siding"],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="crossover"],
  [zoom>=12]["railway"="rail"]["usage"=null]["service"="yard"],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="spur"],
  [zoom>=11]["railway"="narrow_gauge"]["service"=null],
  [zoom>=11]["railway"="narrow_gauge"]["service"="spur"],
  [zoom>=11]["railway"="narrow_gauge"]["service"="siding"],
  [zoom>=11]["railway"="narrow_gauge"]["service"="crossover"],
  [zoom>=12]["railway"="narrow_gauge"]["service"="yard"],
  /* service!=null is required to get a smaller Mapnik XML style with the Carto compiler. */
  [zoom>=11]["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=11]["railway"="construction"]["construction_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=12]["railway"="construction"]["construction_railway"="subway"]["service"=null],
  [zoom>=12]["railway"="construction"]["construction_railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"=null],
  [zoom>=12]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"]["service"!=null],
  [zoom>=12]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"]["service"!=null],
  [zoom>=13]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"]["service"!=null],
  [zoom>=12]["railway"="monorail"]["service"=null],
  [zoom>=13]["railway"="monorail"]["service"!=null],
  [zoom>=13]["railway"="miniature"]["service"=null],
  [zoom>=13]["railway"="miniature"]["service"!=null] {
    text-name: [label];
    text-face-name: @bold-fonts;
    text-size: 11;
    text-placement: line;
    text-spacing: 100;
    text-min-distance: 30;
    text-halo-radius: @text-halo-radius;
    text-halo-fill: @text-halo-color;
    ["gauge"=null]["construction_gauge"!=null] {
      text-face-name: @oblique-fonts;
    }
  }
}
