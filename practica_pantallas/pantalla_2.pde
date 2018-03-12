int sentido,xpos,count2;
void setupDos(){
   sentido = 1;
  xpos=20;
  count2=0;
}

void drawDos(){
  background(0,255,0);
  xpos=xpos+sentido;
  
  count2++;
  if(count2 >= 50){
    pantalla=3;
    count2=0;
  }
  
  fill(255);
  noStroke();
  ellipse(xpos,height/2,40,40);
  
  if(xpos >= width-20 || xpos <= 20){
    sentido = sentido*(-1);
  }
}