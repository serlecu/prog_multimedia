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
              print("a ");

              /////// OSC v2.0 ///////
              packet = p.receiverSocket();
              format = split(packet, ':');
              ip = format[0];
              port = format[1];
              octets = split(ip, '.');
              for (int i=0; i<=03; i++) {
                myMessage.add(int(octets[i]));
              }
              myMessage.add(port);
              print("R");
              delay(4);

              /////// SERIAL OFF //////
              arduino.write('b');
              println(" b");
              delay(2);
              bussy=false;
            } else {
              /////// SERIAL ON ///////
              arduino.write('c');
              print("c ");

              /////// OSC v2.0 ///////
              packet = p.receiverSocket();
              format = split(packet, ':');
              ip = format[0];
              port = format[1];
              octets = split(ip, '.');
              for (int i=0; i<=03; i++) {
                myMessage.add(int(octets[i]));
              }
              myMessage.add(port);
              print("R1");
              delay(4);

              ////// SERIAL OFF //////
              arduino.write("d");
              println(" d");
              delay(2);

              bussy=true;
            }
            oscP5.send(myMessage, myRemoteLocation);
            
            
            ///////// PORT HASHMAP ///////
            //// no entiendo hashmap, quiero que se acumulen los puertos
            //// en una lista sin duplicados para consultar en ella cada
            //// vez que llegue un paquete si el puerto está en la lista
            //// y qué número se le ha dado para accionar un solenoide u otro.
            //// https://processing.org/reference/HashMap.html
            //
            //Iterator it_port = port_hm.keySet().iterator();
            //while (it_port.hasNext()) { 
            //  String port = (String)it_port.next();
            //  float e = float(port_hm.get(port).toString());
            //  if (e > 50) {
            //    port_hm.put(port, str(e * 0.99));
            //    print("e: ");
            //    println(e);
            //  } 
            //}
            ///////// Print HM ///////
            //for (Map.Entry me : port_hm.entrySet()) {
            //  print(me.getKey() + " is ");
            //  println(me.getValue());
            //}
            //////////////////////////
            
            
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

              /////// OSC v2.0 ///////
              packet = p.senderSocket();
              format = split(packet, ':');
              ip = format[0];
              port = format[1];
              octets = split(ip, '.');
              for (int i=0; i<=03; i++) {
                myMessage.add(int(octets[i]));
              }
              myMessage.add(port);
              println("S");
              delay(4);

              //////// SERIAL OFF ///////
              arduino.write('b');
              delay(2);

              bussy=false;
            } else {
              /////// SERIAL 1 ///////
              arduino.write('c');

              /////// OSC v2.0 ///////
              packet = p.senderSocket();
              format = split(packet, ':');
              ip = format[0];
              port = format[1];
              octets = split(ip, '.');
              for (int i=0; i<=03; i++) {
                myMessage.add(int(octets[i]));
              }
              myMessage.add(port);
              println("S1");
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
