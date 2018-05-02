
int time;

void setup(){
  size(500,500);
  
  int triple = calculaTriple(50);
  println(triple);
}

void draw(){
  time +=5;
  coloreaFondo();
  drawCircle(mouseX,mouseY,time);
  if(time>=255){
    time=0;
  }
  
}

void coloreaFondo(){
 background(0); 
}

void drawCircle(int diametro,int line,int fill){
  fill(fill);
  strokeWeight(line);
  ellipse(250,250,diametro,diametro);
}

int calculaTriple(int num){
  int resultado = num * 3;
  return resultado;
}