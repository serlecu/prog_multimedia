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
      stat = LOW;
    }else if(stat == LOW){
      stat = HIGH;
    }
  } else{
    if(stat == HIGH){
      analogWrite(3,map(pot2val,0,1023,0,255));
      Serial.write(pot2val);
    }else if (stat == LOW){
      analogWrite(6,map(pot2val,0,1023,0,255));
      Serial.write(pot2val);
    }
}
  oldStat = push;
  /*if(push == LOW){
    analogWrite(3,map(pot2val,0,1023,0,255));
  } else if(push == HIGH){
    analogWrite(6,map(pot2val,0,1023,0,255));
  }*/
  
  Serial.println(stat);
}
