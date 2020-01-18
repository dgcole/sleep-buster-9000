int sensorPin = A6;    // select the input pin for the potentiometer
int ledPin = 13;      // select the pin for the LED
int sensorValue = 0;  // variable to store the value coming from the sensor

void setup() {
  Serial.begin(9600);

  // declare the ledPin as an OUTPUT:
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // read the value from the sensor:
  sensorValue = analogRead(sensorPin);
  Serial.print("A6: ");
  Serial.print(sensorValue);
  if (sensorValue >= 600 && sensorValue <= 800) { //if within expected values for water
    digitalWrite(ledPin, HIGH); //set LED high
    //or whatever do when water present
  }
  else { //else water is not present (ran out of water)
    digitalWrite(ledPin, LOW); //turn off LED
    //or whatever want to do when water not present (turn off motor and set blue LED to be blinking)
  }
  delay(250);

}
