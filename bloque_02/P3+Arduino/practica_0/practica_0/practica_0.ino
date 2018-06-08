int pot1val,pot2val;
int push = 0;

int stat = HIGH;
int oldStat = LOW;

long tim = 0;
long debounce = 200;

void setup() {
  Serial.begin(9600);
  pinMode(3,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(2,INPUT);
}

void loop() {
  pot1val = analogRead(5);
  pot2val = analogRead(4);
  push = digitalRead(2);

  if(push == HIGH && oldStat == LOW && millis() - tim > debounce){
    if(stat == HIGH){
      Serial.write("1");
      Serial.write(map(pot2val,0,1023,0,255));
      stat = LOW;
    }else if(stat == LOW){
      Serial.write("2");
      Serial.write(map(pot2val,0,1023,0,255));
      stat = HIGH;
    }
  } else{
    if(stat == HIGH){
      analogWrite(3,map(pot2val,0,1023,0,255)); 
    }else if (stat == LOW){
      analogWrite(6,map(pot2val,0,1023,0,255)); 
    }
}
  oldStat = push;
  /*if(push == LOW){
    analogWrite(3,map(pot2val,0,1023,0,255));
  } else if(push == HIGH){
    analogWrite(6,map(pot2val,0,1023,0,255));
  }*/
  //Serial.write(stat,DEC);
  //Serial.println(stat);
}
