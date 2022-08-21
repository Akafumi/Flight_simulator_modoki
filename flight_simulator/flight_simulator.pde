void setup() {
  size(1280,720);
}

// 敵機変数
float enemy_theta=3*PI/10;
float enemy_xc=400;
float enemy_yc=200;
float enemy_x=enemy_xc;
float enemy_y=enemy_yc;
float enemy_R=100;

// ターゲットシンボル変数
float target_symbol_x; 
float target_symbol_y; 
float target_symbol_easing = 0.05;

// 操作系変数
int console_rate = 1;
int yaw = 0;
int pitch = 0;

// HUD変数
float HUD_t = 0;

// 景観変数
float landscape_y = 0;
float landscape_t = 0;

// FPM変数
float FPM_x = 640;
float FPM_y = 360;
float FPM_easing = 0.02;
float FPM_p = 360;

// FFR_31変数
int FFR_31_x = 120;
int FFR_31_y = 550;
int FFR_31_s = 15;

void draw(){
  background(249,163,131);
  fill(0);

  // 景観描画
  landscape(landscape_y, 90, 5000, 750, landscape_t);
  landscape_y = landscape_y - pitch;
  landscape_t = landscape_t + yaw*PI/1200;

  // 敵機描画
  enemy(enemy_x,enemy_y,50);
  enemy_theta = enemy_theta + PI/400;
  enemy_x = enemy_xc+2*enemy_R*cos(2*enemy_theta+PI/6);
  enemy_y = enemy_yc+enemy_R*sin(3*enemy_theta);
  enemy_yc = enemy_yc +pitch;
  enemy_xc = enemy_xc + yaw/5;

  // HUD描画
  HUD(200,100,30,HUD_t);
  HUD_t = HUD_t + yaw*PI/1200;

  // Attitude Indicator描画
  AI(5);

  // ターゲットシンボル描画
  float target_symbol_dx = enemy_x - target_symbol_x;
  if(abs(target_symbol_dx) > 1) { 
    target_symbol_x = target_symbol_x + target_symbol_dx * target_symbol_easing;
  }
  float target_symbol_dy = enemy_y - target_symbol_y;
  if(abs(target_symbol_dy) > 1) {
    target_symbol_y = target_symbol_y + target_symbol_dy * target_symbol_easing;
  }
  target_symbol(target_symbol_x, target_symbol_y,15);

  // FPM描画
  float FPM_dy = FPM_p - FPM_y;
  if(abs(FPM_dy) > 1) { 
    FPM_y = FPM_y + FPM_dy * FPM_easing;
  }
  FPM(FPM_x, FPM_y, 10);
  FPM_p = FPM_p + pitch;

  // FFR_31_スーパーシルフ描画
  fill(51, 60, 94);
  ellipse(FFR_31_x, FFR_31_y, 25*FFR_31_s, 25*FFR_31_s);
  FFR_31(FFR_31_x, FFR_31_y, FFR_31_s);
  fill(150, 255, 215);
  AAM_3(FFR_31_x-4*FFR_31_s, FFR_31_y+7*FFR_31_s, FFR_31_s, "1"); // 1
  fill(150, 255, 215);
  AAM_3(FFR_31_x+4*FFR_31_s, FFR_31_y+7*FFR_31_s, FFR_31_s, "2"); // 2
  fill(134, 137, 195);
  AAM_3(FFR_31_x-2.5*FFR_31_s, FFR_31_y+5*FFR_31_s ,FFR_31_s , "3"); // 3
  fill(134, 137, 195);
  AAM_3(FFR_31_x+2.5*FFR_31_s, FFR_31_y+5*FFR_31_s ,FFR_31_s , "4"); // 4
  weapon(FFR_31_x+2*FFR_31_s, FFR_31_y-7*FFR_31_s);

  // 使い方描画
  // how_to(860,540);
  how_to(480,580);

  // フィードバック
  textSize(12);
  text("landscape_y="+landscape_y,width-100,10);
  text("landscape_t="+landscape_t,width-100,20);
  text("enemy_x="+enemy_x,width-100,30);
  text("enemy_y="+enemy_y,width-100,40);

  // if (landscape_y > 275 || landscape_y < -275) {
  //   textSize(35);
  //   text ("CRASH!", width/2-50, height/2);  
  // }


}

// 敵機
void enemy(float x, float y, int s) {
  fill(0);
  stroke(0);
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

// 景観
void landscape(float y, float back, float front, float distance, float t) {
  fill (128,104,48);
  stroke(0,0,0);
  float xc = width/2;
  float yc = height/2;
  quad(xc+((-back)*cos(t)-y*sin(t)),yc+((-back)*sin(t)+y*cos(t)),xc+((-front)*cos(t)-distance*sin(t)),yc+((-front)*sin(t)+distance*cos(t)),xc+(front*cos(t)-distance*sin(t)),yc+(front*sin(t)+distance*cos(t)),xc+(back*cos(t)-y*sin(t)),yc+(back*sin(t)+y*cos(t)));
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

// FFR_31_スーパーシルフ
void FFR_31(int x, int y, float s) {
  noStroke();
  fill(79,108,164);
  triangle(x, y, x+s, y, x, y-9*s);
  triangle(x, y, x-s, y, x, y-9*s);
  quad(x, y, x+1.5*s, y, x+1.5*s, y-s, x, y-2*s);
  quad(x, y, x-1.5*s, y, x-1.5*s, y-s, x, y-2*s);
  quad(x, y-3*s, x+2*s, y-1.6*s, x+2*s, y-1.2*s, x, y-2*s);
  quad(x, y-3*s, x-2*s, y-1.6*s, x-2*s, y-1.2*s, x, y-2*s);
  quad(x, y-1.7*s, x+5*s, y+4*s, x+5*s, y+5*s, x, y+3*s);
  quad(x, y-1.7*s, x-5*s, y+4*s, x-5*s, y+5*s, x, y+3*s);
  quad(x, y+3*s, x+5*s, y+5*s, x+4*s, y+6*s, x, y+5*s);
  quad(x, y+3*s, x-5*s, y+5*s, x-4*s, y+6*s, x, y+5*s);
  quad(x+3*s, y+5*s, x+2.5*s, y+7.5*s, x+1.6*s, y+7.5*s, x+s, y+5*s);
  quad(x-3*s, y+5*s, x-2.5*s, y+7.5*s, x-1.6*s, y+7.5*s, x-s, y+5*s);
  triangle(x, y, x+s, y, x, y+9*s);
  triangle(x, y, x-s, y, x, y+9*s);
}

// FFR_31_missile
void AAM_3(float x, float y, float s, String num){
  noStroke();
  quad(x, y, x, y-5*s, x+s/4, y-4.5*s, x+s/4, y);
  quad(x, y, x, y-5*s, x-s/4, y-4.5*s, x-s/4, y);
  quad(x-s/2, y-s, x+s/2, y-s, x+s/2, y-s/2, x-s/2, y-s/2);
  textSize(12);
  fill(255);
  text(num,x-4.5,y-5.5*s);
}

// FFR_31_武装
void weapon(int x, int y) {
  textSize(12);
  fill(255);
  text("GUN",x ,y);
  text("1550",x+40 ,y);
  fill(150, 255, 215);
  text("AAM-3",x ,y+10);
  text("4",x+55 ,y+10);
  noFill();
  stroke(255);
  strokeWeight(1);
  rect(x-5, y, 70, 10);
}

// 使い方
void how_to(int x, int y){
  noFill();
  stroke(0, 255, 0);
  fill(51, 60, 94);
  quad(x-10, y-50, x+350, y-50, x+350, y+140, x-10, y+140);

  fill (253, 126, 0);
  textSize(30);
  text("ENTERABLE KEY: w , a , s , d ",x ,y );
  text("W key to descend" ,x ,y+30 );
  text("S key to rise" ,x ,y+60 );
  text("A key to turn left" ,x ,y+90 );
  text("D key to turn right",x ,y+120 );
  textSize(12);
}

// 操作系
void keyPressed() {
  if (key == 'a') {
    yaw = yaw + console_rate;
  } else if (key == 'd') {
    yaw = yaw - console_rate;
  } else if (key == 'w') {
    pitch = pitch + console_rate;
  } else if (key == 's') {
    pitch = pitch - console_rate;
  }
}

