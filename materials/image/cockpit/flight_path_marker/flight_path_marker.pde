void setup() {
  size(640,360);
}

// 機体の角度変数
int yaw = 0;
int pitch = 0;

// FPM変数
float FPM_x = 320;
float FPM_y = 200;
float FPM_easing = 0.02;
float FPM_p = 180;

void draw() {
  background(255);
  // FPM描画
  float FPM_dy = FPM_p - FPM_y;
  if(abs(FPM_dy) > 1) { 
    FPM_y = FPM_y + FPM_dy * FPM_easing;
  }
  FPM(FPM_x, FPM_y, 10);
  FPM_p = FPM_p + pitch;
}

// FPM
void FPM(float xc, float yc, float r) {
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  ellipse(xc, yc, r, r);
  line(xc+r, yc, xc+2*r, yc);
  line(xc-r, yc, xc-2*r, yc);
  line(xc, yc-r, xc, yc-2*r);
}

// 操作系
void keyPressed() {
  if (key == 'a') {
    yaw = yaw + 1;
  } else if (key == 'd') {
    yaw = yaw - 1;
  } else if (key == 'w') {
    pitch = pitch + 1;
  } else if (key == 's') {
    pitch = pitch - 1;
  }
}
