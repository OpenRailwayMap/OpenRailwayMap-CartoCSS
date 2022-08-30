@text-halo-color: white;
@text-halo-radius: 1;

@construction_dashes: 9,9;

@no_train_protection_color: black;
@pzb_color: #ffb900;
@lzb_color: red;
@atb_color: #ff8c00;
@scmt_color: #dd11ff;
@etcs_color: blue;
@etcs_construction_color: #87CEFA;

/* Casing of railway lines under construction should be dahsed as well. */
#railway_line_casing[zoom>=9]["railway"="construction"]::casing {
  ["railway"="construction"] {
    line-dasharray: @construction_dashes;
  }
}

#railway_line_fill[zoom>=9]::fill,
#railway_line_low[zoom<=7]::fill,
#railway_line_med[zoom>7][zoom<9]::fill {
  ["railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=8]["railway"="rail"]["usage"="branch"]["service"=null],
  [zoom=10]["railway"="rail"]["usage"="industrial"]["service"=null],
  [zoom>=11]["railway"="rail"]["usage"="industrial"],
  [zoom>=13]["railway"="rail"]["usage"=null]["service"=null],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="siding"],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="crossover"],
  [zoom>=12]["railway"="rail"]["usage"=null]["service"="yard"],
  [zoom>=11]["railway"="rail"]["usage"=null]["service"="spur"],
  [zoom>=10]["railway"="narrow_gauge"]["service"=null],
  [zoom>=11]["railway"="narrow_gauge"]["service"="spur"],
  [zoom>=11]["railway"="narrow_gauge"]["service"="siding"],
  [zoom>=11]["railway"="narrow_gauge"]["service"="crossover"],
  [zoom>=12]["railway"="narrow_gauge"]["service"="yard"],
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="branch"]["service"=null],
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
    ["pzb"="no"]["lzb"="no"]["etcs"="no"],
    ["atb"="no"]["etcs"="no"] {
      line-color: @no_train_protection_color;
    }
    ["pzb"="yes"] {
      line-color: @pzb_color;
    }
    ["lzb"="yes"] {
      line-color: @lzb_color;
    }
    ["atb"="yes"],
    ["atb_eg"="yes"],
    ["atb_ng"="yes"],
    ["atb_vv"="yes"] {
      line-color: @atb_color;
    }
    ["scmt"="yes"] {
      line-color: @scmt_color;
    }
    ["etcs"!="no"] {
      line-color: @etcs_color;
    }
    ["construction_etcs"!="no"] {
      line-color: @etcs_construction_color;
    }

    ["railway"="construction"] {
      line-dasharray: @construction_dashes;
    }
  }
}
