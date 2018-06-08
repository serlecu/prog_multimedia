#include <CapacitiveSensor.h>

CapacitiveSensor   cap1 = CapacitiveSensor(2,3);        // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired
int freq;
int paso=0;


void setup()                    
{
   cap1.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1 - just as an example
   Serial.begin(9600);
   pinMode(4,OUTPUT);
   pinMode(3,INPUT);
}

void loop()                    
{
//  //CAPACITIVO
    long start = millis();
    long total1 =  cap1.capacitiveSensor(30);

    Serial.print(millis() - start);        // check on performance in milliseconds
    Serial.println(total1);                  // print sensor output 1  
    delay(10);                             // arbitrary delay to limit data to serial port 

    freq = int(total1);
//freq = map(analogRead(7),0,1023,0,2000);
    digitalWrite(4,HIGH);
    delayMicroseconds(freq);
    digitalWrite(4,LOW);
    delayMicroseconds(freq);

    Serial.println(freq);
}
