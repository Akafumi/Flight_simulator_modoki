void setup() {
  size(400,400);
}

void draw() {
  enemy(200,200,50);
}

void enemy(float x, float y, int s) {
  fill(0);
  triangle(x, y, x, y+s/5, x-s, y-s/5);
  triangle(x, y, x, y+s/5, x+s, y-s/5);
  triangle(x, y, x, y-s/5, x-s/2, y+3*s/5);
  triangle(x, y, x, y-s/5, x+s/2, y+3*s/5);
}
