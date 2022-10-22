/** Grey color and line width for railway tracks in use.
  * To be overriden by colouring for speed limits, train protection or electrification.
  */
@railway_fill_color: grey;
@railway_casing_color: white;

@railway_casing_add: 2;

#railway_line_casing[zoom>=9]::casing,
#railway_line_low[zoom<=7]::casing,
#railway_line_med[zoom>7][zoom<9]::casing {
  ["railway"="rail"] {
    ["usage"="main"]["service"=null],
    [zoom>=8]["usage"="branch"]["service"=null] {
      line-color: @railway_casing_color;
      line-width: 1.5 + @railway_casing_add;
      line-join: round;

      [zoom>=6][zoom<=8] {
        line-width: 2.5 + @railway_casing_add;
      }

      [zoom>=9] {
        line-width: 3.5 + @railway_casing_add;
      }
    }

    [zoom=10]["usage"="industrial"]["service"=null],
    [zoom>=11]["usage"="industrial"] {
      line-color: @railway_casing_color;
      line-width: 2 + @railway_casing_add;
      line-join: round;

      ["service"!=null] {
        line-width: 1.5 + @railway_casing_add;
      }
    }

    [zoom>=13]["usage"=null]["service"=null] {
      line-color: @railway_casing_color;
      line-width: 2 + @railway_casing_add;
      line-join: round;
    }

    [zoom>=11]["usage"=null]["service"="siding"],
    [zoom>=11]["usage"=null]["service"="crossover"] {
      line-color: @railway_casing_color;
      line-width: 2 + @railway_casing_add;
      line-join: round;
    }

    [zoom>=12]["usage"=null]["service"="yard"] {
      line-color: @railway_casing_color;
      line-width: 1.5 + @railway_casing_add;
      line-join: round;
    }

    [zoom>=11]["usage"=null]["service"="spur"] {
      line-color: @railway_casing_color;
      line-width: 1.5 + @railway_casing_add;
      line-join: round;
    }
  }

  ["railway"="narrow_gauge"] {
    [zoom>=10]["service"=null],
    [zoom>=11]["service"="spur"],
    [zoom>=11]["service"="siding"],
    [zoom>=11]["service"="crossover"],
    [zoom>=12]["service"="yard"] {
      line-width: 3 + @railway_casing_add;
      line-color: @railway_casing_color;
      line-join: round;

      ["usage"="industrial"],
      ["service"!=null] {
        line-width: 2 + @railway_casing_add;
      }
    }
  }

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
    line-color: @railway_casing_color;
    line-width: 3 + @railway_casing_add;
    line-join: round;

    [service!=null] {
      line-width: 1.5 + @railway_casing_add;
    }
  }
}


#railway_line_fill[zoom>=9]::fill,
#railway_line_low[zoom<=7]::fill,
#railway_line_med[zoom>7][zoom<9]::fill {
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
