int sH, yH, xH, margin;

void setup() {
  size(400, 400);
  
  margin=20;
  sH=100;
  xH=100;
  yH=height-sH-margin;
}

void draw() {
  background(0);

  for (int i=0; i<8; i++) {
    handle(xH+(i*20), yH, sH);
  }
}

void handle(int x, int y, int s) {
  
  
  
  stroke(255);
  line(x, y, x, y+s);
}