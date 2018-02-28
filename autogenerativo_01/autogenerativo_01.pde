int posX=1200/2, posY=720/2, x=30, y=30 ;

void setup(){
  size(1200,720);
  background(0);
}

void draw(){
  
  ellipse(posX,posY,x,y);
  
  posX -= random(-5,5);
  posY -= random(-5,5);
  
  if(posX>=(width)){
  posX=0;
  }if(posY>=(height)){
  posY=0;
  }if(posX<(x/2)){
  posX=width;
  }if(posY<(y/2)){
  posY=height;
  }
}
void keyPressed(){
  background(0);

}
void mousePressed(){
  posX=mouseX;
  posY=mouseY;
}