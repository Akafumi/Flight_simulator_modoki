void setup() {
  size(640,400);
}

void draw() {
  FPM(width/2, height/2, 10);
  // FPM(位置x, 位置y, 円半径);
}

void FPM(float FPM_xc, float FPM_yc, float FPM_r) {
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  ellipse(FPM_xc, FPM_yc, FPM_r, FPM_r);
  line(FPM_xc+FPM_r, FPM_yc, FPM_xc+2*FPM_r, FPM_yc);
  line(FPM_xc-FPM_r, FPM_yc, FPM_xc-2*FPM_r, FPM_yc);
  line(FPM_xc, FPM_yc-FPM_r, FPM_xc, FPM_yc-2*FPM_r);
}
