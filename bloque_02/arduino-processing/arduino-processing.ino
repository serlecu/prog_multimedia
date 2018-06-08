#include <Servo.h>

Servo servo;

boolean tipo_servo =false;
int pos = 0;
int maxPos = 160;
int minPos = 0;
int dly = 200;

void setup(){
  Serial.begin(9600);
  servo.attach(6);
  if (tipo_servo ==false){ //paso a paso
      servo.write(0);   //check movimiento
  }
 

}

void loop(){
  if (tipo_servo ==false){      //paso paso
      for(pos =minPos;pos<=maxPos;pos++){
    servo.write(pos);
    delay(dly);
  }
  for(pos=maxPos;pos>=minPos;pos--){
    servo.write(pos);
    delay(dly);
  }
  Serial.println(pos);
  }else{          // contínuo
    servo.write(0);
    delay(1000);
    servo.write(255/2);
    delay(1000);
    servo.write(255);
    delay(1000);
  }

}

