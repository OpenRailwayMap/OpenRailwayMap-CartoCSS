@text-halo-color: white;
@text-halo-radius: 1;

@construction-dashes: 5,5;
@proposed-dashes: 4,8;

@color_no: black;
@color_delectrified: #70584D;
@color_lt750v_dc: #FF79B8;
@color_750v_dc: #F930FF;
@color_gt750v_lt1kv_dc: #D033FF;
@color_1kv_dc: #5C1CCB;
@color_gt1kv_lt1500v_dc: #007ACB;
@color_1500v_dc: #0098CB;
@color_gt1500v_lt3kv_dc: #00B7CB;
@color_3kv_dc: #0000FF;
@color_lt15kv_ac: #97FF2F;
@color_gte15kv_lt25kv_ac: #F1F100;
@color_15kv_1667hz: #00FF00;
@color_15kv_167hz: #00CB66;
@color_gt25kv_ac: #FF9F19;
@color_25kv_50: #FF0000;
@color_25kv_60: #C00000;

/**
  * Railway tracks with electrification under construction or proposed electrification
  * are rendered with a second symbolizer called proposed_construction.
  * It adds dashed lines on top of existing lines (e.g. black for electrified=no).
  *
  * Common rules in common.mss are defined for the ::fill and ::casing symbolizers only.
  * Therefore, the rules from common.mss for ::fill need to be repeated here.
  */
#electrification_future[zoom>=9] {
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

#electrification_future,
#railway_line_fill[zoom>=9]::fill,
#railway_line_low[zoom<=7]::fill,
#railway_line_med[zoom=8]::fill {
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
  [zoom>=13]["railway"="tram"]["service"!=null] {

    ["state"="no"],
    ["state"="proposed"][zoom < 9],
    ["state"="construction"][zoom < 9] {
       line-color: black;
    }
    
    ["state"=null]["railway"="construction"]
    {
    	line-color: darkgrey;
    }

    ["state"="deelectrified"],
    ["state"="abandoned"] {
       line-color: #70584D;
    }

    #electrification_future {
      ["state"="construction"],
      ["railway"="construction"] {
        line-dasharray: @construction-dashes;
      }

      ["state"="proposed"] {
        line-dasharray: @proposed-dashes;
      }
    }

    [frequency=0]["voltage"<750] {
       line-color: #FF79B8;
    }

    [frequency=0]["voltage"=750] {
       line-color: #F930FF;
    }

    [frequency=0][voltage>750][voltage<1000] {
       line-color: #D033FF;
    }

    [frequency=0]["voltage"=1000] {
       line-color: #5C1CCB;
    }

    [frequency=0][voltage>1000][voltage<1500] {
       line-color: #007ACB;
    }

    [frequency=0]["voltage"=1500] {
       line-color: #0098CB;
    }

    [frequency=0][voltage>1500][voltage<3000] {
       line-color: #00B7CB;
    }

    [frequency=0]["voltage"=3000] {
       line-color: #0000FF;
    }

    [frequency=0][voltage>3000] {
       line-color: #1969FF;
    }

    [frequency!=null]["frequency"!=0][voltage<15000] {
       line-color: #97FF2F;
    }

    [frequency!=null][frequency!=0][voltage>=15000][voltage<25000] {
       line-color: #F1F100;
    }

    [frequency=16.67][voltage=15000] {
       line-color: #00FF00;
    }

    [frequency=16.7][voltage=15000] {
       line-color: #00CB66;
    }

    [frequency!=null][frequency!=0][voltage>25000] {
       line-color: #FF9F19;
    }

    [frequency=50]["voltage"=25000] {
       line-color: #FF0000;
    }

    [frequency=60]["voltage"=25000] {
       line-color: #C00000;
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
  [zoom>=13]["railway"="tram"]["service"!=null] {
    text-name: [label];
    text-face-name: @bold-fonts;
    text-size: 11;
    text-placement: line;
    text-spacing: 100;
    text-min-distance: 30;
    text-halo-radius: @text-halo-radius;
    text-halo-fill: @text-halo-color;
    ["state"!="present"] {
      text-face-name: @oblique-fonts;
    }
  }
}
