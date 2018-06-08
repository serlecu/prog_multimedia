Cronometro crono;
Estado status;

int state=0, contando=0, pausado=1;

void setup() {
  size(600, 600);
  status = new Estado(0);
}



void draw() { 
  background(0);
  if(status.eActual==0){
    
  }else if(status.eActual==1){
    
  }
}

void mousePressed(){
  if(status.eActual==0){
   crono.pausar();
   status.cambiarEstado(1);
  }else if(status.eActual==1){
    crono.reiniciar(); 
    status.cambiarEstado(0);
  }
}

////////////////////////////////////////////
// ESTADO
////////////////////////////////////////////
class Estado {
  int eActual;
  Cronometro crom;
  Estado (int estadoInicial) {
    eActual = estadoInicial;
    crom = new Cronometro();
  }
  void cambiarEstado(int nuevoEstado ) {
    eActual = nuevoEstado;
  }
}

//////////////////////////////////////////////
// CRONOMETRO
//////////////////////////////////////////////
class Cronometro
{   
  long tiempoInicial;
  long tiempoActual;

  Cronometro()
  {   
    //tiempoInicial=System.currentTimeMillis();
    tiempoInicial=millis();
  }

  void pausar()
  {
    text( tiempoActual, 20, 20);
  }

  void reiniciar()
  {  //tiempoInicial=System.currentTimeMillis();
    tiempoInicial=millis();
  }


  long tiempoT()
  {    
    tiempoActual= millis()- tiempoInicial;
    return tiempoActual;
  }
  void dibujar()
  {   
    tiempoActual= millis()- tiempoInicial;
    text( tiempoActual, 20, 20);
  }
}
