import guru.ttslib.*;
import net.sourceforge.jpcap.capture.*;
import net.sourceforge.jpcap.net.*;
import net.sourceforge.jpcap.simulator.*;
import net.sourceforge.jpcap.util.*;
import java.util.Iterator;
import org.rsg.carnivore.*;
import org.rsg.carnivore.cache.*;
import org.rsg.carnivore.net.*;
import org.rsg.lib.Log;
import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
import oscP5.*;
import netP5.*;

//check debounce para Arduino cuando se use el botón.

OscP5 oscP5;
NetAddress myRemoteLocation;
CarnivoreP5 carne;
Arduino arduino;
TTS tts;

int sol1, sol2, counter, mode=0, receptor=0, emisor=1 ;
boolean status = true, bussy = true;
HashMap iP_nodes;
String ip, packet, port;
String[] octets, format;
int oct1, oct2, oct3, oct4;
int oscport= 12000;
String Address = "localhost";

void setup() {
  size(200, 200);
  //println(Arduino.list());
  launch("/Users/sergio/Documents/Trabajos/UPV/Master/09 Prog Multimedia/final/sonic_data_traffic_jam/data/promisc_on.sh");
  //exec("echo -n 8143$ | sudo -S chmod 777 /dev/bpf*");
  launch("/Users/sergio/Documents/Trabajos/UPV/Master/09 Prog Multimedia/final/sonic_data_traffic_jam/data/traffic_synth.pd");
  tts = new TTS();

  oscP5 = new OscP5(this, oscport);
  myRemoteLocation = new NetAddress(Address, oscport);

  arduino = new Arduino(this, Arduino.list()[2], 57600);
  sol1=2;  //pin del solenoide 1
  sol2=3;  //pin del solenoide 2
  arduino.pinMode(sol1, Arduino.OUTPUT);
  arduino.pinMode(sol1, Arduino.OUTPUT);
  println("Arduino OK");

  Log.setDebug(true);
  carne = new CarnivoreP5(this);
  carne.setVolumeLimit(4);
  println("Carnivore OK");

  iP_nodes = new HashMap();
  counter=0;
  tts.speak("SYSTEM READY");
}

void draw() {
  if (carne.isMacAndPromiscuousModeFailed) {
    Error();
  } else {
    Run();
  }
}

void Error() {
  background(0);
  textAlign(CENTER);
  tts.speak("Failure  when  setting  up  sniffing  packet.");
  delay(10);
  setup();
}
///////////////////////////////////////////////////
//  DISPOSITIVOS INTERACTUANDO
///////////////////////////////////////////////////
void Run() {
  counter++;
  Iterator it = iP_nodes.keySet().iterator();
  while (it.hasNext()) {
    String ip = (String)it.next();
    float d = float(iP_nodes.get(ip).toString());
    if (d > 50) {
      iP_nodes.put(ip, str(d * 0.99));
    }
  }
}

///////////////////////////////////////////////////
//  GESTION DE LOS PAQUETES
///////////////////////////////////////////////////

void packetEvent(CarnivorePacket p) {
  if (p != null) {
    if (p.data != null) {
      if (mode==receptor) {
        if (p.receiverAddress.ip!=null) {
          OscMessage myMessage = new OscMessage("/r");
          if (bussy) {
            arduino.digitalWrite(sol1, Arduino.HIGH);
            /////// mensaje OSC ////
          /*  packet = p.receiverSocket();
            format = split(packet,':');
            port = format[1];
            ip = format[2];
            */
            ip = p.receiverAddress.ip.toString();
            octets = split(ip, '.');
            for(int i=0;i<=03;i++){
            myMessage.add(int(octets[i]));
            }
            //myMessage.add(port);
            ////////////////////////
            //print(p.receiverAddress.ip);
            println("R");
            delay(5);
            arduino.digitalWrite(sol1, Arduino.LOW);
            delay(2);
            bussy=false;
          } else {
            arduino.digitalWrite(sol2, Arduino.HIGH);
            /////// mensaje OSC ////
           /* packet = p.receiverSocket();
            format = split(packet,':');
            port = format[1];
            ip = format[2]; */
            ip = p.receiverAddress.ip.toString();
            octets = split(ip, '.');
            for(int i=0;i<=03;i++){
            myMessage.add(int(octets[i]));
            }
            myMessage.add(port);
            ////////////////////////
            //print(p.receiverAddress.ip);
            println("R2");
            delay(5);
            arduino.digitalWrite(sol2, Arduino.LOW);
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
            arduino.digitalWrite(sol1, Arduino.HIGH);
            /////// mensaje OSC ////
            packet = p.senderSocket();
            format = split(packet,':');
            port = format[1];
            ip = format[2];
            octets = split(ip, '.');
            for(int i=0;i<=03;i++){
            myMessage.add(int(octets[i]));
            }
            myMessage.add(port);
            ////////////////////////
            //print(p.senderAddress.ip);
            println("S");
            delay(5);
            arduino.digitalWrite(sol1, Arduino.LOW);
            delay(2);
            bussy=false;
          } else {
            arduino.digitalWrite(sol2, Arduino.HIGH);
            /////// mensaje OSC ////
            packet = p.senderSocket();
            format = split(packet,':');
            port = format[1];
            ip = format[2];
            octets = split(ip, '.');
            for(int i=0;i<=03;i++){
            myMessage.add(int(octets[i]));
            }
            myMessage.add(port);
            ////////////////////////
            //print(p.senderAddress.ip);
            println("S2");
            delay(5);
            arduino.digitalWrite(sol2, Arduino.LOW);
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

void mouseReleased() {
  if (mode==0) {
    tts.speak("emisor mode enabled");
    mode=emisor;
  } else if (mode==1) {
    tts.speak("receptor mode enabled");
    mode=receptor;
  }
}
