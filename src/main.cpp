#include <Arduino.h>
#include <RTClib.h>
#include <LiquidCrystal.h>
#include <TM1637Display.h>

// Delay between loops (milliseconds)
#define LOOP_DELAY 20

// Length of LCD (characters)
#define LCD_LENGTH 16

// LCD refresh interval (milliseconds)
#define LCD_REFRESH_RATE 250

// Max length of scrolling info string
#define SCROLL_LENGTH 64

// How frequently (intervals of LCD_REFRESH_RATE) to scroll the text
#define SCROLL_RATE 4

// How frequently (intervals of LCD_REFRESH_RATE) to blink selections
#define BLINK_RATE 4

// Short press time threshold (milliseconds)
#define SHORT_PRESS_TIME 50

// Long press time threshold (milliseconds)
#define LONG_PRESS_TIME 1500

// Pins for LCD
#define LCD_RS  4
#define LCD_E   8
#define LCD_D4  5
#define LCD_D5  6
#define LCD_D6  12
#define LCD_D7  7

// Button Pins
#define LEFT_BUTTON_PIN     A1
#define MIDDLE_BUTTON_PIN   A2
#define RIGHT_BUTTON_PIN    A3
#define SNOOZE_BUTTON_PIN   1

// Buzzer Pin
#define BUZZER_PIN 3

// Motor Pin
#define MOTOR_PIN 2

// Seven Segment Display Pins
#define TM1637_CLK 11
#define TM1637_DIO 10

// Water Level Potentiometer Pin
#define WATER_SENSOR_PIN A6

// Water Level Warning LED Pin
#define WATER_LOW_LED_PIN 13

enum Page {
    STANDBY,
    SETTING_TIME,
    SETTING_DATE,
    SETTING_ALARM,
    SETTING_ALARM_DAYS
};

enum Press {
    NO_PRESS,
    SHORT_PRESS,
    LONG_PRESS
};

const char daysOfTheWeek[7] = {'S', 'M', 'T', 'W', 'R', 'F', 'S'};

LiquidCrystal lcd(LCD_RS, LCD_E, LCD_D4, LCD_D5, LCD_D6, LCD_D7);

// Current state for state machine in loop()
Page currState = STANDBY;

// Scrolling text on bottom row of 16x2 LCD
char scroll[SCROLL_LENGTH] = "";

// Real-time clock
RTC_PCF8523 rtc;

// Seven Segment Display
TM1637Display display(TM1637_CLK, TM1637_DIO);

// Alarm time
DateTime alarm(0, 0, 0, 0, 0, 0);

// Alarm set days
bool alarmDays[7] = {true, false, true, false, true, false, true};

// Represents selection number when setting day / time / alarm time / alarm days
uint8_t selection = 0;

// Represents # of loop calls
uint32_t loopCount = 0;

// Whether or not the alarm has been snoozed
bool snoozed = false;

// Whether or not alarm has rung
bool rang = false;

// Whether or not the water is low
bool waterLow = false;

// Draw a string centered within a row on the 16x2 LCD
void drawCentered(const char *str, uint8_t row) {
    uint8_t len = strlen(str);

    if (len > LCD_LENGTH) {
        return;
    }

    uint8_t startCol = (LCD_LENGTH / 2) - (len / 2);

    lcd.setCursor(startCol, row);
    lcd.print(str);
}

// Displays a time, centered
void drawCenteredTime(DateTime time, uint8_t row) {
    char buf[9];
    snprintf(buf, 9, "%02d:%02d:%02d", time.hour(), time.minute(), time.second());
    drawCentered(buf, row);
}

// Draws scrolling text
void drawScroll(const char *str, uint8_t row, uint16_t rate) {
    static uint16_t realOffset = 0;
    uint8_t offset = realOffset / rate;
    uint8_t len = strlen(str);

    char buf[LCD_LENGTH + 1];
    uint8_t pos = 0;
    pos = min(len - offset, LCD_LENGTH);
    strncpy(buf, &str[offset], pos);

    while (pos < (LCD_LENGTH)) {
        uint8_t nextLen = min((LCD_LENGTH) - pos, (int) len);
        strncpy(&buf[pos], str, nextLen);
        pos += nextLen;
    }
    buf[LCD_LENGTH] = '\0';

    lcd.setCursor(0, 1);
    lcd.print(buf);

    realOffset++;
    if (realOffset == (rate * len)) {
        realOffset = 0;
    }
}

void setScroll(char *str, DateTime now) {
    int pos = 0;

    snprintf(str, SCROLL_LENGTH, "%02d/%02d/%04d ALARM: %02d:%02d:%02d ", now.month(), now.day(), now.year(),
             alarm.hour(), alarm.minute(), alarm.second());
    pos = strlen(str);

    char *end = &str[pos];
    for (uint8_t i = 0; i < 7; i++) {
        if (alarmDays[i]) {
            if (((loopCount / (LCD_REFRESH_RATE / LOOP_DELAY)) % (2 * BLINK_RATE)) < BLINK_RATE) {
                *(end++) = daysOfTheWeek[i];
            } else {
                *(end++) = ' ';
            }
        } else {
            *(end++) = daysOfTheWeek[i];
        }
    }
    *end++ = ' ';
    *end = '\0';
}

Press getButtonPressState(uint8_t pin, bool on) {
    static uint16_t downFor[8] = {0, 0, 0, 0, 0, 0, 0, 0};

    uint8_t index = pin - A0;
    if (on == digitalRead(pin)) {
        downFor[index]++;
        // Goal is to only report press once. If you hold it down for longer
        // than required, it should have no effect.
        if (downFor[index] == (LONG_PRESS_TIME / LOOP_DELAY)) {
            return LONG_PRESS;
        }
    } else {
        uint16_t last = downFor[index];
        downFor[index] = 0;
        if ((last > (SHORT_PRESS_TIME / LOOP_DELAY)) && (last < (LONG_PRESS_TIME / LOOP_DELAY))) {
            return SHORT_PRESS;
        }
    }

    return NO_PRESS;
}

void setup() {
    pinMode(LEFT_BUTTON_PIN, INPUT_PULLUP);
    pinMode(MIDDLE_BUTTON_PIN, INPUT_PULLUP);
    pinMode(RIGHT_BUTTON_PIN, INPUT_PULLUP);
    pinMode(SNOOZE_BUTTON_PIN, INPUT_PULLUP);

    pinMode(BUZZER_PIN, OUTPUT);

    pinMode(WATER_LOW_LED_PIN, OUTPUT);

    pinMode(MOTOR_PIN, OUTPUT);
    digitalWrite(MOTOR_PIN, LOW);

    if (!rtc.begin()) {
        exit(0);
    }

    if (!rtc.initialized()) {
        exit(0);
    }

    lcd.begin(16, 2);

    display.setBrightness(0x0f);
    display.clear();
}

void loop() {
    DateTime now = rtc.now();

    // Reset alarm
    if ((now.hour() == 0) && (now.minute() == 0) && (now.second() == 0) && rang) {
        rang = false;
    }
    uint32_t loopStart = millis();

    Press lButton = getButtonPressState(LEFT_BUTTON_PIN, true);
    Press mButton = getButtonPressState(MIDDLE_BUTTON_PIN, true);
    Press rButton = getButtonPressState(RIGHT_BUTTON_PIN, true);
    Press sButton = getButtonPressState(SNOOZE_BUTTON_PIN, false);

    // Update selection
    if (mButton == SHORT_PRESS) {
        uint8_t selectionMax = 0;
        switch (currState) {
            case STANDBY:
                selectionMax = 0;
                break;
            case SETTING_ALARM_DAYS:
                selectionMax = 5;
                break;
            case SETTING_TIME:
            case SETTING_DATE:
            case SETTING_ALARM:
            default:
                selectionMax = 2;
                break;
        }

        if (selection < selectionMax) {
            selection++;
        } else {
            selection = 0;
        }
    } else if (mButton == LONG_PRESS) { // Switch Page
        switch (currState) {
            case STANDBY:
            case SETTING_TIME:
            case SETTING_DATE:
            case SETTING_ALARM:
                currState = (Page) (((uint8_t) currState) + 1);
                break;
            case SETTING_ALARM_DAYS:
            default:
                currState = STANDBY;
                break;
        }
        selection = 0; // Reset selection when switching page.
    }

    // Page State Machine
    switch (currState) {
        case STANDBY: {
            if ((loopCount % (LCD_REFRESH_RATE / LOOP_DELAY)) == 0) {
                setScroll(scroll, now);

                lcd.clear();
                drawCenteredTime(now, 0);
                drawScroll(scroll, 1, SCROLL_RATE);
            }
            break;
        }
        case SETTING_TIME: {
            if ((lButton != NO_PRESS) || (rButton != NO_PRESS)) {
                int8_t dir = (rButton != NO_PRESS) - (lButton != NO_PRESS);

                switch (selection) {
                    case 0:
                        rtc.adjust(now + TimeSpan(0, dir, 0, 0));
                        break;
                    case 1:
                        rtc.adjust(now + TimeSpan(0, 0, dir, 0));
                        break;
                    case 2:
                        rtc.adjust(now + TimeSpan(0, 0, 0, dir));
                        break;
                    default:
                        break;
                }
            }

            if ((loopCount % (LCD_REFRESH_RATE / LOOP_DELAY)) == 0) {
                lcd.clear();
                drawCenteredTime(now, 0);
                drawCentered("TIME", 1);

                lcd.setCursor(5 + selection * 3, 0);
                lcd.blink();
            }
            break;
        }
        case SETTING_DATE: {
            if ((lButton != NO_PRESS) || (rButton != NO_PRESS)) {
                int8_t dir = (rButton != NO_PRESS) - (lButton != NO_PRESS);

                switch (selection) {
                    case 0: {
                        uint16_t year = now.year();
                        uint16_t month = now.month();
                        if ((month == 12) && (dir == 1)) {
                            year++;
                            month = 1;
                        } else if ((month == 1) && (dir == -1)) {
                            year--;
                            month = 12;
                        } else {
                            month += dir;
                        }
                        rtc.adjust(DateTime(year, month, now.day(), now.hour(), now.minute(), now.second()));
                        break;
                    }
                    case 1:
                        rtc.adjust(now + TimeSpan(dir, 0, 0, 0));
                        break;
                    case 2: {
                        uint16_t year = now.year();
                        if ((year == 9999) && (dir == 1)) {
                            year = 0;
                        } else if ((year == 0) && (dir == -1)) {
                            year = 9999;
                        } else {
                            year += dir;
                        }
                        rtc.adjust(DateTime(year, now.month(), now.day(), now.hour(), now.minute(), now.second()));
                        break;
                    }
                    default:
                        break;
                }
            }

            if ((loopCount % (LCD_REFRESH_RATE / LOOP_DELAY)) == 0) {
                char buf[11];
                snprintf(buf, 11, "%02d/%02d/%04d ", now.month(), now.day(), now.year());

                lcd.clear();
                drawCentered(buf, 0);
                drawCentered("DATE", 1);

                if (selection < 2) {
                    lcd.setCursor(4 + selection * 3, 0);
                } else {
                    lcd.setCursor(12, 0);
                }
                lcd.blink();
            }
            break;
        }
        case SETTING_ALARM: {
            if ((lButton != NO_PRESS) || (rButton != NO_PRESS)) {
                rang = false;
                int8_t dir = ((int8_t) (rButton != NO_PRESS)) - ((int8_t) (lButton != NO_PRESS));

                switch (selection) {
                    case 0:
                        alarm = alarm + TimeSpan(0, dir, 0, 0);
                        break;
                    case 1:
                        alarm = alarm + TimeSpan(0, 0, dir, 0);
                        break;
                    case 2:
                        alarm = alarm + TimeSpan(0, 0, 0, dir);
                        break;
                    default:
                        break;
                }
            }

            if ((loopCount % (LCD_REFRESH_RATE / LOOP_DELAY)) == 0) {
                lcd.clear();
                drawCenteredTime(alarm, 0);
                drawCentered("ALARM TIME", 1);

                lcd.setCursor(5 + selection * 3, 0);
                lcd.blink();
            }
            break;
        }
        case SETTING_ALARM_DAYS: {
            if (rButton != NO_PRESS) {
                alarmDays[selection] = true;
            } else if (lButton != NO_PRESS) {
                alarmDays[selection] = false;
            }

            if ((loopCount % (LCD_REFRESH_RATE / LOOP_DELAY)) == 0) {
                char dayBuf[14] = "             ";
                for (uint8_t i = 0; i < 7; i++) {
                    if (alarmDays[i]) {
                        if (((loopCount / (LCD_REFRESH_RATE / LOOP_DELAY)) % (2 * BLINK_RATE)) < BLINK_RATE) {
                            dayBuf[i * 2] = daysOfTheWeek[i];
                        }
                    } else {
                        dayBuf[i * 2] = daysOfTheWeek[i];
                    }
                }

                lcd.clear();
                drawCentered(dayBuf, 0);
                drawCentered("ALARM DAYS", 1);

                lcd.setCursor(2 + selection * 2, 0);
                lcd.blink();
            }
            break;
        }
        default:
            break;
    }

    // Alarm Ring Handling
    if (alarmDays[now.dayOfTheWeek()]) {
        TimeSpan diff = alarm - now;
        if (diff.hours() == 0 && !rang) {
            int16_t secs = (diff.minutes() * 60) + diff.seconds();
            static bool notified = false;

            if (secs <= 60 && !notified) {
                tone(BUZZER_PIN, 1000, 250);
                notified = true;
            }

            if ((secs <= 60) && (secs > 0)) {
                if ((sButton == LONG_PRESS) && !snoozed) {
                    snoozed = true;
                    notified = false;
                    tone(BUZZER_PIN, 1000, 500);
                    alarm = alarm + TimeSpan(0, 0, 5, 0);
                }
            }

            if ((secs <= 5) && (secs > 0)) {
                static uint8_t counted = 6;

                if (counted != secs) {
                    tone(BUZZER_PIN, 1000, 500);
                    counted = secs;
                }
            }

            if (secs <= 0) {
                static bool motorEnabled = false;
                tone(BUZZER_PIN, 1250, 20);

                if (!motorEnabled && !waterLow) {
                    digitalWrite(MOTOR_PIN, HIGH);
                    motorEnabled = true;
                } else if (motorEnabled && waterLow) {
                    digitalWrite(MOTOR_PIN, LOW);
                    motorEnabled = false;
                }

            }

            if (secs <= -5) {
                rang = true;
                snoozed = false;
                digitalWrite(MOTOR_PIN, LOW);
            }

            if (secs > 0) {
                display.showNumberDecEx(diff.minutes(), 0b01000000, true, 2, 0);
                display.showNumberDecEx(diff.seconds(), 0b01000000, true, 2, 2);
            } else if (!rang) {
                display.showNumberDecEx(0, 0b01000000, true, 2, 0);
                display.showNumberDecEx(0, 0b01000000, true, 2, 2);
            } else {
                display.clear();
            }
        }
    }

    // Water Level Sensing
    int16_t sensorValue = analogRead(WATER_SENSOR_PIN);
    if ((sensorValue >= 600) && (sensorValue <= 800)) {
        digitalWrite(WATER_LOW_LED_PIN, HIGH);
    } else if (!waterLow) {
        digitalWrite(WATER_LOW_LED_PIN, LOW);
        waterLow = true;
    }

    // If the loop has taken less than 20 milliseconds, delay so that it takes 20.
    loopCount++;
    uint32_t loopTime = millis() - loopStart;
    if (loopTime < LOOP_DELAY) {
        delay(LOOP_DELAY - loopTime);
    }
}
