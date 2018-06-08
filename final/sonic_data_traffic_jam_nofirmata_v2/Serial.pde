///////////////////////////////////////////////////
//  GESTION DE SERIAL
///////////////////////////////////////////////////
void serial() {
  
  if (arduino != null){
    println(arduino.read());
    ultra = arduino.read();
    OscMessage myMessage = new OscMessage("/state");
    
    ////hay que hacer un filtro old-new para que sólo se envíe
    ////el mensaje cuando cambia el estado no cada vez que se
    ////detecta un valor de ultra
    if (ultra <= 50){
      myMessage.add(1);
      rest = false;
    } else {
      myMessage.add(0);
     rest = true; 
    }
    oscP5.send(myMessage, myRemoteLocation);
  }

}
