//pantalla de preparación

int count1;
int loadtime;
int angle;

void setupUno(){
  count1=0;
  loadtime=192;
  
}

void drawUno(){
  background(255,50);
  noStroke();
  pushMatrix();
  translate(width/2,height/2-20);
  fill(0,50);
  rect(-25,-25,50,50);
  rotate(PI+angle);
  fill(20);
  ellipse(10,10,10,10);
  ellipse(10,-10,10,10);
  ellipse(-10,10,10,10);
  ellipse(-10,-10,10,10);
  popMatrix();
  
  angle++;
  if(angle >= 180){
    angle=0;
  }
  
  count1++;
  if(count1 >= loadtime){
    pantalla=2;
    count1=0;
  }

}