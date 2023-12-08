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
@kvb_color: #88cc00;
@tvm_color: #009966;
@ptc_color: #44cc66;
@ctcs_color: #ee0000;
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
    ["train_protection_rendered"="none"] {
      line-color: @no_train_protection_color;
    }
    ["train_protection_rendered"="etcs"] {
      line-color: @etcs_color;
    }
    ["train_protection_rendered"="etcs_construction"] {
      line-color: @etcs_construction_color;
    } 
    ["train_protection_rendered"="ctcs"] {
      line-color: @ctcs_color;
    }
    ["train_protection_rendered"="scmt"] {
      line-color: @scmt_color;
    } 
    ["train_protection_rendered"="pzb"] {
      line-color: @pzb_color;
    }
    ["train_protection_rendered"="lzb"] {
      line-color: @lzb_color;
    }
    ["train_protection_rendered"="atb"] {
      line-color: @atb_color;
    }
    ["train_protection_rendered"="atc"] {
      line-color: @atc_color;
    }
    ["train_protection_rendered"="asfa"] {
      line-color: @asfa_color;
    }
    ["train_protection_rendered"="kvb"] {
      line-color: @kvb_color;
    }
    ["train_protection_rendered"="tvm"] {
      line-color: @tvm_color;
    }
    ["train_protection_rendered"="ptc"] {
      line-color: @ptc_color;
    }
    ["train_protection_rendered"="zsi127"] {
      line-color: @zsi127_color;
    }
    ["railway"="construction"] {
      line-dasharray: @construction_dashes;
    }
  }
}
