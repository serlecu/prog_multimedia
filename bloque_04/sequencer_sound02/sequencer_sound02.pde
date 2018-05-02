import processing.sound.*;
TriOsc tri;
IntList freqSeq;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  for (int i=20; i<100; i = i+10){
    stroke(255);
    rect(i, 0, i+10, height-50);
  }
}  

void mousePressed() {
  if (mouseX>20 && mouseX<40 && mouseY)
}