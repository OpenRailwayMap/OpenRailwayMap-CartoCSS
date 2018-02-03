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

/******************************/
/* railway lines with service but without usage */
/***********************************************/
#railway_line {
  ["railway"="rail"]["service"=null] {
    ["usage"="main"] {
      line-color: @main_color;
      [zoom>=2] {
        line-width: 1.5;
      }
      /* thicker lines in higher zoom levels */
      [zoom>=6][zoom<=8] {
        line-width: 2.5;
      }
      [zoom>=9] {
        line-width: 3.5;
      }
    }

    [zoom>=8]["usage"="branch"] {
      line-color: @branch_color;
      [zoom=8] {
        line-width: 2.5;
      }
      [zoom>=9] {
        line-width: 3.5;
      }
    }
  }
}

/*************/
/* disused, abanoned and razed railway lines */
/************/
/* TODO filter out trams, light rails, subways etc. */
/* TODO filter out industrial, military and test */
/* TODO use other colors, not just brigher opacities */
#railway_line {
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


