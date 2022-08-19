void setup() {
  size(400,400);
}

void draw() {
  enemy(200,200,50,PI/4);
}

void enemy(float x, float y, int s, float t) {
  fill(0);
  // triangle(x, y, x, y+s/5, x-s, y-s/5);
  // triangle(x, y, x, y+s/5, x+s, y-s/5);
  // triangle(x, y, x, y-s/5, x-s/2, y+3*s/5);
  // triangle(x, y, x, y-s/5, x+s/2, y+3*s/5);

  triangle((x*cos(t)-y*sin(t)), (x*sin(t)+y*cos(t)), (x*cos(t)-(y+s/5)*sin(t)), (x*sin(t)+(y+s/5)*cos(t)), ((x-s)*cos(t)-(y-s/5)*sin(t)), ((x-s)*sin(t)+(y-s/5)*cos(t)));
  triangle((x*cos(t)-y*sin(t)), (x*sin(t)+y*cos(t)), (x*cos(t)-(y+s/5)*sin(t)), (x*sin(t)+(y+s/5)*cos(t)), ((x+s)*cos(t)-(y-s/5)*sin(t)), ((x+s)*sin(t)+(y-s/5)*cos(t)));
  triangle((x*cos(t)-y*sin(t)), (x*sin(t)+y*cos(t)), (x*cos(t)-(y-s/5)*sin(t)), (x*sin(t)+(y-s/5)*cos(t)), ((x-s/2)*cos(t)-(y+3*s/5)*sin(t)), ((x-s/2)*sin(t)+(y+3*s/5)*cos(t)));
  triangle((x*cos(t)-y*sin(t)), (x*sin(t)+y*cos(t)), (x*cos(t)-(y-s/5)*sin(t)), (x*sin(t)+(y-s/5)*cos(t)), ((x+s/2)*cos(t)-(y+3*s/5)*sin(t)), ((x+s/2)*sin(t)+(y+3*s/5)*cos(t)));

}
