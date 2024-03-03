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

    [gaugeint>0][gaugeint<63] { line-color: @color_gauge_unknown; }
    /* colors for numeric gauge values */

    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 88, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 63]], color_gauge_0064,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 127, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 88]], color_gauge_0089,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 184, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 127]], color_gauge_0127,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 190, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 184]], color_gauge_0184,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 260, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 190]], color_gauge_0190,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 380, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 260]], color_gauge_0260,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 500, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 380]], color_gauge_0381,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 597, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 500]], color_gauge_0500,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 600, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 597]], color_gauge_0597,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 609, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 600]], color_gauge_0600,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 700, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 609]], color_gauge_0610,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 750, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 700]], color_gauge_0700,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 760, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 750]], color_gauge_0750,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 762, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 760]], color_gauge_0760,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 785, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 762]], color_gauge_0762,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 800, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 785]], color_gauge_0785,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 891, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 800]], color_gauge_0800,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 900, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 891]], color_gauge_0891,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 914, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 900]], color_gauge_0900,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 950, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 914]], color_gauge_0914,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1000, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 950]], color_gauge_0950,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1009, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1000]], color_gauge_1000,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1050, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1009]], color_gauge_1009,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1066, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1050]], color_gauge_1050,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1100, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1066]], color_gauge_1067,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1200, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1100]], color_gauge_1100,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1372, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1200]], color_gauge_1200,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1422, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1372]], color_gauge_1372,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1432, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1422]], color_gauge_1422,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1435, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1432]], color_gauge_1432,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1440, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1435]], color_gauge_1435,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1445, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1440]], color_gauge_1440,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1450, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1445]], color_gauge_1445,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1458, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1450]], color_gauge_1450,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1495, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1458]], color_gauge_1458,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1520, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1495]], color_gauge_1495,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1522, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1520]], color_gauge_1520,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1524, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1522]], color_gauge_1522,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1581, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1524]], color_gauge_1524,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1588, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1581]], color_gauge_1581,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1600, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1588]], color_gauge_1588,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1668, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1600]], color_gauge_1600,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1672, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1668]], color_gauge_1668,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1700, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1672]], color_gauge_1676,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1800, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1700]], color_gauge_1700,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 1880, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1800]], color_gauge_1800,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 2000, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 1880]], color_gauge_1880,
    ['all', ['!=', ['get', 'gaugeint'], null], ['>', 3000, ['get', 'gaugeint']], ['>=', ['get', 'gaugeint'], 2000]], color_gauge_2000,
    /* color for unknown high numeric gauge values */

    [gaugeint>=3000] { line-color: @color_gauge_unknown; }
    /* miniature tracks with inaccurate gauge value */

    ["railway"="miniature"]["gauge"="narrow"],
    ["railway"="miniature"]["gauge"="broad"],
    ["railway"="miniature"]["gauge"="standard"],
    ["railway"="miniature"]["gauge"="unknown"],
    ["railway"="miniature"]["gauge"=null] { line-color: @color_gauge_miniature; }
    /* other tracks with inaccurate gauge value */

    ["railway"="narrow_gauge"]["gauge"="narrow"],
    ["railway"="narrow_gauge"]["gauge"="broad"],
    ["railway"="narrow_gauge"]["gauge"="standard"],
    ["railway"="narrow_gauge"]["gauge"="unknown"],
    ["railway"="narrow_gauge"]["gauge"=null],
    ["railway"="rail"]["gauge"="narrow"],
    ["railway"="light_rail"]["gauge"="narrow"],
    ["railway"="subway"]["gauge"="narrow"],
    ["railway"="tram"]["gauge"="narrow"] { line-color: @color_gauge_narrow; }
    ["railway"="rail"]["gauge"="broad"],
    ["railway"="light_rail"]["gauge"="broad"],
    ["railway"="subway"]["gauge"="broad"],
    ["railway"="tram"]["gauge"="broad"] { line-color: @color_gauge_broad; }
    ["railway"="rail"]["gauge"="standard"],
    ["railway"="light_rail"]["gauge"="standard"],
    ["railway"="subway"]["gauge"="standard"],
    ["railway"="tram"]["gauge"="standard"] { line-color: @color_gauge_standard; }
    /* monorails or tracks with monorail gauge value */

    ["railway"="monorail"],
    ["railway"="rail"]["gauge"="monorail"],
    ["railway"="light_rail"]["gauge"="monorail"],
    ["railway"="subway"]["gauge"="monorail"],
    ["railway"="tram"]["gauge"="monorail"] { line-color: @color_gauge_monorail; }  }
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
