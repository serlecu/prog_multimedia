/* -------
 objetivo: que las ip se escriban en la pantalla
 y que se desplacen de izq a derecha. 
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
int y=height/2;
float x=0;
String oldMeatBox, meatBox = "start";
Boolean meatStatus = true;

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
  if (oldMeatBox != meatBox) {
    meatStatus = true;
  } else { 
    meatStatus = false;
  }
}

void draw() {
  for (int i = ipes.size()-1; i>=0; i--) {
    IPs ips = ipes.get(i);
    //y = 5*(ipes.size());
    if (ips.delete()) {
      ipes.remove(i);
    }
  }
  if ( meatStatus == true) {
    ipes.add(new IPs(x, y, meatBox));
    println(meatBox + "  +  "+str(y)+"  +  "+str(x));
    fill(255);
    text(meatBox, x, y);
  }
}