void setup() {
  size(640,400);
}

float t=0;
float rotation=0;

void draw() {
  // HUD(200, 100, 30, -PI/13);
  // HUD(楕円の長軸,楕円の短軸,間隔,傾き角度);

  background(255);
  AI(5);
  HUD(200,100,30,t);
} 

void HUD (int HUD_a, int HUD_b, float HUD_l, float HUD_t) {
  int HUD_xc = width/2; 
  int HUD_yc = height/2;
  float HUD_theta;
  for (int i = 0; i <= 2; i += 1) {
    stroke(0, 255, 0);
    strokeWeight(3);
    HUD_theta = PI*i/12;
    line(HUD_xc+(HUD_a*cos(HUD_theta))*cos(HUD_t)-(HUD_b*sin(HUD_theta))*sin(HUD_t), HUD_yc+(HUD_a*cos(HUD_theta))*sin(HUD_t)+(HUD_b*sin(HUD_theta))*cos(HUD_t), HUD_xc+((HUD_a+HUD_l)*cos(HUD_theta))*cos(HUD_t)-((HUD_b+HUD_l)*sin(HUD_theta))*sin(HUD_t), HUD_yc+((HUD_a+HUD_l)*cos(HUD_theta))*sin(HUD_t)+((HUD_b+HUD_l)*sin(HUD_theta))*cos(HUD_t));
    line(HUD_xc+(HUD_a*cos(-HUD_theta))*cos(HUD_t)-(HUD_b*sin(-HUD_theta))*sin(HUD_t), HUD_yc+(HUD_a*cos(-HUD_theta))*sin(HUD_t)+(HUD_b*sin(-HUD_theta))*cos(HUD_t), HUD_xc+((HUD_a+HUD_l)*cos(-HUD_theta))*cos(HUD_t)-((HUD_b+HUD_l)*sin(-HUD_theta))*sin(HUD_t), HUD_yc+((HUD_a+HUD_l)*cos(-HUD_theta))*sin(HUD_t)+((HUD_b+HUD_l)*sin(-HUD_theta))*cos(HUD_t));
    line(HUD_xc+(HUD_a*cos(HUD_theta+PI))*cos(HUD_t)-(HUD_b*sin(HUD_theta+PI))*sin(HUD_t), HUD_yc+(HUD_a*cos(HUD_theta+PI))*sin(HUD_t)+(HUD_b*sin(HUD_theta+PI))*cos(HUD_t), HUD_xc+((HUD_a+HUD_l)*cos(HUD_theta+PI))*cos(HUD_t)-((HUD_b+HUD_l)*sin(HUD_theta+PI))*sin(HUD_t), HUD_yc+((HUD_a+HUD_l)*cos(HUD_theta+PI))*sin(HUD_t)+((HUD_b+HUD_l)*sin(HUD_theta+PI))*cos(HUD_t));
    line(HUD_xc+(HUD_a*cos(-HUD_theta+PI))*cos(HUD_t)-(HUD_b*sin(-HUD_theta+PI))*sin(HUD_t), HUD_yc+(HUD_a*cos(-HUD_theta+PI))*sin(HUD_t)+(HUD_b*sin(-HUD_theta+PI))*cos(HUD_t), HUD_xc+((HUD_a+HUD_l)*cos(-HUD_theta+PI))*cos(HUD_t)-((HUD_b+HUD_l)*sin(-HUD_theta+PI))*sin(HUD_t), HUD_yc+((HUD_a+HUD_l)*cos(-HUD_theta+PI))*sin(HUD_t)+((HUD_b+HUD_l)*sin(-HUD_theta+PI))*cos(HUD_t));
  }
  line(HUD_xc+HUD_l*cos(HUD_t), HUD_yc+HUD_l*sin(HUD_t), HUD_xc+5*HUD_l*cos(HUD_t), HUD_yc+5*HUD_l*sin(HUD_t));
  line(HUD_xc-HUD_l*cos(HUD_t), HUD_yc-HUD_l*sin(HUD_t), HUD_xc-5*HUD_l*cos(HUD_t), HUD_yc-5*HUD_l*sin(HUD_t));
}

void keyPressed() {
  if (key == 'a') {
    rotation = PI/100;
    t = t + rotation;
  } else if (key == 'd') {
    rotation = -PI/100;
    t = t + rotation;
  }
}

void AI(float AI_r) {
  stroke(0, 255, 0);
  strokeWeight(3);
  line(width/2, height/2-AI_r, width/2+1.5*AI_r, height/2+AI_r);
  line(width/2, height/2-AI_r, width/2-1.5*AI_r, height/2+AI_r);
  line(width/2+1.5*AI_r, height/2+AI_r, width/2+2.25*AI_r, height/2);
  line(width/2-1.5*AI_r, height/2+AI_r, width/2-2.25*AI_r, height/2);
  line(width/2+2.25*AI_r, height/2, width/2+4.5*AI_r, height/2);
  line(width/2-2.25*AI_r, height/2, width/2-4.5*AI_r, height/2);
}
