///////////////////////////////////////////////////
//  GESTION DE LOS PAQUETES
///////////////////////////////////////////////////

void packetEvent(CarnivorePacket p) {
  if (p != null) {
    if (p.data != null) {
      if (rest==false) {
        if (mode==receptor) {
          if (p.receiverAddress.ip!=null) {
            OscMessage myMessage = new OscMessage("/r");
            if (bussy) {
              /////// SERIAL ON ///////
              arduino.write('a');
              print("a");

              /////// OSC ///////
              ip = p.receiverAddress.ip.toString();
              octets = split(ip, '.');
              for (int i=0; i<=03; i++) {
                myMessage.add(int(octets[i]));
              }
              //myMessage.add(port);
              println("R");
              delay(4);

              /////// SERIAL OFF //////
              arduino.write('b');
              delay(2);
              bussy=false;
            } else {
              /////// SERIAL ON ///////
              arduino.write('c');

              /////// OSC ////
              ip = p.receiverAddress.ip.toString();
              octets = split(ip, '.');
              for (int i=0; i<=03; i++) {
                myMessage.add(int(octets[i]));
              }
              //myMessage.add(port);
              println("R2");
              delay(4);

              ////// SERIAL OFF //////
              arduino.write("d");
              delay(2);

              bussy=true;
            }
            oscP5.send(myMessage, myRemoteLocation);
          } else {
            //deberá leer un documento con una simulación
            //para cuando se pierda la conexión.
            tts.speak("no packet");
            setup();
          }
        } else if (mode==emisor) {
          if (p.senderAddress.ip!=null) {
            OscMessage myMessage = new OscMessage("/s");
            if (bussy) {
              /////// SERIAL ON //////
              arduino.write('a');

              /////// OSC ///////
              ip = p.senderAddress.ip.toString();
              octets = split(ip, '.');
              for (int i=0; i<=03; i++) {
                myMessage.add(int(octets[i]));
              }
              //myMessage.add(port);
              println("S");
              delay(4);

              //////// SERIAL OFF ///////
              arduino.write('b');
              delay(2);

              bussy=false;
            } else {
              /////// SERIAL 1 ///////
              arduino.write('c');

              /////// OSC ////////
              ip = p.senderAddress.ip.toString();
              octets = split(ip, '.');
              for (int i=0; i<=03; i++) {
                myMessage.add(int(octets[i]));
              }
              //myMessage.add(port);
              println("S2");
              delay(4);

              ////// SERIAL 2 //////
              arduino.write('d');
              delay(2);

              bussy=true;
            }
            oscP5.send(myMessage, myRemoteLocation);
          } else {
            //deberá leer un documento con una simulación
            //para cuando se pierda la conexión.
            tts.speak("no packet");
            setup();
          }
        } else {
          tts.speak("FATAL ERROR");
        }
      }
    }
  }
}
