void setup() {
  size(640,400);
}

void draw() {
  HUD(200, 100, 25);
}

void HUD (int a, int b, float l) {
  int HUD_xc = width/2; 
  int HUD_yc = height/2;
  float HUD_theta;
  for (int i = 0; i <= 2; i += 1) {
    stroke(0, 255, 0);
    strokeWeight(3);
    HUD_theta = PI*i/12;
    line(HUD_xc+a*cos(HUD_theta), HUD_yc+b*sin(HUD_theta), HUD_xc+(a+l)*cos(HUD_theta), HUD_yc+(b+l)*sin(HUD_theta));
    line(HUD_xc+a*cos(-HUD_theta), HUD_yc+b*sin(-HUD_theta), HUD_xc+(a+l)*cos(-HUD_theta), HUD_yc+(b+l)*sin(-HUD_theta));
    line(HUD_xc+a*cos(HUD_theta+PI), HUD_yc+b*sin(HUD_theta+PI), HUD_xc+(a+l)*cos(HUD_theta+PI), HUD_yc+(b+l)*sin(HUD_theta+PI));
    line(HUD_xc+a*cos(-HUD_theta+PI), HUD_yc+b*sin(-HUD_theta+PI), HUD_xc+(a+l)*cos(-HUD_theta+PI), HUD_yc+(b+l)*sin(-HUD_theta+PI));
  }
  line(HUD_xc+l, HUD_yc, HUD_xc+6*l, HUD_yc);
  line(HUD_xc-l, HUD_yc, HUD_xc-6*l, HUD_yc);
}
