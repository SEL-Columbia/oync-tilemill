@line:#121212;
@point:#ee0c0c;

#lines {
  line-width:3;
  line-color:@line;
  line-cap:round;
  line-join:round;
  [zoom<=14]{line-width:2; }
  [zoom>17][zoom<=20]{line-width:4; }
  [zoom>20]{line-width:6;}
}

#points {
  [zoom >= 15] {
    marker-width: 20;
    marker-height: 18;
    marker-allow-overlap: true;
    marker-ignore-placement: true;
    marker-line-width: 1;
  }
}