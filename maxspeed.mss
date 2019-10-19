@maxspeed_fill_color_10: #0100CB;
@maxspeed_fill_color_20: #001ECB;
@maxspeed_fill_color_30: #003DCB;
@maxspeed_fill_color_40: #005BCB;
@maxspeed_fill_color_50: #007ACB;
@maxspeed_fill_color_60: #0098CB;
@maxspeed_fill_color_70: #00B7CB;
@maxspeed_fill_color_80: #00CBC1;
@maxspeed_fill_color_90: #00CBA2;
@maxspeed_fill_color_100: #00CB84;
@maxspeed_fill_color_110: #00CB66;
@maxspeed_fill_color_120: #00CB47;
@maxspeed_fill_color_130: #00CB29;
@maxspeed_fill_color_140: #00CB0A;
@maxspeed_fill_color_150: #14CB00;
@maxspeed_fill_color_160: #33CB00;
@maxspeed_fill_color_170: #51CB00;
@maxspeed_fill_color_180: #70CB00;
@maxspeed_fill_color_190: #8ECB00;
@maxspeed_fill_color_200: #ADCB00;
@maxspeed_fill_color_210: #CBCB00;
@maxspeed_fill_color_220: #CBAD00;
@maxspeed_fill_color_230: #CB8E00;
@maxspeed_fill_color_240: #CB7000;
@maxspeed_fill_color_250: #CB5100;
@maxspeed_fill_color_260: #CB3300;
@maxspeed_fill_color_270: #CB1400;
@maxspeed_fill_color_280: #CB0007;
@maxspeed_fill_color_290: #CB0025;
@maxspeed_fill_color_300: #CB0044;
@maxspeed_fill_color_320: #CB0062;
@maxspeed_fill_color_340: #CB0081;
@maxspeed_fill_color_360: #CB009F;
@maxspeed_fill_color_380: #CB00BD;

#railway_line_fill::fill,
#railway_line_low::fill,
#railway_line_med::fill {
  [maxspeed>360] { 
    line-color: @maxspeed_fill_color_380;
  }
  [maxspeed<=360] { 
    line-color: @maxspeed_fill_color_360;
  }
  [maxspeed<=340] { 
    line-color: @maxspeed_fill_color_340;
  }
  [maxspeed<=320] { 
    line-color: @maxspeed_fill_color_320;
  }
  [maxspeed<=300] { 
    line-color: @maxspeed_fill_color_300;
  }
  [maxspeed<=290] { 
    line-color: @maxspeed_fill_color_290;
  }
  [maxspeed<=280] { 
    line-color: @maxspeed_fill_color_280;
  }
  [maxspeed<=270] { 
    line-color: @maxspeed_fill_color_270;
  }
  [maxspeed<=260] { 
    line-color: @maxspeed_fill_color_260;
  }
  [maxspeed<=250] { 
    line-color: @maxspeed_fill_color_250;
  }
  [maxspeed<=240] { 
    line-color: @maxspeed_fill_color_240;
  }
  [maxspeed<=230] { 
    line-color: @maxspeed_fill_color_230;
  }
  [maxspeed<=220] { 
    line-color: @maxspeed_fill_color_220;
  }
  [maxspeed<=210] { 
    line-color: @maxspeed_fill_color_210;
  }
  [maxspeed<=200] { 
    line-color: @maxspeed_fill_color_200;
  }
  [maxspeed<=190] { 
    line-color: @maxspeed_fill_color_190;
  }
  [maxspeed<=180] { 
    line-color: @maxspeed_fill_color_180;
  }
  [maxspeed<=170] { 
    line-color: @maxspeed_fill_color_170;
  }
  [maxspeed<=160] { 
    line-color: @maxspeed_fill_color_160;
  }
  [maxspeed<=150] { 
    line-color: @maxspeed_fill_color_150;
  }
  [maxspeed<=140] { 
    line-color: @maxspeed_fill_color_140;
  }
  [maxspeed<=130] { 
    line-color: @maxspeed_fill_color_130;
  }
  [maxspeed<=120] { 
    line-color: @maxspeed_fill_color_120;
  }
  [maxspeed<=110] { 
    line-color: @maxspeed_fill_color_110;
  }
  [maxspeed<=100] { 
    line-color: @maxspeed_fill_color_100;
  }
  [maxspeed<=90] { 
    line-color: @maxspeed_fill_color_90;
  }
  [maxspeed<=80] { 
    line-color: @maxspeed_fill_color_80;
  }
  [maxspeed<=70] { 
    line-color: @maxspeed_fill_color_70;
  }
  [maxspeed<=60] { 
    line-color: @maxspeed_fill_color_60;
  }
  [maxspeed<=50] { 
    line-color: @maxspeed_fill_color_50;
  }
  [maxspeed<=40] { 
    line-color: @maxspeed_fill_color_40;
  }
  [maxspeed<=30] { 
    line-color: @maxspeed_fill_color_30;
  }
  [maxspeed<=20] { 
    line-color: @maxspeed_fill_color_20;
  }
  [maxspeed<=10] { 
    line-color: @maxspeed_fill_color_10;
  }
/*  [disused!=null],
  [construction!=null]  {
    comp-op: screen;
  }*/
}
