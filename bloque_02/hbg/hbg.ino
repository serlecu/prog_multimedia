void setup() {
  Serial.begin(9600);
  pinMode(10,OUTPUT);
}

void loop() {
//    analogWrite(10,100);

    
  for(int i=0;i<=255; i++){
    analogWrite(10,i);
    delay(10);
    Serial.print("i = ");
    Serial.println(i);
  }
  for(int j=255;j>=0; j--){
    analogWrite(10,j);
    delay(10);
    Serial.print("j = ");
    Serial.println(j);
  }
}
