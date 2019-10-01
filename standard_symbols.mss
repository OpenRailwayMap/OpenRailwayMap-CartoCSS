@switch-color: black;
@switch-local-color: yellow;

#railway_symbols {
  [railway = 'switch'][zoom >= 16] {
    marker-type: ellipse;
    marker-width: 8;
    marker-height: 8;
    marker-fill: @switch-color;
    [local_operated = 'yes'] {
      marker-fill: @switch-local-color;
    }
  }

  [railway = 'level_crossing'][zoom >= 14],
  [railway = 'crossing'][zoom >= 14] {
    marker-file: url('symbols/level-crossing.svg');
    marker-width: 12;
    marker-height: 7;
    [railway = 'crossing'] {
      marker-file: url('symbols/crossing.svg');
    }
  }

  [railway = 'tram_stop'][zoom >= 13] {
    marker-file: url('symbols/tram-stop.svg');
    marker-width: 8;
    marker-height: 8;
    marker-fill: @text-tram-stop-color;
  }

  [railway = 'border'][zoom >= 11],
  [railway = 'owner_change'][zoom >= 13] {
    marker-file: url('symbols/border.svg');
    marker-width: 16;
    marker-height: 16;
  }

  [railway = 'phone'][zoom >= 17] {
    marker-file: url('symbols/phone.svg');
    marker-width: 12;
    marker-height: 16;
  }

  [railway = 'radio'][man_made = 'mast'][zoom >= 13],
  [railway = 'radio'][man_made = 'tower'][zoom >= 13] {
    marker-file: url('symbols/radio-mast.svg');
    marker-width: 10;
    marker-height: 15;
  }

  [railway = 'radio'][man_made = 'antenna'][zoom >= 13] {
    marker-file: url('symbols/radio-antenna.svg');
    marker-width: 10;
    marker-height: 10;
  }
}
