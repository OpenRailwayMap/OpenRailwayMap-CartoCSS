Map {
  background-color: #ffffff;
}


/**** COLORS ****/

@main_color: #ff8100;
@branch_color: #daca00;
@disused_color: #70584d;
@abandoned_color: #7f6a62;
@razed_color: #94847e;
@tram_color: #d877b8;
@subway_color: #0300c3;
@light_rail_color: #00bd14;
@siding_color: #000000;
@yard_color: #000000;
@spur_color: #87491d;
@industrial_color: #87491d;

@abandoned_dasharray: 5,5;
@razed_dasharray: 3,7;
@construction_dasharray: 9,9;

#railway_line {
  ["railway"="rail"] {
    ["usage"="main"]["service"=null] {
      line-color: @main_color;
      line-width: 1.5;

      [zoom>=6][zoom<=8] {
        line-width: 2.5;
      }

      [zoom>=9] {
        line-width: 3.5;
      }
    }

    [zoom>=8]["usage"="branch"]["service"=null] {
      line-color: @branch_color;
      line-width: 2.5;

      [zoom>=9] {
        line-width: 3.5;
      }
    }

    [zoom=10]["usage"="industrial"]["service"=null],
    [zoom>=11]["usage"="industrial"] {
      line-color: @industrial_color;
      line-width: 2;
      ["service"!=null] {
        line-width: 1.5;
      }
    }

    [zoom>=11]["usage"=null]["service"="siding"] {
      line-color: @siding_color;
      line-width: 2;
    }

    [zoom>=12]["usage"=null]["service"="yard"] {
      line-color: @yard_color;
      line-width: 1.5;
    }

    [zoom>=11]["usage"=null]["service"="spur"] {
      line-color: @spur_color;
      line-width: 1.5;
    }
  }

  ["railway"="disused"]["service"=null] {
    [zoom>=9]["disused_railway"="rail"],
    [zoom>=10]["disused_railway"="subway"],
    [zoom>=10]["disused_railway"="light_rail"],
    [zoom>=11] {
      line-color: @disused_color;
      line-width: 3;
    }
  }

  ["railway"="abandoned"]["service"=null] {
    [zoom>=9]["abandoned_railway"="rail"],
    [zoom>=10]["abandoned_railway"="subway"],
    [zoom>=10]["abandoned_railway"="light_rail"],
    [zoom>=11] {
      line-color: @abandoned_color;
      line-width: 3;
      line-dasharray: @abandoned_dasharray;
    }
  }

  ["railway"="razed"]["service"=null] {
    [zoom>=10]["abandoned_railway"="rail"],
    [zoom>=10]["abandoned_railway"="subway"],
    [zoom>=10]["abandoned_railway"="light_rail"],
    [zoom>=11] {
      line-color: @razed_color;
      line-width: 3;
      line-dasharray: @razed_dasharray;
    }
  }

  ["railway"="construction"] {
    [zoom>=9]["construction_railway"="rail"]["usage"="main"]["service"=null],
    [zoom>=9]["construction_railway"="rail"]["usage"="branch"]["service"=null] {
      line-color: @main_color;
      line-width: 2;
      line-dasharray: @construction_dasharray;
    }

    [zoom>=10]["construction_railway"="subway"] {
      [zoom<13]["service"=null],
      [zoom>=13] {
        line-color: @subway_color;
        line-width: 2;
        line-dasharray: @construction_dasharray;
      }
    }

    [zoom>=10]["construction_railway"="light_rail"] {
      [zoom<13]["service"=null],
      [zoom>=13] {
        line-color: @light_rail_color;
        line-width: 2;
        line-dasharray: @construction_dasharray;
      }
    }

    [zoom>=11]["construction_railway"="tram"] {
      [zoom<13]["service"=null],
      [zoom>=13] {
        line-color: @tram_color;
        line-width: 2;
        line-dasharray: @construction_dasharray;
      }
    }
  }

  [zoom>=10]["railway"="subway"]["service"=null] {
    line-color: @subway_color;
    line-width: 3;
  }

  [zoom>=10]["railway"="light_rail"]["service"=null] {
    line-color: @light_rail_color;
    line-width: 3;
  }

  [zoom>=11]["railway"="tram"]["service"=null] {
    line-color: @tram_color;
    line-width: 3;
  }
    
}


