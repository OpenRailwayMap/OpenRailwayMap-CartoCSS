@text-halo-color: white;
@text-halo-radius: 1;

@construction-dashes: 5,5;
@proposed-dashes: 2,8;

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

#railway_line_fill[zoom>=9]::fill,
#railway_line_low[zoom<=7]::fill,
#railway_line_med[zoom>7][zoom<9]::fill {
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
  [zoom>=9]["railway"="disused"]["disused_railway"="rail"]["service"=null],
  [zoom>=11]["railway"="disused"]["disused_railway"="subway"]["service"=null],
  [zoom>=11]["railway"="disused"]["disused_railway"="light_rail"]["service"=null],
  [zoom>=12]["railway"="disused"]["disused_railway"="tram"]["service"=null],
  /* service!=null is required to get a smaller Mapnik XML style with the Carto compiler. */
  [zoom>=13]["railway"="disused"]["service"!=null],
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="subway"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="light_rail"]["service"=null],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="construction"]["service"!=null],
  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"]["service"!=null],
  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"]["service"!=null],
  [zoom>=11]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"]["service"!=null] {
    ["state"="no"] {
       line-color: black;
    }

    ["state"="deelectrified"],
    ["state"="abandoned"] {
       line-color: #70584D;
    }

    ["state"="construction"] {
      line-dasharray: @construction-dashes;
    }

    ["state"="proposed"] {
      line-dasharray: @proposed-dashes;
    }

    ["frequency"=0]["voltage"<750] {
       line-color: #FF79B8;
    }

    ["frequency"=0]["voltage"=750] {
       line-color: #F930FF;
    }

    ["frequency"=0][voltage>750][voltage<1000] {
       line-color: #D033FF;
    }

    ["frequency"=0]["voltage"=1000] {
       line-color: #5C1CCB;
    }

    ["frequency"=0][voltage>1000][voltage<1500] {
       line-color: #007ACB;
    }

    ["frequency"=0]["voltage"=1500] {
       line-color: #0098CB;
    }

    ["frequency"=0][voltage>1500][voltage<3000] {
       line-color: #00B7CB;
    }

    ["frequency"=0]["voltage"=3000] {
       line-color: #0000FF;
    }

    ["frequency"=0][voltage>3000] {
       line-color: #1969FF;
    }

    ["frequency"!=null]["frequency"!=0][voltage<15000] {
       line-color: #97FF2F;
    }

    ["frequency"=null][frequency!=0][voltage>=15000][voltage<25000] {
       line-color: #F1F100;
    }

    [frequency=16.67]["voltage"=15000] {
       line-color: #00FF00;
    }

   [frequency=16.7]["voltage"=15000] {
      line-color: #00CB66;
   }

   ["frequency"=null][frequency!=0][voltage>=25000] {
      line-color: #FF9F19;
   }

   ["frequency"=50]["voltage"=25000] {
      line-color: #FF0000;
   }

   ["frequency"=60]["voltage"=25000] {
      line-color: #C00000;
   }
  /*  [disused!=null],
    [construction!=null]  {
      comp-op: screen;
    }*/
  }
}

#railway_text_med[zoom<=10],
#railway_text_high[zoom>=11] {
  [railway="rail"],
  [railway="construction"][construction_railway="rail"],
  [railway="disused"][disused_railway="rail"],
  [zoom>=11][railway="narrow_gauge"],
  [zoom>=11][railway="construction"][construction_railway="narrow_gauge"],
  [zoom>=11][railway="disused"][disused_railway="narrow_gauge"],
  [zoom>=12][railway="light_rail"],
  [zoom>=12][railway="construction"][construction_railway="light_rail"],
  [zoom>=12][railway="disused"][disused_railway="light_rail"],
  [zoom>=12][railway="subway"],
  [zoom>=12][railway="construction"][construction_railway="subway"],
  [zoom>=12][railway="disused"][disused_railway="subway"],
  [zoom>=13][railway="tram"],
  [zoom>=13][railway="construction"][construction_railway="tram"],
  [zoom>=13][railway="disused"][disused_railway="tram"] {
    text-name: [label];
    text-face-name: @bold-fonts;
    text-size: 11;
    text-placement: line;
    text-spacing: 100;
    text-min-distance: 30;
    text-halo-radius: @text-halo-radius;
    text-halo-fill: @text-halo-color;
  }
}
