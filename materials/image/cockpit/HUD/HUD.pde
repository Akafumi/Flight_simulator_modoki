void setup() {
  size(640,400);
}

void draw() {
  HUD(200, 100, 25, 0);
  // HUD(楕円の長軸,楕円の短軸,間隔,傾き角度);
}

void HUD (int a, int b, float l, float t) {
  int HUD_xc = width/2; 
  int HUD_yc = height/2;
  float HUD_theta;
  for (int i = 0; i <= 2; i += 1) {
    stroke(0, 255, 0);
    strokeWeight(3);
    HUD_theta = PI*i/12;
    line(HUD_xc+(a*cos(HUD_theta))*cos(t)-(b*sin(HUD_theta))*sin(t), HUD_yc+(a*cos(HUD_theta))*sin(t)+(b*sin(HUD_theta))*cos(t), HUD_xc+((a+l)*cos(HUD_theta))*cos(t)-((b+l)*sin(HUD_theta))*sin(t), HUD_yc+((a+l)*cos(HUD_theta))*sin(t)+((b+l)*sin(HUD_theta))*cos(t));
    line(HUD_xc+(a*cos(-HUD_theta))*cos(t)-(b*sin(-HUD_theta))*sin(t), HUD_yc+(a*cos(-HUD_theta))*sin(t)+(b*sin(-HUD_theta))*cos(t), HUD_xc+((a+l)*cos(-HUD_theta))*cos(t)-((b+l)*sin(-HUD_theta))*sin(t), HUD_yc+((a+l)*cos(-HUD_theta))*sin(t)+((b+l)*sin(-HUD_theta))*cos(t));
    line(HUD_xc+(a*cos(HUD_theta+PI))*cos(t)-(b*sin(HUD_theta+PI))*sin(t), HUD_yc+(a*cos(HUD_theta+PI))*sin(t)+(b*sin(HUD_theta+PI))*cos(t), HUD_xc+((a+l)*cos(HUD_theta+PI))*cos(t)-((b+l)*sin(HUD_theta+PI))*sin(t), HUD_yc+((a+l)*cos(HUD_theta+PI))*sin(t)+((b+l)*sin(HUD_theta+PI))*cos(t));
    line(HUD_xc+(a*cos(-HUD_theta+PI))*cos(t)-(b*sin(-HUD_theta+PI))*sin(t), HUD_yc+(a*cos(-HUD_theta+PI))*sin(t)+(b*sin(-HUD_theta+PI))*cos(t), HUD_xc+((a+l)*cos(-HUD_theta+PI))*cos(t)-((b+l)*sin(-HUD_theta+PI))*sin(t), HUD_yc+((a+l)*cos(-HUD_theta+PI))*sin(t)+((b+l)*sin(-HUD_theta+PI))*cos(t));
  }
  line(HUD_xc+l*cos(t), HUD_yc+l*sin(t), HUD_xc+6*l*cos(t), HUD_yc+6*l*sin(t));
  line(HUD_xc-l*cos(t), HUD_yc-l*sin(t), HUD_xc-6*l*cos(t), HUD_yc-6*l*sin(t));
}


