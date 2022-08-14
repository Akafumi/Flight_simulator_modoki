void setup(){
  background(255);
  size(800,400);
}

float enemy_theta=3*PI/10;
float enemy_xc=400;
float enemy_yc=200;
float enemy_x=enemy_xc;
float enemy_y=enemy_yc;
float enemy_R=180;

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
}

void enemy(float x, float y, int s) {
  fill(0);
  triangle(x, y, x, y+s/5, x-s, y-s/5);
  triangle(x, y, x, y+s/5, x+s, y-s/5);
  triangle(x, y, x, y-s/5, x-s/2, y+3*s/5);
  triangle(x, y, x, y-s/5, x+s/2, y+3*s/5);
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

