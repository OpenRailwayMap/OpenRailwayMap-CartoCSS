@text-color: #585858;
@text-halo-color: white;
@text-halo-radius: 1;
@text-size: 11;

@text-km-color: #000000;

@text-station-size: 12;
@text-station-halo-size: 1.5;
@text-station-color: blue;
@text-station-halo-color: white;
@text-yard-color: #87491D;
@text-yard-halo-color: #F1F1F1;
@text-minor-site-color: #616161;
@text-minor-site-halo-color: @text-yard-halo-color;
@text-tram-stop-color: #D877B8;
@text-tram-stop-halo-color: white;

@track-ref-halo-size: 4;
@track-ref-halo-color: blue;
@track-ref-color: white;
@track-ref-size: 10;

@switch-halo-radius: 2;
@local-operated-halo-fill: yellow;

#railway_text_km_med[zoom>=11][zoom<=13],
#railway_text_km_high[zoom>=14] {
  text-name: '[pos]';
  text-face-name: @bold-fonts;
  text-size: @text-size;
  text-halo-radius: @text-halo-radius;
  text-halo-fill: @text-halo-color;
  text-fill: @text-km-color;
  [zoom <= 15] {
    text-min-distance: 30;
  }
}


#railway_text_stations_med[zoom>=6][zoom<=10],
#railway_text_stations_high[zoom>=11] {
  [railway = 'station'][station != 'light_rail'][station != 'subway'][station != 'funicular'][station != 'monorail'][zoom <= 9],
  [railway = 'tram_stop'][zoom >= 14],
  [railway = 'station'][station != 'funicular'][station != 'monorail'][zoom >= 10],
  [railway = 'halt'][station != 'funicular'][station != 'monorail'][zoom >= 10],
  [railway != 'tram_stop'][station != 'funicular'][station != 'monorail'][zoom >= 11] {
    text-name: '[label]';
    text-face-name: @bold-fonts;
    text-size: @text-station-size;
    text-wrap-width: 50;

    text-fill: @text-minor-site-color;
    text-halo-fill: @text-minor-site-halo-color;
    [railway = 'station'],
    [railway = 'halt'] {
      text-fill: @text-station-color;
      text-halo-fill: @text-station-halo-color;
      [station = 'light_rail'],
      [station = 'subway'] {
        text-face-name: @oblique-fonts;
      }
    }
    [railway = 'tram_stop'] {
      text-fill: @text-tram-stop-color;
      text-halo-fill: @text-tram-stop-halo-color;
      text-dy: 9;
    }
    [railway = 'yard'] {
      text-fill: @text-yard-color;
      text-halo-fill: @text-yard-halo-color;
    }

    text-halo-radius: @text-station-halo-size;
    text-min-padding: 10;
    text-min-distance: 30;
    [zoom < 8] {
      text-min-distance: 60;
    }
  }
}

#railway_text_detail::track_numbers[zoom>=17]["track_ref"!=""] {
  text-name: '[track_ref]';
  text-face-name: @bold-fonts;
  text-placement: line;
  text-size: @track-ref-size;
  text-fill: @track-ref-color;
  text-halo-radius: @track-ref-halo-size;
  text-halo-fill: @track-ref-halo-color;
  text-min-distance: 30;
  text-spacing: 200;
  text-min-padding: 10;
} 

#railway_text_med[zoom>=8][zoom<=14],
#railway_text_high[zoom>=15][zoom<=16],
#railway_text_detail::line_numbers[zoom>=17]["label"!=""] {
  ["railway"="rail"]["usage"="main"]["service"=null],
  ["railway"="rail"]["usage"="branch"]["service"=null],
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
  [zoom>=9]["railway"="disused"]["disused_railway"="rail"]["service"=null],
  [zoom>=11]["railway"="disused"]["disused_railway"="subway"]["service"=null],
  [zoom>=11]["railway"="disused"]["disused_railway"="light_rail"]["service"=null],
  [zoom>=12]["railway"="disused"]["disused_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="disused"],
  [zoom>=9]["railway"="abandoned"]["abandoned_railway"="rail"]["service"=null],
  [zoom>=11]["railway"="abandoned"]["abandoned_railway"="subway"]["service"=null],
  [zoom>=11]["railway"="abandoned"]["abandoned_railway"="light_rail"]["service"=null],
  [zoom>=12]["railway"="abandoned"]["abandoned_railway"="tram"]["service"=null],
  [zoom>=13]["railway"="abandoned"],
  [zoom>=10]["railway"="razed"]["razed_railway"="rail"]["service"=null],
  [zoom>=11]["railway"="razed"]["razed_railway"="subway"]["service"=null],
  [zoom>=11]["railway"="razed"]["razed_railway"="light_rail"]["service"=null],
  [zoom>=12]["railway"="razed"]["razed_railway"="tram"]["service"=null],
  [zoom>=14]["railway"="razed"],
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
  [zoom>=13]["railway"="construction"],
  [zoom>=13]["railway"="proposed"],
  [zoom>=10]["railway"="subway"]["service"=null],
  [zoom>=13]["railway"="subway"],
  [zoom>=10]["railway"="light_rail"]["service"=null],
  [zoom>=13]["railway"="light_rail"],
  [zoom>=11]["railway"="tram"]["service"=null],
  [zoom>=13]["railway"="tram"] {
    text-name: '[label]';
    text-face-name: @bold-fonts;
    text-placement: line;
    text-size: @text-size;
    text-fill: @text-color;
    text-halo-radius: @text-halo-radius;
    text-halo-fill: @text-halo-color;
    text-min-distance: 30;
    text-min-padding: 10;

    #railway_text_med,
    #railway_text_high {
      text-spacing: 200;
    }
  }
}

#railway_switch_ref[zoom>=16] {
  text-name: [ref];
  text-face-name: @book-fonts;
  text-size: @text-size;
  text-fill: black;
  text-halo-radius: @switch-halo-radius;
  text-halo-fill: @text-halo-color;
  text-min-distance: 20;
  ["railway_local_operated"="yes"] {
    text-halo-fill: @local-operated-halo-fill;
  }
}
