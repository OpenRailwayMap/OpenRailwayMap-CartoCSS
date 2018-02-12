@text-color: #585858;
@text-halo-color: white;
@text-halo-radius: 1;
@text-size: 11;

@track-ref-halo-size: 4;
@track-ref-halo-color: blue;
@track-ref-color: white;
@track-ref-size: 10;

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
