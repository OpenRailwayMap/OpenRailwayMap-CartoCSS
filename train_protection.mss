@text-halo-color: white;
@text-halo-radius: 1;

@construction_dashes: 9,9;

@no_train_protection_color: black;
@pzb_color: #ffb900;
@lzb_color: red;
@zsi127_color: #884400;
@atb_color: #ff8c00;
@atc_color: #6600cc;
@scmt_color: #dd11ff;
@asfa_color: #ff9092;
@kvb_color: #66cc33;
@tvm_color: #009966;
@ptc_color: #cc0033;
@ctcs_color: orange;
@etcs_color: blue;
@etcs_construction_color: #87CEFA;

/* Casing of railway lines under construction should be dashed as well. */
#railway_line_casing::casing {
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="subway"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="light_rail"]["service"=null],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"="narrow_gauge"],
  [zoom>=13]["railway"="construction"]["construction_railway"=null] {
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
  [zoom>=13]["railway"="construction"]["construction_railway"="narrow_gauge"],
  [zoom>=13]["railway"="construction"]["construction_railway"=null],
  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"],
  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"],
  [zoom>=11]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"] {
    ["rank"=1] {  /* shortcut: SQL functions set rank=1 for 'no protection' */
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
    ["atc"="yes"] {
      line-color: @atc_color;
    }
    ["scmt"="yes"] {
      line-color: @scmt_color;
    }
    ["asfa"="yes"] {
      line-color: @asfa_color;
    }
    ["kvb"="yes"] {
      line-color: @kvb_color;
    }
    ["tvm"="yes"],
    ["tvm"="430"],
    ["tvm"="300"] {
      line-color: @tvm_color;
    }
    ["etcs"!="no"] {
      line-color: @etcs_color;
    }
    ["construction_etcs"!="no"] {
      line-color: @etcs_construction_color;
    }
    ["ptc"!="no"] {
      line-color: @ptc_color;
    }
    ["ctcs"!="no"] {
      line-color: @ctcs_color;
    }
    ["zsi127"="yes"] {
      line-color: @zsi127_color;
    }
    ["railway"="construction"] {
      line-dasharray: @construction_dashes;
    }
  }
}
