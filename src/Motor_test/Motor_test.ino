const int enablePin = 5;
const int in1Pin = 4;

bool USB_Serial = true;
bool USB_wait = true;

void setup() {
  // put your setup code here, to run once:

  if (USB_Serial) {
    Serial.begin(9600);
    if (USB_wait) {
      while (!Serial) {
        delay(1);
      }
    }
    Serial.println("Beginning Motor Test");
  }
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(enablePin, OUTPUT);
  pinMode(in1Pin, OUTPUT);
  digitalWrite(enablePin, LOW);
  digitalWrite(in1Pin, LOW);
  digitalWrite(LED_BUILTIN, LOW);
  delay(500);
  for (int x = 0; x < 5; x++) {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(100);
    digitalWrite(LED_BUILTIN, LOW);
    delay(100);
  }
  delay(1000);
}

void loop() {
  // put your main code here, to run repeatedly:

  OnOff(10000, 1000, 1);
  delay(500);


}

void OnOff(int timeOn, int timeOff, int loops) {
  digitalWrite(enablePin, HIGH);
  for (int x = 0; x < loops; x++) {
    digitalWrite(in1Pin, HIGH);
    delay(timeOn);
    digitalWrite(in1Pin, LOW);
    delay(timeOff);
  }
  digitalWrite(enablePin, LOW);
}
