// Date and time functions using a PCF8523 RTC connected via I2C and Wire lib
#include "RTClib.h"
#include <Arduino.h>
#include <TM1637Display.h>

// Module connection pins (Digital Pins)
#define CLK 2
#define DIO 3

TM1637Display display(CLK, DIO);


RTC_PCF8523 rtc;

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

void setup () {
  Serial.begin(57600);
  while (!Serial) { //wait for
    delay(1);
  }
  Serial.print("Wire Initialized!");

  if (! rtc.begin()) {
    Serial.println("Couldn't find RTC");
    while (1);
  }

  if (! rtc.initialized()) {
    Serial.println("RTC is NOT running!");
  }
  display.setBrightness(0x0f);
  display.clear();
}

void loop () {
  DateTime now = rtc.now();

  display.showNumberDecEx(now.hour(), 0b01000000, true, 2, 0);
  display.showNumberDecEx(now.minute(), 0b01000000, true, 2, 2);

  Serial.print(now.hour(), DEC);
  Serial.print(':');
  Serial.print(now.minute(), DEC);

  delay(750);

}
