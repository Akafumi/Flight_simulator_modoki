void setup() {
  size(640,400);
}

void draw() {
  AI(25);
  // AI(中心から頂点の距離);
}

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
