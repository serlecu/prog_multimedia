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
  }else if(oldMeatBox == meatBox){ 
    meatStatus = false;
    count =count-1;
  }
}

void draw() {
  
  for (int i = ipes.size()-1; i>=0; i--) {
    IPs ips = ipes.get(i);
    background(0);
    ips.display();
    ips.move();
    //y = 5*(ipes.size());
    if (ips.delete()) {
      ipes.remove(i);
    }
  }
  if ( meatStatus == true) {
    ipes.add(new IPs(x, count, meatBox));
    println(meatBox + "  +  "+str(count)+"  +  "+str(x));

    //fill(255);
    //text(meatBox, x, y);
  }else if(meatStatus == false){
  }
}