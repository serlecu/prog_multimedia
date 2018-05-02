/* -------
 Funcionamiento:
 el programa escanea la red wifi y lee las ip receceptoras de paquetes
 estas se imprimen a la iz. de la pantalla y se desplazan
 hacia la derecha hasta desparecer.
 las ip se deberán imprimir en la pantalla de forma que la 
 posición vertical haga referencia al número que ocupa en el array
 ------- */

import net.sourceforge.jpcap.capture.*;
import net.sourceforge.jpcap.net.*;
import net.sourceforge.jpcap.simulator.*;
import net.sourceforge.jpcap.util.*;
import org.rsg.carnivore.*;
import org.rsg.carnivore.cache.*;
import org.rsg.carnivore.net.*;

PFont font;
CarnivoreP5 meat;
ArrayList<IPs> ipes;
float x=10;
String oldMeatBox, meatBox = "start";
Boolean meatStatus = true;
int count;

void setup() {
  background(0);
  size(600, 800);
  font = loadFont("8bitOperatorPlus8-Regular-16.vlw");
  meat = new CarnivoreP5(this);
  ipes = new ArrayList<IPs>();
}

void packetEvent(CarnivorePacket p) {
  
  oldMeatBox = meatBox;
  
  meatBox = p.receiverSocket();
  
  
    if(oldMeatBox != meatBox) {
    meatStatus = true;
    count =count+1;
    println("true");
  }else if(oldMeatBox == meatBox){ 
    meatStatus = false;
    count =count-1;
    println("false");
  }
}

void draw() {
  
  for (int i = ipes.size()-1; i>=0; i--) {
    IPs ips = ipes.get(i);
    background(0);
    ips.display();
    ips.move();
    if (ips.delete()) {
      ipes.remove(i);
    }
  }
  if ( meatStatus == true) {
    ipes.add(new IPs(count, meatBox));
    println(meatBox + "  +  "+str(count)+"  +  "+str(x));
  }else if(meatStatus == false){
  }
}