import netP5.*;
import oscP5.*;
import processing.serial.*;

Serial port;
OscP5 oscP5;
NetAddress dirRemote;


PrintWriter output;

int s1, s2;
void setup(){
  //println(Serial.list());
  port = new Serial(this, Serial.list()[2],9600);
  oscP5=new OscP5(this, 11112);
  dirRemote = new NetAddress("127.0.0.1",1112);
  size(400,400);
  
}
void draw(){
  background(255);
  OscMessage msg1 = new OscMessage("/msg1");
  
  if(port.available() > 0){
    //println(port.read()+" ");
    if(port.read() == '1'){
      //println(port.read());
      s1=int(port.read());
    }else if(port.read() == '2'){
      //println(port.read());
      s2=int(port.read());
    }
  }
  
  
  msg1.add(s1);
  oscP5.send(msg1,dirRemote);
  fill(0);
  ellipse(100,height/2,s1,s1);
  ellipse(300,height/2,s2,s2);
}