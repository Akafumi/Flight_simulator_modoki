void setup() {
  size(640,360);
}

int pitch = 0;
float yaw = 0;
float landscape_y = 0;
float landscape_t = 0;

void draw(){
  background(255);
  landscape(landscape_y, 90, 500, 180, landscape_t);
  landscape_y = landscape_y - pitch;
  landscape_t = landscape_t + yaw*PI/1200;
}

void landscape(float y, float back, float front, float distance, float t) {
  fill (162,96,191);
  float xc = width/2;
  float yc = height/2;
  quad(xc+((-back)*cos(t)-y*sin(t)),yc+((-back)*sin(t)+y*cos(t)),xc+((-front)*cos(t)-distance*sin(t)),yc+((-front)*sin(t)+distance*cos(t)),xc+(front*cos(t)-distance*sin(t)),yc+(front*sin(t)+distance*cos(t)),xc+(back*cos(t)-y*sin(t)),yc+(back*sin(t)+y*cos(t)));
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
