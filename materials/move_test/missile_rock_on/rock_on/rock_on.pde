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

void draw(){
  background(255);
  fill(0);
  text("enemy_x="+enemy_x,width-80,10);
  text("enemy_y="+enemy_y,width-80,20);
  enemy(enemy_x,enemy_y,50);
  enemy_theta = enemy_theta + PI/4000;
  enemy_x = enemy_xc+2*enemy_R*cos(2*enemy_theta+PI/12);
  enemy_y = enemy_yc+enemy_R*sin(3*enemy_theta);

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

void enemy(float x, float y, int s) {
  fill(0);
  triangle(x, y, x, y+s/5, x-s, y-s/5);
  triangle(x, y, x, y+s/5, x+s, y-s/5);
  triangle(x, y, x, y-s/5, x-s/2, y+3*s/5);
  triangle(x, y, x, y-s/5, x+s/2, y+3*s/5);
}

void target_symbol (float x, float y, int r) {
  noFill();
  ellipse(x, y, 2*r, 2*r);
  rect(x-r, y-r, 2*r, 2*r);
  triangle(x, y+r, x+r/2, y+((1+3^(1/2))*r)/2, x-r/2, y+((1+3^(1/2))*r)/2);
}

void keyPressed() {
  if (key == 'a') {
    yaw = + 10;
    enemy_xc = enemy_xc + yaw;
  } else if (key == 'd') {
    yaw = - 10;
    enemy_xc = enemy_xc + yaw;
  } else if (key == 'w') {
    pitch = + 10;
    enemy_yc = enemy_yc +pitch;
  } else if (key == 's') {
    pitch = - 10;
    enemy_yc = enemy_yc +pitch;
  }
}
