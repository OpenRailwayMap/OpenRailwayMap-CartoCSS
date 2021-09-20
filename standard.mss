/**** COLORS ****/

@main_color: #ff8100;
@highspeed_color: #ff0c00;
@branch_color: #c4b600;
@narrow_gauge_color: #c0da00;
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

@railway_casing_color: #ffffff;
@bridge_casing_color: #000000;
@tunnel_color: #979797;

@turntable_fill: #ababab;
@turntable_casing: #808080;
@turntable_casing_width: 2;

@railway_casing_add: 2;

/* additional width of the casing of dashed lines */
@railway_tunnel_casing_add: 2;
@bridge_casing_add: 4;

@abandoned_dasharray: 5,5;
@razed_dasharray: 3,7;
@construction_dasharray: 9,9;
@proposed_dasharray: 2,8;

#railway_turntables[zoom>=11] {
  polygon-fill: @turntable_fill;
  [zoom>16] {
    line-color: @turntable_casing;
    line-width: @turntable_casing_width;
  }
}


#railway_bridge::railing[zoom>=9][length_pixels>3] {
  ["railway"="rail"] {
    ["usage"="main"]["service"=null] {
      line-color: @bridge_casing_color;
      line-width: 1.5 + @bridge_casing_add;

      [zoom>=6][zoom<=8] {
        line-width: 2.5 + @bridge_casing_add;
      }

      [zoom>=9] {
        line-width: 3.5 + @bridge_casing_add;
      }
    }

    [zoom>=8]["usage"="branch"]["service"=null] {
      line-color: @bridge_casing_color;
      line-width: 2.5 + @bridge_casing_add;

      [zoom>=9] {
        line-width: 3.5 + @bridge_casing_add;
      }
    }

    [zoom=10]["usage"="industrial"]["service"=null],
    [zoom>=11]["usage"="industrial"] {
      line-color: @bridge_casing_color;
      line-width: 2 + @bridge_casing_add;
      ["service"!=null] {
        line-width: 1.5 + @bridge_casing_add;
      }
    }

    [zoom>=13]["usage"=null]["service"=null] {
      line-color: @bridge_casing_color;
      line-width: 2 + @bridge_casing_add;
    }

    [zoom>=11]["usage"=null]["service"="siding"],
    [zoom>=11]["usage"=null]["service"="crossover"] {
      line-color: @bridge_casing_color;
      line-width: 2 + @bridge_casing_add;
    }

    [zoom>=12]["usage"=null]["service"="yard"] {
      line-color: @bridge_casing_color;
      line-width: 1.5 + @bridge_casing_add;
    }

    [zoom>=11]["usage"=null]["service"="spur"] {
      line-color: @bridge_casing_color;
      line-width: 1.5 + @bridge_casing_add;
    }
  }

  ["railway"="narrow_gauge"] {
    [zoom>=10]["service"=null],
    [zoom>=11]["service"="spur"],
    [zoom>=11]["service"="siding"],
    [zoom>=11]["service"="crossover"],
    [zoom>=12]["service"="yard"] {
      line-width: 3 + @bridge_casing_add;
      line-color: @bridge_casing_color;

      ["usage"="industrial"],
      ["service"!=null] {
        line-width: 2 + @bridge_casing_add;
      }
    }
  }

  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"] {
    line-color: @bridge_casing_color;
    line-width: 3 + @bridge_casing_add;

    [service!=null] {
      line-width: 1.5 + @bridge_casing_add;
    }
  }

  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"] {
    line-color: @bridge_casing_color;
    line-width: 3 + @bridge_casing_add;

    [service!=null] {
      line-width: 1.5 + @bridge_casing_add;
    }
  }

  [zoom>=11]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"] {
    line-color: @bridge_casing_color;
    line-width: 3 + @bridge_casing_add;

    [service!=null] {
      line-width: 1.5 + @bridge_casing_add;
    }
  }
}


#railway_line_casing::casing[zoom>=9],
#railway_line_low::casing[zoom<=7],
#railway_line_med::casing[zoom>7][zoom<9],
#railway_tunnel::casing[zoom>=9],
#railway_bridge::casing[zoom>=9] {
  ["railway"="rail"] {
    ["usage"="main"]["service"=null] {
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

    [zoom>=8]["usage"="branch"]["service"=null] {
      line-color: @railway_casing_color;
      line-width: 2.5 + @railway_casing_add;
      line-join: round;

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

  ["railway"="disused"] {
    [zoom>=9]["disused_railway"="rail"]["service"=null],
    [zoom>=11]["disused_railway"="subway"]["service"=null],
    [zoom>=11]["disused_railway"="light_rail"]["service"=null],
    [zoom>=12]["disused_railway"="tram"]["service"=null],
    [zoom>=13] {
      line-color: @railway_casing_color;
      line-width: 3 + @railway_casing_add;

      ["service"!=null] {
        line-width: 1.5 + @railway_casing_add;
      }
    }
  }

  ["railway"="abandoned"] {
    [zoom>=9]["abandoned_railway"="rail"]["service"=null],
    [zoom>=11]["abandoned_railway"="subway"]["service"=null],
    [zoom>=11]["abandoned_railway"="light_rail"]["service"=null],
    [zoom>=12]["abandoned_railway"="tram"]["service"=null],
    [zoom>=13] {
      line-color: @railway_casing_color;
      line-width: 3 + @railway_casing_add;
      line-dasharray: @abandoned_dasharray;

      ["service"!=null] {
        line-width: 1.5 + @railway_casing_add;
      }
    }
  }

  ["railway"="razed"] {
    [zoom>=10]["razed_railway"="rail"]["service"=null],
    [zoom>=11]["razed_railway"="subway"]["service"=null],
    [zoom>=11]["razed_railway"="light_rail"]["service"=null],
    [zoom>=12]["razed_railway"="tram"]["service"=null],
    [zoom>=14] {
      line-color: @railway_casing_color;
      line-width: 3 + @railway_casing_add;
      line-dasharray: @razed_dasharray;

      ["service"!=null] {
        line-width: 1.5 + @railway_casing_add;
      }
    }
  }

  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9]["railway"="proposed"]["proposed_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=9]["railway"="proposed"]["proposed_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="subway"]["service"=null],
  [zoom>=10]["railway"="proposed"]["proposed_railway"="subway"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="light_rail"]["service"=null],
  [zoom>=10]["railway"="proposed"]["proposed_railway"="light_rail"]["service"=null],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"]["service"=null],
  [zoom>=11]["railway"="proposed"]["proposed_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"=null],
  [zoom>=13]["railway"="proposed"]["proposed_railway"=null] {
    line-color: @no_usage_color;
    line-width: 2;

    ["service"!=null] {
      line-width: 1.5;
    }

    ["railway"="construction"] {
      line-dasharray: @construction_dasharray;
    }

    ["railway"="proposed"] {
      line-dasharray: @proposed_dasharray;
    }

    ["railway"="construction"]["construction_railway"="rail"]["usage"="main"],
    ["railway"="proposed"]["proposed_railway"="rail"]["usage"="main"] {
      line-color: @main_color;

      ["highspeed"="yes"] {
        line-color: @highspeed_color;
      }
    }

    ["railway"="construction"]["construction_railway"="rail"]["usage"="branch"],
    ["railway"="proposed"]["proposed_railway"="rail"]["usage"="branch"] {
      line-color: @branch_color;
    }

    ["railway"="construction"]["construction_railway"="subway"],
    ["railway"="proposed"]["proposed_railway"="subway"] {
      line-color: @subway_color;
    }

    ["railway"="construction"]["construction_railway"="light_rail"],
    ["railway"="proposed"]["proposed_railway"="light_rail"] {
      line-color: @light_rail_color;
    }

    ["railway"="construction"]["construction_railway"="tram"],
    ["railway"="proposed"]["proposed_railway"="tram"] {
      line-color: @tram_color;
    }
  }

  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"] {
    line-color: @railway_casing_color;
    line-width: 3 + @railway_casing_add;
    line-join: round;

    [service!=null] {
      line-width: 1.5 + @railway_casing_add;
    }
  }

  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"] {
    line-color: @railway_casing_color;
    line-width: 3 + @railway_casing_add;
    line-join: round;

    [service!=null] {
      line-width: 1.5 + @railway_casing_add;
    }
  }

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

#railway_line_fill::fill[zoom>=9],
#railway_line_low::fill[zoom<=7],
#railway_line_med::fill[zoom>7][zoom<9],
#railway_tunnel::fill[zoom>=9],
#railway_tunnel::bright[zoom>=9],
#railway_bridge::fill[zoom>=9] {
  ["railway"="rail"] {
    ["usage"="main"]["service"=null] {
      line-color: @main_color;
      line-width: 1.5;
      line-cap: round;
      #railway_tunnel::bright {
        line-width: 1.5 + @railway_tunnel_casing_add;
      }

      [zoom>=6][zoom<=8] {
        line-width: 2.5;
        #railway_tunnel::bright {
          line-width: 2.5 + @railway_tunnel_casing_add;
        }
      }

      [zoom>=9] {
        line-width: 3.5;
        #railway_tunnel::bright {
          line-width: 3.5 + @railway_tunnel_casing_add;
        }
      }

      ["highspeed"="yes"] {
        line-color: @highspeed_color;
      }

      #railway_tunnel::bright {
        line-color: @tunnel_color;
        comp-op: screen;
      }
    }

    [zoom>=8]["usage"="branch"]["service"=null] {
      line-color: @branch_color;
      line-width: 2.5;
      line-cap: round;
      #railway_tunnel::bright {
        line-width: 2.5 + @railway_tunnel_casing_add;
      }

      [zoom>=9] {
        line-width: 3.5;
        #railway_tunnel::bright {
          line-width: 3.5 + @railway_tunnel_casing_add;
        }
      }

      #railway_tunnel::bright {
        line-color: @tunnel_color;
        comp-op: screen;
      }
    }

    [zoom=10]["usage"="industrial"]["service"=null],
    [zoom>=11]["usage"="industrial"] {
      line-color: @industrial_color;
      line-width: 2;
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 2 + @railway_tunnel_casing_add;
      }

      ["service"!=null] {
        line-width: 1.5;
        #railway_tunnel::bright {
          line-width: 1.5 + @railway_tunnel_casing_add;
        }
      }

      #railway_tunnel::bright {
        line-color: @tunnel_color;
        comp-op: screen;
      }
    }

    [zoom>=13]["usage"=null]["service"=null] {
      line-color: @no_usage_color;
      line-width: 2;
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 2 + @railway_tunnel_casing_add;
      }

      #railway_tunnel::bright {
        line-color: @tunnel_color;
        comp-op: screen;
      }
    }

    [zoom>=11]["usage"=null]["service"="siding"],
    [zoom>=11]["usage"=null]["service"="crossover"] {
      line-color: @siding_color;
      line-width: 2;
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 2 + @railway_tunnel_casing_add;
      }

      #railway_tunnel::bright {
        line-color: @tunnel_color;
        comp-op: screen;
      }
    }

    [zoom>=12]["usage"=null]["service"="yard"] {
      line-color: @yard_color;
      line-width: 1.5;
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 1.5 + @railway_tunnel_casing_add;
      }

      #railway_tunnel::bright {
        line-color: @tunnel_color;
        comp-op: screen;
      }
    }

    [zoom>=11]["usage"=null]["service"="spur"] {
      line-color: @spur_color;
      line-width: 1.5;
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 1.5 + @railway_tunnel_casing_add;
      }

      #railway_tunnel::bright {
        line-color: @tunnel_color;
        comp-op: screen;
      }
    }
  }

  ["railway"="narrow_gauge"] {
    [zoom>=10]["service"=null],
    [zoom>=11]["service"="spur"],
    [zoom>=11]["service"="siding"],
    [zoom>=11]["service"="crossover"],
    [zoom>=12]["service"="yard"] {
      line-width: 3;
      line-color: @narrow_gauge_color;
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 3 + @railway_tunnel_casing_add;
      }

      ["usage"="industrial"],
      ["service"="spur"] {
        line-color: @industrial_color;
      }

      ["usage"="industrial"],
      ["service"="spur"],
      ["service"!=null] {
        line-width: 2;

        #railway_tunnel::bright {
          line-width: 2 + @railway_tunnel_casing_add;
        }
      }
    }

    #railway_tunnel::bright {
      line-color: @tunnel_color;
      comp-op: screen;
      line-cap: round;
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
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 3 + @railway_tunnel_casing_add;
      }

      ["service"!=null] {
        line-width: 1.5;

        #railway_tunnel::bright {
          line-width: 1.5 + @railway_tunnel_casing_add;
        }
      }
    }

    #railway_tunnel::bright {
      line-color: @tunnel_color;
      comp-op: screen;
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
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 3 + @railway_tunnel_casing_add;
        line-color: @tunnel_color;
        line-dasharray: @abandoned_dasharray;
        comp-op: screen;
      }

      ["service"!=null] {
        line-width: 1.5;

        #railway_tunnel::bright {
          line-width: 1.5 + @railway_tunnel_casing_add;
        }
      }
    }
  }

  ["railway"="razed"] {
    [zoom>=10]["razed_railway"="rail"]["service"=null],
    [zoom>=11]["razed_railway"="subway"]["service"=null],
    [zoom>=11]["razed_railway"="light_rail"]["service"=null],
    [zoom>=12]["razed_railway"="tram"]["service"=null],
    [zoom>=14] {
      line-color: @razed_color;
      line-width: 3;
      line-dasharray: @razed_dasharray;
      line-cap: round;

      #railway_tunnel::bright {
        line-width: 3 + @railway_tunnel_casing_add;
        line-color: @tunnel_color;
        line-dasharray: @razed_dasharray;
        comp-op: screen;
      }

      ["service"!=null] {
        line-width: 1.5;

        #railway_tunnel::bright {
          line-width: 1.5 + @railway_tunnel_casing_add;
        }
      }
    }
  }

  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9]["railway"="proposed"]["proposed_railway"="rail"]["usage"="main"]["service"=null],
  [zoom>=9]["railway"="construction"]["construction_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=9]["railway"="proposed"]["proposed_railway"="rail"]["usage"="branch"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="subway"]["service"=null],
  [zoom>=10]["railway"="proposed"]["proposed_railway"="subway"]["service"=null],
  [zoom>=10]["railway"="construction"]["construction_railway"="light_rail"]["service"=null],
  [zoom>=10]["railway"="proposed"]["proposed_railway"="light_rail"]["service"=null],
  [zoom>=11]["railway"="construction"]["construction_railway"="tram"]["service"=null],
  [zoom>=11]["railway"="proposed"]["proposed_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="construction"]["construction_railway"=null],
  [zoom>=13]["railway"="proposed"]["proposed_railway"=null] {
    line-color: @no_usage_color;
    line-width: 3;
    line-cap: round;

    #railway_tunnel::bright {
      line-width: 2 + @railway_tunnel_casing_add;
    }

    ["service"!=null] {
      line-width: 1.5;

      #railway_tunnel::bright {
        line-width: 1.5 + @railway_tunnel_casing_add;
      }
    }

    #railway_tunnel::bright["railway"="construction"],
    ["railway"="construction"] {
      line-dasharray: @construction_dasharray;
    }

    ["railway"="proposed"] {
      line-dasharray: @proposed_dasharray;
    }

    ["railway"="construction"]["construction_railway"="rail"]["usage"="main"],
    ["railway"="proposed"]["proposed_railway"="rail"]["usage"="main"] {
      line-color: @main_color;

      ["highspeed"="yes"] {
        line-color: @highspeed_color;
      }
    }

    ["railway"="construction"]["construction_railway"="rail"]["usage"="branch"],
    ["railway"="proposed"]["proposed_railway"="rail"]["usage"="branch"] {
      line-color: @branch_color;
    }

    ["railway"="construction"]["construction_railway"="subway"],
    ["railway"="proposed"]["proposed_railway"="subway"] {
      line-color: @subway_color;
    }

    ["railway"="construction"]["construction_railway"="light_rail"],
    ["railway"="proposed"]["proposed_railway"="light_rail"] {
      line-color: @light_rail_color;
    }

    ["railway"="construction"]["construction_railway"="tram"],
    ["railway"="proposed"]["proposed_railway"="tram"] {
      line-color: @tram_color;
    }

    #railway_tunnel::bright {
      line-cap: round;
      line-color: @tunnel_color;
      comp-op: screen;
    }
  }


  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"] {
    line-color: @subway_color;
    line-width: 3;
    line-cap: round;

    #railway_tunnel::bright {
      line-width: 3 + @railway_tunnel_casing_add;
    }

    [service!=null] {
      line-width: 1.5;

      #railway_tunnel::bright {
        line-width: 1.5 + @railway_tunnel_casing_add;
      }
    }

    #railway_tunnel::bright {
      line-color: @tunnel_color;
      comp-op: screen;
    }
  }

  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"] {
    line-color: @light_rail_color;
    line-width: 3;
    line-cap: round;

    #railway_tunnel::bright {
      line-width: 3 + @railway_tunnel_casing_add;
    }

    [service!=null] {
      line-width: 1.5;

      #railway_tunnel::bright {
        line-width: 1.5 + @railway_tunnel_casing_add;
      }
    }

    #railway_tunnel::bright {
      line-color: @tunnel_color;
      comp-op: screen;
    }
  }

  [zoom>=11]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"] {
    line-color: @tram_color;
    line-width: 3;
    line-cap: round;

    #railway_tunnel::bright {
      line-width: 3 + @railway_tunnel_casing_add;
    }

    [service!=null] {
      line-width: 1.5;

      #railway_tunnel::bright {
        line-width: 1.5 + @railway_tunnel_casing_add;
      }
    }

    #railway_tunnel::bright {
      line-color: @tunnel_color;
      comp-op: screen;
    }
  }
}
