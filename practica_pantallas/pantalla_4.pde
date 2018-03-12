float cursorXMap, cursorYMap;
int rad;

void setupCuatro() {
}

void drawCuatro() {
  background(255);
  rad = 20;

  fill(0);
  rect(100, 250, 100, 100);
  
  cursorXMap = map(mouseX, 100, 200, 0-rad, width+rad);
  cursorYMap = map(mouseY, 250, 350, 0-rad, height+rad);
  
  if (mouseX>=100 && mouseX<= 200 && mouseY>=250&&mouseY<=350) {
    fill(0);
    ellipse(cursorXMap, cursorYMap, rad*2, rad*2);
  }
}