
#include "Arduino.h"
#include "avr/io.h"


static const uint8_t BT_STATUS = 2;

unsigned int timeout = 0;
unsigned char state = 0;
ISR(TIMER2_OVF_vect)
{
	TCNT2 = 0;
	timeout++;
	if (timeout>61)
	{
		state=1;
		timeout=0;
	}
//Timer2 Service
}
void init_timer2(void) {
	TCCR2A |= (1 << WGM21) | (1 << WGM20);
	TCCR2B |= 0x07; // by clk/1024
	ASSR |= (0 << AS2);

// Use internal clock - external clock not used in Arduino
	TIMSK2 |= 0x01; //Timer2 Overflow Interrupt Enable
	TCNT2 = 0;
	sei();
}

void cleantime() {
	timeout = 0;
	state = 0;
}

void setup() {

	Serial.begin(9600);
	pinMode(BT_STATUS, INPUT);
	pinMode(13, OUTPUT);
	attachInterrupt(0, cleantime, FALLING); // listen to pin 2 for "connected" flag
#if 0
	init_timer2();
#else
	//sei();
	//delay(1000);
	//state = 1;
#endif
}

void loop() {
	switch (state) {
	case 0:
		digitalWrite(13, LOW);
		delay(100);
		//state = 1;
		break;
	case 1:
		digitalWrite(13, HIGH);
		Serial.print("Hellow BT");
		Serial.write(Serial.read());
		Serial.write('\n');
		Serial.flush();
		delay(1000);
		break;
	}

}



int main(void)
{
	init();

	setup();

	for (;;)
		loop();

	return 0;
}


