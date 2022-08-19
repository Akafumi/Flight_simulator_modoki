void setup() {
  size(1280,720);
}

void draw() {
  how_to(860,540);
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
