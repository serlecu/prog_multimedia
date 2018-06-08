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

import processing.serial.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
CarnivoreP5 carne;
Serial arduino;
TTS tts;

//Arduino//
int sol1, sol2, ultra;
String serial = null;
boolean rest = true;

//Carnivore//
int counter, mode=0, receptor=0, emisor=1 ;
boolean status = true, bussy = true;
HashMap iP_nodes;
String ip, packet, port;
String[] octets, format;
int oct1, oct2, oct3, oct4;

//OSC
int oscport= 12001;
String Address = "localhost";


void setup() {
  size(200, 200);
  //println(Serial.list());
  launch("/Users/sergio/Documents/Trabajos/UPV/Master/09 Prog Multimedia/final/sonic_data_traffic_jam/data/promisc_on.sh");
  //exec("echo -n 8143$ | sudo -S chmod 777 /dev/bpf*");
  launch("/Users/sergio/Documents/Trabajos/UPV/Master/09 Prog Multimedia/final/sonic_data_traffic_jam/data/traffic_synth.pd");
  tts = new TTS();

  arduino = new Serial(this, Serial.list()[2],57600);
  println("Arduino OK");

  Log.setDebug(true);
  carne = new CarnivoreP5(this);
  //carne.setVolumeLimit(7);
  println("Carnivore OK");

  iP_nodes = new HashMap();
  counter=0;
  delay(3000);
  
  oscP5 = new OscP5(this, oscport);
  myRemoteLocation = new NetAddress(Address, oscport);
  
  tts.speak("SYSTEM READY");
}

void draw() {
  if (carne.isMacAndPromiscuousModeFailed) {
    Error();
  } else {
    delay(1000);
    Run();
  }
}

void Error() {
  background(0);
  textAlign(CENTER);
  tts.speak("Failure  when  setting  up  sniffing  packet.");
  delay(100);
  setup();
}


///////////////////////////////////////////////////
//  DISPOSITIVOS INTERACTUANDO
///////////////////////////////////////////////////
void Run() {
  counter++;
  //lo de no repetir ip para hacer una lista
  Iterator it = iP_nodes.keySet().iterator();
  while (it.hasNext()) { 
    String ip = (String)it.next();
    float d = float(iP_nodes.get(ip).toString());
    if (d > 50) {
      iP_nodes.put(ip, str(d * 0.99));
    }
  }
  serial();
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
