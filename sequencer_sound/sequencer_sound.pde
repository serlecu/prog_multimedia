//FAILED

ArrayList<Handle> handle;
int sH, yH, xH, margin;
int FR;

void setup() {
  size(400, 400);
  FR=100;
  margin=20;
  sH=100;
  xH=100;
  yH=height-sH-margin;
   handle = new ArrayList<Handle>();
}

void draw() {
  background(0);
  frameRate(FR);

  for (int i=0; i<9; i++) {
    handleL(xH+(i*20), yH, sH);
    Handle hand = handle.get(i);
    hand.display(); 
  }
}

void handleL(int x, int y, int s) {
  stroke(255);
  line(x, y, x, y+s);
}

class Handle {
  int x;
  int y;
  Handle (int x,int y) {
    this.x=x;
    this.y=Y;
    
  }
  void display () { 
    fill(200);
    ellipse(x, y, 4, 4);
    /*
    int relY;
    if (mouseX == x && mouseY > && mouseY <= ) {
    }
    return relY;
    */
  }
}