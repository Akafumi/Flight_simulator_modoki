void setup() {
  size(640,360);
}

float enemy_theta=3*PI/10;
float enemy_xc=400;
float enemy_yc=200;
float enemy_x=enemy_xc;
float enemy_y=enemy_yc;
float enemy_R=180;

float target_symbol_x; //物体の座標
float target_symbol_y; //物体の座標
float easing = 0.02;//追いつくスピード

int yaw = 0;
int pitch = 0;

float t = 0;
float rotation = 0;

void draw(){
  background(255);
  fill(0);

  // HUD描画
  HUD(200,100,30,t);

  // Attitude Indicator描画
  AI(5);

  // 敵機描画
  text("enemy_x="+enemy_x,width-80,10);
  text("enemy_y="+enemy_y,width-80,20);
  enemy(enemy_x,enemy_y,50);
  enemy_theta = enemy_theta + PI/4000;
  enemy_x = enemy_xc+2*enemy_R*cos(2*enemy_theta+PI/12);
  enemy_y = enemy_yc+enemy_R*sin(3*enemy_theta);

  // ターゲットシンボル描画
  float target_symbol_dx = enemy_x - target_symbol_x;
  if(abs(target_symbol_dx) > 1) { 
    target_symbol_x += target_symbol_dx * easing;
  }
  float target_symbol_dy = enemy_y - target_symbol_y;
  if(abs(target_symbol_dy) > 1) {
    target_symbol_y += target_symbol_dy * easing;
  }
  target_symbol(target_symbol_x, target_symbol_y,15);
}

// 敵機
void enemy(float x, float y, int s) {
  fill(0);
  stroke(0,0,0);
  triangle(x, y, x, y+s/5, x-s, y-s/5);
  triangle(x, y, x, y+s/5, x+s, y-s/5);
  triangle(x, y, x, y-s/5, x-s/2, y+3*s/5);
  triangle(x, y, x, y-s/5, x+s/2, y+3*s/5);
}

// ターゲットシンボル
void target_symbol (float x, float y, int r) {
  noFill();
  ellipse(x, y, 2*r, 2*r);
  rect(x-r, y-r, 2*r, 2*r);
  triangle(x, y+r, x+r/2, y+((1+3^(1/2))*r)/2, x-r/2, y+((1+3^(1/2))*r)/2);
}

// HUD
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

// AttitudeIndicator
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

// 操作系
void keyPressed() {
  if (key == 'a') {
    yaw = + 10;
    enemy_xc = enemy_xc + yaw;
    rotation = PI/100;
    t = t + rotation;
  } else if (key == 'd') {
    yaw = - 10;
    enemy_xc = enemy_xc + yaw;
    rotation = -PI/100;
    t = t + rotation;
  } else if (key == 'w') {
    pitch = + 10;
    enemy_yc = enemy_yc +pitch;
  } else if (key == 's') {
    pitch = - 10;
    enemy_yc = enemy_yc +pitch;
  }
}

