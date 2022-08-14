float target_symbol_x; //物体の座標
float target_symbol_y; //物体の座標
float easing = 0.05;//追いつくスピード

void setup() {
  size(640, 360);   
}

void draw() { 
  background(51);
  float target_symbol_dx = mouseX - target_symbol_x;  //マウスと物体の差
  if(abs(target_symbol_dx) > 1) {  //もしマウスと物体の差が1よりも大きければ、
    target_symbol_x += target_symbol_dx * easing;//物体の座標に差×0.01を足していく。
  }
  
  float target_symbol_dy = mouseY - target_symbol_y;
  if(abs(target_symbol_dy) > 1) {
    target_symbol_y += target_symbol_dy * easing;
  }
  
  target_symbol(target_symbol_x, target_symbol_y,15);
}

void target_symbol (float x, float y, int r) {
  noFill();
  ellipse(x, y, 2*r, 2*r);
  rect(x-r, y-r, 2*r, 2*r);
  triangle(x, y+r, x+r/2, y+((1+3^(1/2))*r)/2, x-r/2, y+((1+3^(1/2))*r)/2);
}
