import net.sourceforge.jpcap.capture.*;
import net.sourceforge.jpcap.net.*;
import net.sourceforge.jpcap.simulator.*;
import net.sourceforge.jpcap.util.*;
import org.rsg.carnivore.*;
import org.rsg.carnivore.cache.*;
import org.rsg.carnivore.net.*;
//import org.rsg.lib.Log;

CarnivoreP5 c;

void setup(){
  size(720,460);
  
  //Log.setDebug(true); // Uncomment for verbose mode
  c = new CarnivoreP5(this);

}

void draw(){}
  
void packetEvent(CarnivorePacket p){
  println(p.dateStamp()+" > "+p.senderAddress);
}