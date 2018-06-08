#include <Ultrasonido.h>
#include <SoftwareSerial.h>

Ultrasonido ultrasonido(5,4,350);
int dist;
long timeOld = 0, timeNew, timeDif;

int s; //serial

void setup() {
  Serial.begin(57600);
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);

}

void loop() {
  timeNew = millis();
  timeDif = timeNew - timeOld;
  
  if(timeDif >= 1500){
    dist = ultrasonido.Distancia();
    Serial.write(dist);
    Serial.write('/ln');
    timeOld = timeNew;
  }

  while (Serial.available()){
    
    if(Serial.read() == 'a'){
      digitalWrite(2,HIGH);
    }
   if(Serial.read() == 'b'){
     digitalWrite(2,LOW);
   }
   
   if(Serial.read() == 'c'){
      digitalWrite(3,HIGH);
   }
   if(Serial.read() == 'd'){
     digitalWrite(3,LOW);
   }
  }
}

