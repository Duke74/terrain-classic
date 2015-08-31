@text_font_transport: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_administrative: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_city: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_parks: 'PT Sans Narrow Regular', 'Unifont Medium';
@text_font_water: 'PT Sans Narrow Regular', 'Unifont Medium';

@label_color_transport: #524c4c;
@label_color_administrative: #2e2115;
@label_color_city: #2e2115;

@text_font_size_xxsm: 12;
@text_font_size_xsm: 14;
@text_font_size_sm: 15;
@text_font_size_medium: 17;
@text_font_size_medium_plus: 18;
@text_font_size_large: 20;

@text_font_halo_radius_sm: 1;
@text_font_halo_radius_large: 2;
@label_color_green_area: #374c30;
@label_color_green_area_halo: #c0d3b5;
@label_color_water: darken(@color_water,20);
@label_color_water_halo: @color_water;

Map {
  font-directory: url("fonts/");
  buffer-size: 128;
}

#minor_road_labels,
#major_road_labels,
{
  text-name: [name];
  text-face-name: @text_font_transport;
  text-size: 16;
  text-placement: line;
  text-max-char-angle-delta: 20;
  text-fill: #444;
  text-spacing: 256;
  text-avoid-edges: true;
}

#water-bodies-labels-low,
#water-bodies-labels-med,
#water-bodies-labels-high {
  [zoom=9][area>100000000],
  [zoom=10][area>100000000],
  [zoom=11][area>25000000],
  [zoom=12][area>5000000],
  [zoom=13][area>2000000],
  [zoom=14][area>200000],
  [zoom=15][area>50000],
  [zoom=16][area>10000],
  [zoom>=17] {
    text-name: "[name]";
    text-face-name: @text_font_water;
    text-placement: interior;
    text-max-char-angle-delta: 30;
    text-wrap-width: 40;
    text-halo-radius: @text_font_halo_radius_large;
    text-fill: @label_color_water;
    text-halo-fill: @label_color_water_halo;
    text-size: @text_font_size_xsm;

    [zoom>9][zoom<12] {
      text-spacing: 200;
      text-wrap-width: 50;
    }
    [zoom=12] {
      text-size: @text_font_size_xsm;
      text-spacing: 200;
      text-wrap-width: 70;
    }
    [zoom=13] {
      text-size: @text_font_size_xsm;
      text-spacing: 100;
      text-wrap-width: 70;
    }
    [zoom=14] {
      text-size: @text_font_size_xsm;
      text-spacing: 100;
      text-wrap-width: 70;
    }
    [zoom>=15] {
      text-size: @text_font_size_sm;
      text-spacing: 100;
      text-wrap-width: 40;
    }
  }
}

#green-areas-labels-low,
#green-areas-labels-med,
#green-areas-labels-high {
  [zoom=8][area>100000000],
  [zoom=9][area>100000000],
  [zoom=10][area>100000000],
  [zoom=11][area>5000000],
  [zoom=12][area>1000000],
  [zoom=13][area>400000],
  [zoom=14][area>200000],
  [zoom=15][area>50000],
  [zoom=16][area>10000],
  [zoom>=17] {
    text-name: [name];
    text-face-name: @text_font_parks;
    text-placement: interior;
    text-wrap-width: 96;
    text-wrap-before: true;
    text-line-spacing: -3;
    text-fill: @label_color_green_area;
    text-size: 15;

    [zoom>=11] {
      text-fill: #586e50;
    }

    [zoom>=15] {
      text-size: 20;
      text-line-spacing: -7;
    }

    [zoom>=11] {
      text-halo-radius: @text_font_halo_radius_sm;
      text-halo-fill: @label_color_green_area_halo;
    }
    [zoom>=15] {
      text-halo-radius: @text_font_halo_radius_large;
    }
  }
}

#continents
{
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-wrap-width: 32;
  text-size: 24;
  text-line-spacing: -12;
  text-fill: #2e2115;
}

#admin0-labels-z3[longfrom>3] {
    text-name: "[shortname]";
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-size: 18;
    text-fill: @label_color_administrative;
    text-min-distance: 5;
}

#admin0-labels-z3[longfrom<=3] {
    text-name: "[name]";
    text-face-name: @text_font_administrative;
    text-size: 22;
    text-line-spacing: -8;
    text-wrap-width: 100;
    text-fill: @label_color_administrative;
}

#admin0-labels-z4 {
    text-name: [name];
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-size: 22;
    text-min-distance: 15;
    text-fill: @label_color_administrative;
}

#admin0-labels-z5 {
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-wrap-width: 80;
  text-size: 24;
  text-fill: @label_color_administrative;
}

#admin0-labels-z6 {
  text-name: [name];
  text-face-name: @text_font_administrative;
  text-wrap-width: 80;
  text-size: 24;
  text-fill: @label_color_administrative;
}

#city_labels_z4,
#city_labels_z5,
#city_labels_z6 {
  // for debugging
  //::outline {
  //  polygon-fill: #fff;
  //  polygon-opacity: 0.1;
  //}
  text-name: [name];
  text-face-name: @text_font_city;
  text-fill: @label_color_city;
  text-placement: interior;
  text-vertical-alignment: bottom;
  text-min-distance: 5;
  text-dy: -5;

  [justified='left'] {
    //text-horizontal-alignment: left;
    text-horizontal-alignment: middle;
    //text-dx: 20;
  }

  [justified='right'] {
    //text-horizontal-alignment: right;
    text-horizontal-alignment: middle;
    //text-dx: -20;
  }

  [zoom>=4]  {
    text-size: @text_font_size_xxsm;
  }

  [zoom>=5] {
    text-size: @text_font_size_xsm;
  }

  [font_size>=14] {
    text-size: @text_font_size_medium;
  }

  [font_size>=16] {
    text-size: @text_font_size_medium_plus;
  }

  [font_size>=18] {
    text-size: @text_font_size_large;
  }
}

#city_labels_z7,
#city_labels_z8, {
  // for debugging
  //::outline {
  //  polygon-fill: #fff;
  //  polygon-opacity: 0.3;
  //}
  [justified='left'] {
    text-horizontal-alignment: left;
    text-dx: 15;
  }

  [justified='right'] {
    text-horizontal-alignment: right;
    text-dx: -15;
  }

  text-name: [name];
  text-face-name: @text_font_city;
  text-fill: @label_color_city;
  text-size: @text_font_size_sm;
  text-min-distance: 5;
  text-allow-overlap: true;

  [font_size>=14] {
    text-size: @text_font_size_medium;
  }

  [font_size>=20] {
    text-size: @text_font_size_large;
  }
}

#city_labels_z9,
#city_labels_z10 {
  text-name: [name];
  text-face-name: @text_font_city;
  text-fill: @label_color_city;
  text-size: @text_font_size_medium_plus;
  text-halo-radius: 2;
  text-halo-fill: fadeout(rgba(255,255,255, 0.7), 30%);
  // text-comp-op: src;

  [font_size>=20] {
    text-size: @text_font_size_large;
  }
  
  [zoom>=11] {
    text-halo-fill: fadeout(rgba(255,255,255, 1), 30%);
  }
}

#city_points_z4,
#city_points_z5, 
#city_points_z6,
#city_points_z7,
#city_points_z8 {
  marker-ignore-placement: true;
  marker-width: 5;
  marker-fill: #2e2115;
  marker-line-width: 0;
}

#airports {
  [zoom>=10] {
    text-name: [abbrev];
    text-face-name: @text_font_transport;
    text-fill: #444;
    text-size: @text_font_size_medium_plus;
    
    text-halo-fill: #f7f7e6;
    text-halo-radius: 2;
    
    text-wrap-width: 128;
    text-dy: 14;  
  }

  [zoom>=13] {
    text-name: [name];
  }

  [zoom=14][natlscale>.04],
  [zoom=15][natlscale>.02],
  [zoom>=16][natlscale>.01]
  {
      text-dy: 20;
  }   

  [zoom=8][natlscale>2.3][type='major'],
  [zoom=9][natlscale>1.2][type='major'],
  [zoom=10][natlscale>0.57][type='major'],
  [zoom=11][natlscale>0.29][type='major'],
  [zoom=12][natlscale>0.29][type='major'],
  [zoom=13][natlscale>0.29][type='major']
  {
    point-file: url('icons/airport_major_l.png');
  }

  [zoom=14][natlscale>.29][type='major'],
  [zoom=15][natlscale>.29][type='major'],
  [zoom>=16][natlscale>.29][type='major']
  {
      point-file: url('icons/airport_major_xl.png');
  }

  [zoom=8][natlscale>2.3][type='small'],
  [zoom=9][natlscale>1.2][type='small'],
  [zoom=10][natlscale>.57][type='small'],
  [zoom=11][natlscale>.29][type='small'],
  [zoom=12][natlscale>.29][type='small'],
  [zoom=13][natlscale>.29][type='small']
  {
      point-file: url('icons/airport_small_l.png');
  }

  [zoom=14][natlscale>.29][type='small'],
  [zoom=15][natlscale>.29][type='small'],
  [zoom>=16][natlscale>.29][type='small']
  {
      point-file: url('icons/airport_small_xl.png');
  }

  [zoom=8][natlscale>2.3][type='military'],
  [zoom=9][natlscale>1.2][type='military'],
  [zoom=10][natlscale>.57][type='military'],
  [zoom=11][natlscale>.29][type='military'],
  [zoom=12][natlscale>.29][type='military'],
  [zoom=13][natlscale>.29][type='military']
  {
      point-file: url('icons/airport_military_l.png');
  }

  [zoom=14][natlscale>.29][type='military'],
  [zoom=15][natlscale>.29][type='military'],
  [zoom>=16][natlscale>.29][type='military']
  {
      point-file: url('icons/airport_military_xl.png');
  }

  [zoom=8][natlscale>2.3][type='spaceport'],
  [zoom=9][natlscale>1.2][type='spaceport'],
  [zoom=10][natlscale>.57][type='spaceport'],
  [zoom=11][natlscale>.29][type='spaceport'],
  [zoom=12][natlscale>.29][type='spaceport'],
  [zoom=13][natlscale>.29][type='spaceport']
  {
      point-file: url('icons/intergalactic_l.png');
  }

  [zoom=14][natlscale>.29][type='spaceport'],
  [zoom=15][natlscale>.29][type='spaceport'],
  [zoom>=16][natlscale>.29][type='spaceport']
  {
      point-file: url('icons/intergalactic_xl.png');
  }

  // [zoom=8][natlscale>2.3],
  // [zoom=9][natlscale>1.2],
  // [zoom=10][natlscale>.57],
  // [zoom=11][natlscale>.29],
  // [zoom=12][natlscale>.29],
  // [zoom=13][natlscale>.29]
  // {
  //     point-file: url('icons/airport_small_l.png');
  // }

  // [zoom=14][natlscale>.29],
  // [zoom=15][natlscale>.29],
  // [zoom>=16][natlscale>.29]
  // {
  //     point-file: url('icons/airport_small_xl.png');
  // }
 
}

