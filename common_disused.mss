/** Grey color and line width for disused railway tracks and railway tracks under construction.
  * To be overriden by colouring for speed limits, train protection or electrification.
  */

#railway_line_casing[zoom>=9]::casing,
#railway_line_low[zoom<=7]::casing,
#railway_line_med[zoom>7][zoom<9]::casing {
  [zoom>=9]["railway"="disused"]["disused_railway"="rail"]["service"=null],
  [zoom>=11]["railway"="disused"]["disused_railway"="subway"]["service"=null],
  [zoom>=11]["railway"="disused"]["disused_railway"="light_rail"]["service"=null],
  [zoom>=12]["railway"="disused"]["disused_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="disused"] {
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
  [zoom>=9]["railway"="disused"]["disused_railway"="rail"]["service"=null],
  [zoom>=11]["railway"="disused"]["disused_railway"="subway"]["service"=null],
  [zoom>=11]["railway"="disused"]["disused_railway"="light_rail"]["service"=null],
  [zoom>=12]["railway"="disused"]["disused_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="disused"] {
    line-color: @railway_fill_color;
    line-width: 3;

    [service!=null] {
      line-width: 1.5;
    }
  }
}
