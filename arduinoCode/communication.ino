#include "dht.h"
#include <Servo.h> 
#include<SoftwareSerial.h> 
#define dht_apin A0
#define MQ2pin A4
 
dht DHT;
float sensorValue;
int Moisture_signal = A2;

void setup(){
  // bt.begin(9600);
  Serial.begin(9600);
  pinMode (3, OUTPUT);
  delay(500);
}
 
void loop(){

    int x = 0;
    x = Serial.readString().toInt();

    DHT.read11(dht_apin);
    int Moisture = analogRead(Moisture_signal);
    sensorValue = analogRead(MQ2pin);
    Serial.print("{\"Outval\":");
    Serial.print(x);
    Serial.print(",\"Temp\":");
    Serial.print( DHT.temperature);
    Serial.print(",\"Hum\":");
    Serial.print(DHT.humidity);
    Serial.print(",\"Moi\":");
    Serial.print(Moisture);
    Serial.print(",\"Smok\":");
    Serial.print(sensorValue);
    Serial.println("}");

    if(x==5){
      digitalWrite(3,HIGH);
    }
    else{
      digitalWrite(3,LOW);
    }

    delay(4000);   
}
