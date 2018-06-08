int sens = 0;

void setup() {
  Serial.begin(1200);
}

void loop() {
  sens = analogRead(5);
  Serial.println(sens);
  delay(100);

}
