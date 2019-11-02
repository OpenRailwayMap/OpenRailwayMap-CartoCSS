@text-halo-color: white;
@text-halo-radius: 1;

@no_train_protection_color: black;
@pzb_color: #ffb900;
@lzb_color: red;
@atb_color: #ff8c00;
@etcs_color: blue;
@etcs_construction_dashes: 9,9;

#railway_line_fill[zoom>=9]::fill,
#railway_line_low[zoom<=7]::fill,
#railway_line_med[zoom>7][zoom<9]::fill {
  ["pzb"="no"]["lzb"="no"]["etcs"="no"],
  ["atb"="no"]["etcs"="no"] {
    line-color: @no_train_protection_color;
  }
  ["pzb"="yes"] {
    line-color: @pzb_color;
  }
  ["lzb"="yes"] {
    line-color: @lzb_color;
  }
  ["atb"="yes"],
  ["atb_eg"="yes"],
  ["atb_ng"="yes"],
  ["atb_vv"="yes"] {
    line-color: @atb_color;
  }
  ["etcs"!="no"] {
    line-color: @etcs_color;
  }
  ["construction_etcs"!="no"]::fill_etcs {
    line-dasharray: @etcs_construction_dashes;
  }
}
