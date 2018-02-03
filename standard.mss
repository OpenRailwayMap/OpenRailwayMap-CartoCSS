Map {
  background-color: #ffffff;
}


/**** COLORS ****/

@main_color: #ff8100;
@highspeed_color: #ff0c00;
@branch_color: #daca00;
@no_usage_color: #000000;
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
@proposed_dasharray: 2,8;

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

      ["highspeed"="yes"] {
        line-color: @highspeed_color;
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

    [zoom>=13]["usage"=null]["service"=null] {
      line-color: @no_usage_color;
      line-width: 2;
    }

    [zoom>=11]["usage"=null]["service"="siding"],
    [zoom>=11]["usage"=null]["service"="crossover"] {
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

  ["railway"="disused"] {
    [zoom>=9]["disused_railway"="rail"]["service"=null],
    [zoom>=11]["disused_railway"="subway"]["service"=null],
    [zoom>=11]["disused_railway"="light_rail"]["service"=null],
    [zoom>=12]["disused_railway"="tram"]["service"=null],
    [zoom>=13] {
      line-color: @disused_color;
      line-width: 3;

      ["service"!=null] {
        line-width: 1.5;
      }
    }
  }

  ["railway"="abandoned"] {
    [zoom>=9]["abandoned_railway"="rail"]["service"=null],
    [zoom>=11]["abandoned_railway"="subway"]["service"=null],
    [zoom>=11]["abandoned_railway"="light_rail"]["service"=null],
    [zoom>=12]["abandoned_railway"="tram"]["service"=null],
    [zoom>=13] {
      line-color: @abandoned_color;
      line-width: 3;
      line-dasharray: @abandoned_dasharray;

      ["service"!=null] {
        line-width: 1.5;
      }
    }
  }

  ["railway"="razed"] {
    [zoom>=10]["abandoned_railway"="rail"]["service"=null],
    [zoom>=11]["abandoned_railway"="subway"]["service"=null],
    [zoom>=11]["abandoned_railway"="light_rail"]["service"=null],
    [zoom>=12]["abandoned_railway"="tram"]["service"=null],
    [zoom>=14] {
      line-color: @razed_color;
      line-width: 3;
      line-dasharray: @razed_dasharray;

      ["service"!=null] {
        line-width: 1.5;
      }
    }
  }

  ["railway"="construction"],
  ["railway"="proposed"] {
    [zoom>=9]["construction_railway"="rail"]["usage"="main"]["service"=null],
    [zoom>=9]["proposed_railway"="rail"]["usage"="main"]["service"=null],
    [zoom>=9]["construction_railway"="rail"]["usage"="branch"]["service"=null],
    [zoom>=9]["proposed_railway"="rail"]["usage"="branch"]["service"=null],
    [zoom>=10]["construction_railway"="subway"]["service"=null],
    [zoom>=10]["proposed_railway"="subway"]["service"=null],
    [zoom>=10]["construction_railway"="light_rail"]["service"=null],
    [zoom>=10]["proposed_railway"="light_rail"]["service"=null],
    [zoom>=11]["construction_railway"="tram"]["service"=null],
    [zoom>=11]["proposed_railway"="tram"]["service"=null],
    [zoom>=13] {
      line-width: 2;
      line-color: @no_usage_color;

      ["service"!=null] {
        line-width: 1.5;
      }

      ["railway"="construction"] {
        line-dasharray: @construction_dasharray;
      }

      ["railway"="proposed"] {
        line-dasharray: @proposed_dasharray;
      }

      ["construction_railway"="rail"]["usage"="main"],
      ["proposed_railway"="rail"]["usage"="main"] {
        line-color: @main_color;

        ["highspeed"="yes"] {
          line-color: @highspeed_color;
        }
      }

      ["construction_railway"="rail"]["usage"="branch"],
      ["proposed_railway"="rail"]["usage"="branch"] {
        line-color: @branch_color;
      }

      ["construction_railway"="subway"],
      ["proposed_railway"="subway"] {
        line-color: @subway_color;
      }

      ["construction_railway"="light_rail"],
      ["proposed_railway"="light_rail"] {
        line-color: @light_rail_color;
      }

      ["construction_railway"="tram"],
      ["proposed_railway"="tram"] {
        line-color: @tram_color;
      }
    }
  }


  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"] {
    line-color: @subway_color;
    line-width: 3;

    [service!=null] {
      line-width: 1.5;
    }
  }

  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"] {
    line-color: @light_rail_color;
    line-width: 3;

    [service!=null] {
      line-width: 1.5;
    }
  }

  [zoom>=11]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"] {
    line-color: @tram_color;
    line-width: 3;

    [service!=null] {
      line-width: 1.5;
    }
  }
    
}


