@text-color: #585858;
@text-halo-color: white;
@text-halo-radius: 1;
@text-size: 11;

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

#railway_text_stations_med,
#railway_text_stations_high {
  [railway = 'station'][station != 'light_rail'][station != 'subway'][zoom <= 9],
  [railway = 'tram_stop'][zoom >= 14],
  [railway = 'station'][zoom >= 10],
  [railway = 'halt'][zoom >= 10] {
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
    }
    [railway = 'tram_stop'] {
      text-fill: @text-tram-stop-color;
      text-halo-fill: @text-tram-stop-halo-color;
    }
    [railway = 'yard'] {
      text-fill: @text-yard-color;
      text-halo-fill: @text-yard-halo-color;
    }

    text-halo-radius: @text-station-halo-size;
    text-min-distance: 30;
    text-min-padding: 10;
  }
}

#railway_text_detail::track_numbers["track_ref"!=""] {
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

#railway_text_med,
#railway_text_high {
  text-spacing: 200;
}

#railway_text_med,
#railway_text_high,
#railway_text_detail::line_numbers["label"!=""] {
  text-name: '[label]';
  text-face-name: @bold-fonts;
  text-placement: line;
  text-size: @text-size;
  text-fill: @text-color;
  text-halo-radius: @text-halo-radius;
  text-halo-fill: @text-halo-color;
  text-min-distance: 30;
  text-min-padding: 10;
}
