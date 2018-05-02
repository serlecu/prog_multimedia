import processing.sound.*;
SinOsc sine;
float osc1freq, osc1vol, sbrush;
int margin;
color fondo1;

void setup() {
  size(400, 400);
  margin = 5;
  fondo1 = 255;

  sine=new SinOsc(this);
  sine.play();
}

void draw() {
  margenes(margin, fondo1);
  fill(0, 50);
  rect(margin, margin, width-margin*2, height-margin*2);


  sbrush = map(mouseY, margin, height-margin, 0, 20)/2+map(mouseX, margin, width-margin, 0, 20)/2;
  osc1freq = map(mouseX, margin, width-margin, 20, 1700);
  osc1vol = map(mouseY, margin, height-margin, 0, 1);
  sine.freq(osc1freq);
  sine.amp(osc1vol);

  if (mouseX>=margin && mouseX<=width-margin && mouseY>=margin && mouseY<=height-margin) {
    fill(255);
    noStroke();
    ellipse(mouseX, mouseY, sbrush, sbrush);
  }
}

void margenes(int smargin, color cmargin) {
  fill(cmargin);
  noStroke();
  rect(0, 0, width, smargin);
  rect(0, 0, smargin, height);
  rect(0, height-smargin, width, height);
  rect(width-smargin, 0, width, height);
}