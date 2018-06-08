///////////////////////////////////////////////////
//  GESTION DE SERIAL
///////////////////////////////////////////////////
void serial() {
  
  if (arduino != null){
    println(arduino.read());
    ultra = arduino.read();
    OscMessage myMessage = new OscMessage("/state");
    if (ultra <= 50){
      myMessage.add(0);
      rest = false;
    } else {
      myMessage.add(1);
     rest = true; 
    }
    oscP5.send(myMessage, myRemoteLocation);
  }

}
