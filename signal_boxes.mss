@signal_box_color: #008206;
@signal_box_casing_color: white;
@signal_box_text_color: #404040;
@signal_box_halo_color: #bfffb3;
@signal_box_halo_radius: 1.5;
@signal_box_size: 7;
@signal_box_size_z15: 12;
@signal_box_size_z17: 18;

#signal_boxes_polygon[zoom>=13] {
  polygon-fill: @signal_box_color;
  line-color: @signal_box_casing_color;
  line-width: 1;
}

#signal_boxes_point[zoom>=13] {
  /* render a circle, therefore marker-file is not set */
  marker-fill: @signal_box_color;
  marker-line-width: 1;
  marker-line-color: @signal_box_casing_color;
  marker-width: @signal_box_size;
  marker-height: @signal_box_size;
  [zoom>=15] {
    marker-width: @signal_box_size_z15;
    marker-height: @signal_box_size_z15;
  }
  [zoom>=17] {
    marker-width: @signal_box_size_z17;
    marker-height: @signal_box_size_z17;
  }
  marker-allow-overlap: true;
}

#signal_boxes_text[zoom>=13] {
  text-fill: @signal_box_text_color;
  text-name: [name];
  [zoom<=16] {
    text-name: [ref];
  }
  text-face-name: @bold-fonts;
  text-size: 11;
  text-halo-radius: @signal_box_halo_radius;
  text-halo-fill: @signal_box_halo_color;
  ["is_point"=1] {
    text-dy: @signal_box_size;
    [zoom>=15] {
      text-dy: @signal_box_size_z15;
    }
    [zoom>=17] {
      text-dy: @signal_box_size_z17;
    }
  }
}
