/*
int numero = 4;

clase nombreDeclase = contenido;
________

Crear una lista para luego llamarla. 

https://processing.org/examples/arrayobjects.html
*/

Ser mySer[];

//Ser(int sh,int s,color c,float v)
int contador = 0;

void setup(){
  size(500,500);
}

void draw(){
  background(0);
  
  mySer[contador].walk();
}

void mouseClicked(){
  
  mySer[contador] = new Ser(int(random(2)),int(random(5,30)),color(100,200,20));
  
  mySer[contador].posX = mouseX;
  mySer[contador].posY = mouseY;
  mySer[contador].v = random(1,10);
  
  contador ++;
  
  if(contador > 5){
    contador=0;
  }
}