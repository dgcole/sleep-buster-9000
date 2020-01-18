EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 9950 900  0    50   ~ 0
SDA
Text Label 9950 1000 0    50   ~ 0
SCL
Text Notes 10400 750  0    50   ~ 0
Available PWM Pins
Text Label 10800 850  2    50   ~ 0
D3
Text Label 10800 950  2    50   ~ 0
D5
Text Label 10800 1050 2    50   ~ 0
D6
Text Label 10800 1150 2    50   ~ 0
D9
Text Label 10800 1250 2    50   ~ 0
D10
Text Label 10800 1350 2    50   ~ 0
D11
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5E226AC7
P 5250 3600
F 0 "A?" H 5250 2250 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5250 2150 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5400 2650 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5250 2600 50  0001 C CNN
	1    5250 3600
	1    0    0    -1  
$EndComp
Text Label 9750 900  2    50   ~ 0
A4
Text Label 9750 1000 2    50   ~ 0
A5
Wire Wire Line
	9750 900  9950 900 
Wire Wire Line
	9750 1000 9950 1000
Text Notes 9750 750  0    50   ~ 0
I2C Pins
Text Notes 600  650  0    50   ~ 0
RTC Pin Requirements
Text Notes 1700 650  0    50   ~ 0
Piezo Pin Requirements
Text Notes 1950 850  0    50   ~ 0
x1 PWM\nGND
Text Notes 900  1000 0    50   ~ 0
Vcc\nGND\nSDA\nSCL
Text Notes 2850 650  0    50   ~ 0
RGB LED
Text Notes 2850 850  0    50   ~ 0
x3 PWM\nGND
Text Notes 3450 650  0    50   ~ 0
L293D Motor Driver
Text Notes 3500 1100 0    50   ~ 0
5V logic pwoer\n13V motor power\nx1 Digital (Enable)\nx1 Digital (Input)\nGND\n
Text Notes 4450 650  0    50   ~ 0
Buttons (left, right, select, snooze)
Text Notes 4850 750  0    50   ~ 0
x4 Digital I/O
Text Notes 6200 600  0    50   ~ 0
16x2 LCD
Text Notes 6250 950  0    50   ~ 0
x6 I/O\nx3 5V\nx3 GND\nx1 Backlight analog
Text Notes 7400 750  0    50   ~ 0
Rariable Resistor\nx1 Analog
$Comp
L Timer_RTC:AdafruitPCF8523 U?
U 1 1 5E22BA51
P 10100 2200
F 0 "U?" H 10250 2600 50  0000 L CNN
F 1 "AdafruitPCF8523" H 9950 2500 50  0000 L CNN
F 2 "" H 10100 2200 50  0001 C CNN
F 3 "" H 10100 2200 50  0001 C CNN
	1    10100 2200
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M?
U 1 1 5E22D242
P 2900 5400
F 0 "M?" H 3058 5396 50  0000 L CNN
F 1 "Motor_DC" H 3058 5305 50  0000 L CNN
F 2 "" H 2900 5310 50  0001 C CNN
F 3 "~" H 2900 5310 50  0001 C CNN
	1    2900 5400
	1    0    0    -1  
$EndComp
$Comp
L Driver_Motor:L293D U?
U 1 1 5E22ECB8
P 1900 5700
F 0 "U?" H 1450 6800 50  0000 C CNN
F 1 "L293D" H 1450 6700 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2150 4950 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 1600 6400 50  0001 C CNN
	1    1900 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E23350A
P 10000 2100
F 0 "#PWR?" H 10000 1850 50  0001 C CNN
F 1 "GND" V 10005 1972 50  0000 R CNN
F 2 "" H 10000 2100 50  0001 C CNN
F 3 "" H 10000 2100 50  0001 C CNN
	1    10000 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 2100 10000 2100
NoConn ~ 10100 2500
$Comp
L power:+5V #PWR?
U 1 1 5E2357ED
P 10000 2200
F 0 "#PWR?" H 10000 2050 50  0001 C CNN
F 1 "+5V" V 10015 2328 50  0000 L CNN
F 2 "" H 10000 2200 50  0001 C CNN
F 3 "" H 10000 2200 50  0001 C CNN
	1    10000 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10000 2200 10100 2200
Text Label 10000 2300 2    50   ~ 0
A4
Text Label 10000 2400 2    50   ~ 0
A3
Wire Wire Line
	10000 2300 10100 2300
Wire Wire Line
	10100 2400 10000 2400
Text Label 5850 3900 0    50   ~ 0
SCL
Text Label 5850 4000 0    50   ~ 0
SDA
Wire Wire Line
	5850 3900 5750 3900
Wire Wire Line
	5750 4000 5850 4000
$Comp
L power:+5V #PWR?
U 1 1 5E236E40
P 5450 2450
F 0 "#PWR?" H 5450 2300 50  0001 C CNN
F 1 "+5V" H 5465 2623 50  0000 C CNN
F 2 "" H 5450 2450 50  0001 C CNN
F 3 "" H 5450 2450 50  0001 C CNN
	1    5450 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E23797A
P 5350 2350
F 0 "#PWR?" H 5350 2200 50  0001 C CNN
F 1 "+3.3V" H 5365 2523 50  0000 C CNN
F 2 "" H 5350 2350 50  0001 C CNN
F 3 "" H 5350 2350 50  0001 C CNN
	1    5350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2450 5450 2600
Wire Wire Line
	5350 2600 5350 2350
$Comp
L power:+12V #PWR?
U 1 1 5E238C6C
P 5150 2500
F 0 "#PWR?" H 5150 2350 50  0001 C CNN
F 1 "+12V" H 5165 2673 50  0000 C CNN
F 2 "" H 5150 2500 50  0001 C CNN
F 3 "" H 5150 2500 50  0001 C CNN
	1    5150 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2500 5150 2600
$Comp
L power:GND #PWR?
U 1 1 5E239C97
P 5300 4700
F 0 "#PWR?" H 5300 4450 50  0001 C CNN
F 1 "GND" H 5305 4527 50  0000 C CNN
F 2 "" H 5300 4700 50  0001 C CNN
F 3 "" H 5300 4700 50  0001 C CNN
	1    5300 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4600 5250 4650
Wire Wire Line
	5250 4650 5300 4650
Wire Wire Line
	5300 4650 5300 4700
Wire Wire Line
	5300 4650 5350 4650
Wire Wire Line
	5350 4650 5350 4600
Connection ~ 5300 4650
$Comp
L Device:Buzzer BZ?
U 1 1 5E23C372
P 7250 1750
F 0 "BZ?" H 7402 1779 50  0000 L CNN
F 1 "Buzzer" H 7402 1688 50  0000 L CNN
F 2 "" V 7225 1850 50  0001 C CNN
F 3 "~" V 7225 1850 50  0001 C CNN
	1    7250 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E23D59E
P 7050 1850
F 0 "#PWR?" H 7050 1600 50  0001 C CNN
F 1 "GND" V 7055 1722 50  0000 R CNN
F 2 "" H 7050 1850 50  0001 C CNN
F 3 "" H 7050 1850 50  0001 C CNN
	1    7050 1850
	0    1    1    0   
$EndComp
Text Label 7050 1650 2    50   ~ 0
D3
Wire Wire Line
	7050 1650 7150 1650
Wire Wire Line
	7150 1850 7050 1850
Text Label 4600 3300 2    50   ~ 0
D3
Wire Wire Line
	4600 3300 4750 3300
$Comp
L power:GND #PWR?
U 1 1 5E23EACF
P 1900 6600
F 0 "#PWR?" H 1900 6350 50  0001 C CNN
F 1 "GND" H 1905 6427 50  0000 C CNN
F 2 "" H 1900 6600 50  0001 C CNN
F 3 "" H 1900 6600 50  0001 C CNN
	1    1900 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6500 1700 6550
Wire Wire Line
	1700 6550 1800 6550
Wire Wire Line
	1900 6550 1900 6600
Wire Wire Line
	1800 6500 1800 6550
Connection ~ 1800 6550
Wire Wire Line
	1800 6550 1900 6550
Wire Wire Line
	2000 6500 2000 6550
Wire Wire Line
	2000 6550 1900 6550
Connection ~ 1900 6550
Wire Wire Line
	2100 6500 2100 6550
Wire Wire Line
	2100 6550 2000 6550
Connection ~ 2000 6550
NoConn ~ 1400 5700
NoConn ~ 1400 5900
NoConn ~ 1400 6100
NoConn ~ 2400 5900
NoConn ~ 2400 5700
NoConn ~ 2400 5300
NoConn ~ 1400 5300
$Comp
L power:GND #PWR?
U 1 1 5E2462A2
P 2900 5800
F 0 "#PWR?" H 2900 5550 50  0001 C CNN
F 1 "GND" H 2905 5627 50  0000 C CNN
F 2 "" H 2900 5800 50  0001 C CNN
F 3 "" H 2900 5800 50  0001 C CNN
	1    2900 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 5800 2900 5700
Wire Wire Line
	2900 5200 2900 5100
Wire Wire Line
	2900 5100 2400 5100
Text Label 1200 5100 2    50   ~ 0
D2
Wire Wire Line
	1200 5100 1400 5100
$Comp
L power:+5V #PWR?
U 1 1 5E247C86
P 1800 4500
F 0 "#PWR?" H 1800 4350 50  0001 C CNN
F 1 "+5V" H 1815 4673 50  0000 C CNN
F 2 "" H 1800 4500 50  0001 C CNN
F 3 "" H 1800 4500 50  0001 C CNN
	1    1800 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5E248C81
P 2000 4600
F 0 "#PWR?" H 2000 4450 50  0001 C CNN
F 1 "+12V" H 2015 4773 50  0000 C CNN
F 2 "" H 2000 4600 50  0001 C CNN
F 3 "" H 2000 4600 50  0001 C CNN
	1    2000 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4500 1800 4700
Wire Wire Line
	2000 4600 2000 4700
$Comp
L Device:R_POT RV?
U 1 1 5E24BF8F
P 8200 2950
F 0 "RV?" H 8130 2904 50  0000 R CNN
F 1 "R_POT" H 8130 2995 50  0000 R CNN
F 2 "" H 8200 2950 50  0001 C CNN
F 3 "~" H 8200 2950 50  0001 C CNN
	1    8200 2950
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E24D0D5
P 8200 2700
F 0 "#PWR?" H 8200 2550 50  0001 C CNN
F 1 "+5V" H 8215 2873 50  0000 C CNN
F 2 "" H 8200 2700 50  0001 C CNN
F 3 "" H 8200 2700 50  0001 C CNN
	1    8200 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E24F98B
P 8200 3200
F 0 "#PWR?" H 8200 2950 50  0001 C CNN
F 1 "GND" H 8205 3027 50  0000 C CNN
F 2 "" H 8200 3200 50  0001 C CNN
F 3 "" H 8200 3200 50  0001 C CNN
	1    8200 3200
	1    0    0    -1  
$EndComp
Text Label 5850 3600 0    50   ~ 0
A0
Text Label 7950 2950 2    50   ~ 0
A0
Wire Wire Line
	8050 2950 7950 2950
Wire Wire Line
	8200 2800 8200 2700
Wire Wire Line
	8200 3200 8200 3100
Wire Wire Line
	5850 3600 5750 3600
Text Label 4600 3200 2    50   ~ 0
D2
Wire Wire Line
	4600 3200 4750 3200
$Comp
L Switch:SW_SPST SW?
U 1 1 5E255C44
P 1500 2450
F 0 "SW?" H 1500 2593 50  0000 C CNN
F 1 "~" H 1500 2594 50  0000 C CNN
F 2 "" H 1500 2450 50  0001 C CNN
F 3 "~" H 1500 2450 50  0001 C CNN
	1    1500 2450
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 5E256A13
P 1500 2750
F 0 "SW?" H 1500 2893 50  0000 C CNN
F 1 "~" H 1500 2894 50  0000 C CNN
F 2 "" H 1500 2750 50  0001 C CNN
F 3 "~" H 1500 2750 50  0001 C CNN
	1    1500 2750
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 5E256F6E
P 1500 2150
F 0 "SW?" H 1500 2293 50  0000 C CNN
F 1 "~" H 1500 2294 50  0000 C CNN
F 2 "" H 1500 2150 50  0001 C CNN
F 3 "~" H 1500 2150 50  0001 C CNN
	1    1500 2150
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 5E2575AA
P 1500 1850
F 0 "SW?" H 1500 1993 50  0000 C CNN
F 1 "~" H 1500 1994 50  0000 C CNN
F 2 "" H 1500 1850 50  0001 C CNN
F 3 "~" H 1500 1850 50  0001 C CNN
	1    1500 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E257C09
P 2000 2300
F 0 "#PWR?" H 2000 2050 50  0001 C CNN
F 1 "GND" V 2005 2172 50  0000 R CNN
F 2 "" H 2000 2300 50  0001 C CNN
F 3 "" H 2000 2300 50  0001 C CNN
	1    2000 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 1850 1850 1850
Wire Wire Line
	1850 1850 1850 2150
Wire Wire Line
	1850 2300 2000 2300
Connection ~ 1850 2150
Wire Wire Line
	1850 2150 1850 2300
Wire Wire Line
	1700 2450 1850 2450
Wire Wire Line
	1850 2450 1850 2300
Connection ~ 1850 2300
Wire Wire Line
	1700 2750 1850 2750
Wire Wire Line
	1850 2750 1850 2450
Connection ~ 1850 2450
Wire Wire Line
	1700 2150 1850 2150
Text Label 1150 1850 2    50   ~ 0
A1
Text Label 1150 2150 2    50   ~ 0
A2
Text Label 1150 2450 2    50   ~ 0
A5
Text Label 1150 2750 2    50   ~ 0
A6
Wire Wire Line
	1150 1850 1300 1850
Wire Wire Line
	1300 2150 1150 2150
Wire Wire Line
	1150 2450 1300 2450
Wire Wire Line
	1150 2750 1300 2750
Text Label 5850 3700 0    50   ~ 0
A1
Text Label 5850 3800 0    50   ~ 0
A2
Text Label 5850 4100 0    50   ~ 0
A5
Text Label 5850 4200 0    50   ~ 0
A6
Wire Wire Line
	5850 3700 5750 3700
Wire Wire Line
	5750 3800 5850 3800
Wire Wire Line
	5850 4100 5750 4100
Wire Wire Line
	5750 4200 5850 4200
$Comp
L Display_Character:RC1602A U?
U 1 1 5E26958F
P 5350 6700
F 0 "U?" H 5600 7500 50  0000 C CNN
F 1 "RC1602A" H 5600 7400 50  0000 C CNN
F 2 "Display:RC1602A" H 5450 5900 50  0001 C CNN
F 3 "http://www.raystar-optronics.com/down.php?ProID=18" H 5450 6600 50  0001 C CNN
	1    5350 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E26BA34
P 5350 5900
F 0 "#PWR?" H 5350 5750 50  0001 C CNN
F 1 "+5V" H 5365 6073 50  0000 C CNN
F 2 "" H 5350 5900 50  0001 C CNN
F 3 "" H 5350 5900 50  0001 C CNN
	1    5350 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5900 5350 6000
$Comp
L power:GND #PWR?
U 1 1 5E26D77A
P 5350 7550
F 0 "#PWR?" H 5350 7300 50  0001 C CNN
F 1 "GND" H 5355 7377 50  0000 C CNN
F 2 "" H 5350 7550 50  0001 C CNN
F 3 "" H 5350 7550 50  0001 C CNN
	1    5350 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 7550 5350 7400
$Comp
L Device:R_POT RV?
U 1 1 5E26F411
P 6350 6500
F 0 "RV?" H 6280 6454 50  0000 R CNN
F 1 "R_POT" H 6280 6545 50  0000 R CNN
F 2 "" H 6350 6500 50  0001 C CNN
F 3 "~" H 6350 6500 50  0001 C CNN
	1    6350 6500
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E2709C1
P 6350 6250
F 0 "#PWR?" H 6350 6100 50  0001 C CNN
F 1 "+5V" H 6365 6423 50  0000 C CNN
F 2 "" H 6350 6250 50  0001 C CNN
F 3 "" H 6350 6250 50  0001 C CNN
	1    6350 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E271469
P 6350 6750
F 0 "#PWR?" H 6350 6500 50  0001 C CNN
F 1 "GND" H 6355 6577 50  0000 C CNN
F 2 "" H 6350 6750 50  0001 C CNN
F 3 "" H 6350 6750 50  0001 C CNN
	1    6350 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 6750 6350 6650
Wire Wire Line
	6350 6350 6350 6250
Text Label 4800 6200 2    50   ~ 0
D4
Wire Wire Line
	4800 6200 4950 6200
Text Label 4600 3400 2    50   ~ 0
D4
Wire Wire Line
	4600 3400 4750 3400
Text Label 4800 6300 2    50   ~ 0
D7
Wire Wire Line
	4800 6300 4950 6300
Text Label 4600 3700 2    50   ~ 0
D7
Wire Wire Line
	4600 3700 4750 3700
Text Notes 5150 5650 0    50   ~ 0
16x2 Char LCD
Text Notes 5100 2050 0    50   ~ 0
Arduino Nano
Text Notes 7100 1500 0    50   ~ 0
Buzzer
Text Notes 7950 2400 0    50   ~ 0
Pot(entiometer)
Text Notes 9900 1750 0    50   ~ 0
RTC Breakout board
Text Notes 1750 4250 0    50   ~ 0
Motor Driver
Text Notes 1050 1600 0    50   ~ 0
4 User Usable Buttons\nArduino Pins with pull-ups
Text Label 4600 3800 2    50   ~ 0
D8
Wire Wire Line
	4600 3800 4750 3800
Text Label 4800 6400 2    50   ~ 0
D8
Wire Wire Line
	4800 6400 4950 6400
Wire Wire Line
	4950 6900 4800 6900
Wire Wire Line
	4950 7000 4800 7000
Wire Wire Line
	4950 7100 4800 7100
Wire Wire Line
	4950 7200 4800 7200
$Comp
L power:+5V #PWR?
U 1 1 5E298D0C
P 5900 6900
F 0 "#PWR?" H 5900 6750 50  0001 C CNN
F 1 "+5V" V 5915 7028 50  0000 L CNN
F 2 "" H 5900 6900 50  0001 C CNN
F 3 "" H 5900 6900 50  0001 C CNN
	1    5900 6900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E298FE6
P 5900 7000
F 0 "#PWR?" H 5900 6750 50  0001 C CNN
F 1 "GND" V 5905 6872 50  0000 R CNN
F 2 "" H 5900 7000 50  0001 C CNN
F 3 "" H 5900 7000 50  0001 C CNN
	1    5900 7000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 7000 5750 7000
Wire Wire Line
	5750 6900 5900 6900
Wire Wire Line
	5750 6500 6200 6500
$Comp
L Device:LED_RGBC D?
U 1 1 5E29F059
P 7450 4350
F 0 "D?" H 7450 4847 50  0000 C CNN
F 1 "LED_RGBC" H 7450 4756 50  0000 C CNN
F 2 "" H 7450 4300 50  0001 C CNN
F 3 "~" H 7450 4300 50  0001 C CNN
	1    7450 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2A0FE1
P 7100 4350
F 0 "#PWR?" H 7100 4100 50  0001 C CNN
F 1 "GND" V 7105 4222 50  0000 R CNN
F 2 "" H 7100 4350 50  0001 C CNN
F 3 "" H 7100 4350 50  0001 C CNN
	1    7100 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 4350 7250 4350
Text Label 7850 4150 0    50   ~ 0
D9
Text Label 7850 4350 0    50   ~ 0
D10
Text Label 7850 4550 0    50   ~ 0
D11
Text Label 4600 3900 2    50   ~ 0
D9
Text Label 4600 4000 2    50   ~ 0
D10
Text Label 4600 4100 2    50   ~ 0
D11
Wire Wire Line
	4600 3900 4750 3900
Wire Wire Line
	4750 4000 4600 4000
Wire Wire Line
	4600 4100 4750 4100
Wire Wire Line
	7850 4550 7650 4550
Wire Wire Line
	7650 4350 7850 4350
Wire Wire Line
	7850 4150 7650 4150
Text Label 4600 3500 2    50   ~ 0
D5
Text Label 4600 3600 2    50   ~ 0
D6
Wire Wire Line
	4600 3500 4750 3500
Wire Wire Line
	4750 3600 4600 3600
Text Label 4800 6900 2    50   ~ 0
D5
Text Label 4800 7000 2    50   ~ 0
D6
Text Label 4800 7100 2    50   ~ 0
D12
Text Label 4800 7200 2    50   ~ 0
D13
NoConn ~ 4950 6500
NoConn ~ 4950 6600
NoConn ~ 4950 6700
NoConn ~ 4950 6800
Text Notes 7300 3750 0    50   ~ 0
RGB LED\n
$EndSCHEMATC
