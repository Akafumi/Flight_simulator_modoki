void setup() {
  size(640,360);
}

// FFR_31変数
int FFR_31_x = 320;
int FFR_31_y = 180;
int FFR_31_s = 10;

void draw() {
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
  rect(x-5, y, 70, 10);
}
