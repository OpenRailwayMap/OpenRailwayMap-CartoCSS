@text-halo-color: white;
@text-halo-radius: 1;

@construction-dashes: 5,5;
@proposed-dashes: 4,8;

@dual-gauge-dashes: 8,8;
@multi-gauge-dashes: 4,12;

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
  [zoom>=13]["railway"="construction"],
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
  [zoom>=13]["railway"="construction"],
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

    /* default color for unknown gauge value */
    line-color: @color_gauge_unknown;

    #railway_dual_gauge_line {
      line-dasharray: @dual-gauge-dashes;
    }
    
    #railway_multi_gauge_line {
      line-dasharray: @multi-gauge-dashes;
    }
    
    /* tracks with numeric gauge value */

    [gauge=380],
    [gauge>380][gauge<500] {
      line-color: @color_gauge_0381;
    }

    [gauge=500],
    [gauge>500][gauge<597] {
      line-color: @color_gauge_0500;
    }

    [gauge=597],
    [gauge>597][gauge<600] {
      line-color: @color_gauge_0597;
    }

    [gauge=600],
    [gauge>600][gauge<609] {
      line-color: @color_gauge_0600;
    }

    [gauge=609],
    [gauge>609][gauge<700] {
      line-color: @color_gauge_0610;
    }

    [gauge=700],
    [gauge>700][gauge<750] {
      line-color: @color_gauge_0700;
    }

    [gauge=750],
    [gauge>750][gauge<760] {
      line-color: @color_gauge_0750;
    }

    [gauge=760],
    [gauge>760][gauge<762] {
      line-color: @color_gauge_0760;
    }

    [gauge=762],
    [gauge>762][gauge<785] {
      line-color: @color_gauge_0762;
    }

    [gauge=785],
    [gauge>785][gauge<800] {
      line-color: @color_gauge_0785;
    }
    
    [gauge=800],
    [gauge>800][gauge<891] {
      line-color: @color_gauge_0800;
    }
    
    [gauge=891],
    [gauge>891][gauge<900] {
      line-color: @color_gauge_0891;
    }

    [gauge=900],
    [gauge>900][gauge<914] {
      line-color: @color_gauge_0900;
    }

    [gauge=914],
    [gauge>914][gauge<950] {
      line-color: @color_gauge_0914;
    }

    [gauge=950],
    [gauge>950][gauge<1000] {
      line-color: @color_gauge_0950;
    }

    [gauge=1000],
    [gauge>1000][gauge<1009] {
      line-color: @color_gauge_1000;
    }

    [gauge=1009],
    [gauge>1009][gauge<1050] {
      line-color: @color_gauge_1009;
    }

    [gauge=1050],
    [gauge>1050][gauge<1066] {
      line-color: @color_gauge_1050;
    }

    [gauge=1066],
    [gauge>1066][gauge<1100] {
      line-color: @color_gauge_1067;
    }

    [gauge=1100],
    [gauge>1100][gauge<1200] {
      line-color: @color_gauge_1100;
    }

    [gauge=1200],
    [gauge>1200][gauge<1372] {
      line-color: @color_gauge_1200;
    }

    [gauge=1372],
    [gauge>1372][gauge<1422] {
      line-color: @color_gauge_1372;
    }

    [gauge=1422],
    [gauge>1422][gauge<1432] {
      line-color: @color_gauge_1422;
    }

    [gauge=1432],
    [gauge>1432][gauge<1435] {
      line-color: @color_gauge_1432;
    }

    [gauge=1435],
    [gauge>1435][gauge<1440] {
      line-color: @color_gauge_1435;
    }

    [gauge=1440],
    [gauge>1440][gauge<1445] {
      line-color: @color_gauge_1440;
    }

    [gauge=1445],
    [gauge>1445][gauge<1450] {
      line-color: @color_gauge_1445;
    }

    [gauge=1450],
    [gauge>1450][gauge<1458] {
      line-color: @color_gauge_1450;
    }

    [gauge=1458],
    [gauge>1458][gauge<1495] {
      line-color: @color_gauge_1458;
    }

    [gauge=1495],
    [gauge>1495][gauge<1520] {
      line-color: @color_gauge_1495;
    }

    [gauge=1520],
    [gauge>1520][gauge<1522] {
      line-color: @color_gauge_1520;
    }

    [gauge=1522],
    [gauge>1522][gauge<1524] {
      line-color: @color_gauge_1522;
    }

    [gauge=1524],
    [gauge>1524][gauge<1581] {
      line-color: @color_gauge_1524;
    }

    [gauge=1581],
    [gauge>1581][gauge<1588] {
      line-color: @color_gauge_1581;
    }

    [gauge=1588],
    [gauge>1588][gauge<1600] {
      line-color: @color_gauge_1588;
    }

    [gauge=1600],
    [gauge>1600][gauge<1668] {
      line-color: @color_gauge_1600;
    }

    [gauge=1668],
    [gauge>1668][gauge<1676] {
      line-color: @color_gauge_1668;
    }

    [gauge=1676],
    [gauge>1676][gauge<1700] {
      line-color: @color_gauge_1676;
    }

    [gauge=1700],
    [gauge>1700][gauge<1800] {
      line-color: @color_gauge_1700;
    }

    [gauge=1800],
    [gauge>1800][gauge<1880] {
      line-color: @color_gauge_1800;
    }

    [gauge=1880],
    [gauge>1880][gauge<2000] {
      line-color: @color_gauge_1880;
    }

    [gauge=2000],
    [gauge>2000][gauge<3000] {
      line-color: @color_gauge_2000;
    }

    /* miniature tracks */

    [gauge=63],
    [gauge>63][gauge<88] {
      line-color: @color_gauge_0064;
    }

    [gauge=88],
    [gauge>88][gauge<127] {
      line-color: @color_gauge_0089;
    }
    
    [gauge=127],
    [gauge>127][gauge<184] {
      line-color: @color_gauge_0127;
    }

    [gauge=184],
    [gauge>184][gauge<190] {
      line-color: @color_gauge_0184;
    }

    [gauge=190],
    [gauge>190][gauge<260] {
      line-color: @color_gauge_0190;
    }

    [gauge=260],
    [gauge>260][gauge<380] {
      line-color: @color_gauge_0260;
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
  [zoom>=13]["railway"="construction"],
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
    ["gauge"!=null] {
      text-name: [gauge];
    }
    ["gauge"=null] {
      text-name: [railway];
    }
    text-face-name: @bold-fonts;
    text-size: 11;
    text-placement: line;
    text-spacing: 100;
    text-min-distance: 30;
    text-halo-radius: @text-halo-radius;
    text-halo-fill: @text-halo-color;
  }
}
