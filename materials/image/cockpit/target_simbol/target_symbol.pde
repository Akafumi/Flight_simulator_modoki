
void setup(){
  size(250, 250);
}
//noFill();
//float x = 125;
//float y = 100;
//float r = 60;
//ellipse(x, y, 2*r, 2*r);
//rect(x-r, y-r, 2*r, 2*r);
//triangle(x, y+r, x+r/2, y+((1+3^(1/2))*r)/2, x-r/2, y+((1+3^(1/2))*r)/2);

void draw() {
  target_symbol(125, 100, 60);
}

void target_symbol (float x, float y, int r) {
  noFill();
  ellipse(x, y, 2*r, 2*r);
  rect(x-r, y-r, 2*r, 2*r);
  triangle(x, y+r, x+r/2, y+((1+3^(1/2))*r)/2, x-r/2, y+((1+3^(1/2))*r)/2);
}
