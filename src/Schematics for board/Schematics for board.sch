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
Text Label 2400 3200 0    50   ~ 0
SDA
Text Label 2400 3300 0    50   ~ 0
SCL
Text Notes 3200 3050 0    50   ~ 0
Available PWM Pins
Text Label 3600 3150 2    50   ~ 0
D3
Text Label 3600 3250 2    50   ~ 0
D5
Text Label 3600 3350 2    50   ~ 0
D6
Text Label 3600 3450 2    50   ~ 0
D9
Text Label 3600 3550 2    50   ~ 0
D10
Text Label 3600 3650 2    50   ~ 0
D11
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5E226AC7
P 5250 3600
F 0 "A?" H 5250 2511 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5250 2420 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5400 2650 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5250 2600 50  0001 C CNN
	1    5250 3600
	1    0    0    -1  
$EndComp
Text Label 2200 3200 2    50   ~ 0
A4
Text Label 2200 3300 2    50   ~ 0
A5
Wire Wire Line
	2200 3200 2400 3200
Wire Wire Line
	2200 3300 2400 3300
Text Notes 2200 3050 0    50   ~ 0
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
Text Notes 2850 750  0    50   ~ 0
x3 PWM
$EndSCHEMATC
