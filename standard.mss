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

@abandoned_dasharray: 5,5;
@razed_dasharray: 3,7;

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


