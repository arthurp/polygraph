/*
Based on example:
 created 29 Dec. 2008
 by Tom Igoe
 
 Modified by Arthur Peters for polygraph data acquisition.

 */


#include "Arduino.h"

void setup();
void sendNumber(int v);
void sendNumberLong(long v);
void loop();
static const int analogInPin = 0;  // Analog input pin that the potentiometer is attached to
static const uint8_t BT_STATUS = 2;


int sensor1Value = 0;        // value read from the pot
int sensor1ValuePrev = 0;        // value read from the pot
int sensor2Value = 0;        // value read from the pot
int sensor3Value = 0;        

void setup() {
  // initialize serial communications at 9600 bps:
  //Serial.begin(9600);
  analogReference(DEFAULT);
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);


  pinMode(BT_STATUS, INPUT);
  pinMode(LED_BUILTIN, OUTPUT);

  Serial.begin(9600);
}

void sendNumber(int v) {
  Serial.write(v & 0xff);
  Serial.write((v>>8) & 0xff);
}

void sendNumberLong(long v) {
  Serial.write(v & 0xff);
  Serial.write((v>>8) & 0xff);
  Serial.write((v>>16) & 0xff);
  Serial.write((v>>24) & 0xff);
}

void loop() {
  // read the analog in value:
  sensor1Value = analogRead(analogInPin);            
  sensor2Value = analogRead(analogInPin+1);            
  sensor3Value = analogRead(analogInPin+2);            
  // map it to the range of the analog out:
  //outputValue = map(sensorValue, 0, 1023, 0, 255);  
  // change the analog out value:
  //analogWrite(analogOutPin, outputValue);           

  // print the results to the serial monitor:
  //Serial.print("sensor = " );
  if( 1 ) {
	  sendNumber(0xbeaf);
	  long t = micros();
	  sendNumberLong(t);
	  sendNumber(sensor1Value);
	  sendNumber(sensor2Value);
	  sendNumber(sensor3Value);
	  sendNumber(t + sensor1Value + sensor2Value + sensor3Value); // Compute and send simple checksum
	  Serial.flush();
  } else if (1) {
	  Serial.print(micros());
	  Serial.print(" ");
	  Serial.print(sensor1Value);
	  Serial.print(" ");
	  //Serial.print(sensor1ValuePrev < sensor1Value);
	  //Serial.print(" ");
	  Serial.print(sensor2Value);
	  Serial.print(" ");
	  Serial.print(sensor3Value);
	  Serial.println();
  }
  
  digitalWrite(LED_BUILTIN, sensor1ValuePrev < sensor1Value ? HIGH : LOW);
  
  sensor1ValuePrev = sensor1Value;

  // wait 10 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(10);
}

int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

