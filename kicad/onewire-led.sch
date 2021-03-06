EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:parts
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "10 apr 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATTINY13A-P IC1
U 1 1 552814F1
P 5300 3150
F 0 "IC1" H 4500 3550 40  0000 C CNN
F 1 "ATTINY13A-P" H 5950 2750 40  0000 C CNN
F 2 "DIP8" H 5950 3150 35  0000 C CIN
F 3 "~" H 4500 3500 60  0000 C CNN
	1    5300 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 55281500
P 6400 3500
F 0 "#PWR01" H 6400 3500 30  0001 C CNN
F 1 "GND" H 6400 3430 30  0001 C CNN
F 2 "" H 6400 3500 60  0000 C CNN
F 3 "" H 6400 3500 60  0000 C CNN
	1    6400 3500
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 55281535
P 7400 3100
F 0 "C1" H 7450 3200 50  0000 L CNN
F 1 "470u" H 7450 3000 50  0000 L CNN
F 2 "~" H 7400 3100 60  0000 C CNN
F 3 "~" H 7400 3100 60  0000 C CNN
	1    7400 3100
	1    0    0    -1  
$EndComp
$Comp
L DIODE D1
U 1 1 55281544
P 7700 3400
F 0 "D1" H 7700 3500 40  0000 C CNN
F 1 "1N4148" H 7700 3300 40  0000 C CNN
F 2 "~" H 7700 3400 60  0000 C CNN
F 3 "~" H 7700 3400 60  0000 C CNN
	1    7700 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 55281641
P 7400 3500
F 0 "#PWR02" H 7400 3500 30  0001 C CNN
F 1 "GND" H 7400 3430 30  0001 C CNN
F 2 "" H 7400 3500 60  0000 C CNN
F 3 "" H 7400 3500 60  0000 C CNN
	1    7400 3500
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P1
U 1 1 552817F0
P 9150 3000
F 0 "P1" V 9100 3000 40  0000 C CNN
F 1 "CONN_2" V 9200 3000 40  0000 C CNN
F 2 "~" H 9150 3000 60  0000 C CNN
F 3 "~" H 9150 3000 60  0000 C CNN
	1    9150 3000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 55281802
P 7400 2800
F 0 "#PWR03" H 7400 2900 30  0001 C CNN
F 1 "VCC" H 7400 2900 30  0000 C CNN
F 2 "" H 7400 2800 60  0000 C CNN
F 3 "" H 7400 2800 60  0000 C CNN
	1    7400 2800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 55281811
P 8700 2800
F 0 "#PWR04" H 8700 2900 30  0001 C CNN
F 1 "VCC" H 8700 2900 30  0000 C CNN
F 2 "" H 8700 2800 60  0000 C CNN
F 3 "" H 8700 2800 60  0000 C CNN
	1    8700 2800
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5528183A
P 8200 2750
F 0 "R6" V 8280 2750 40  0000 C CNN
F 1 "2K2" V 8207 2751 40  0000 C CNN
F 2 "~" V 8130 2750 30  0000 C CNN
F 3 "~" H 8200 2750 30  0000 C CNN
	1    8200 2750
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 55281849
P 8200 2050
F 0 "R5" V 8280 2050 40  0000 C CNN
F 1 "8K2" V 8207 2051 40  0000 C CNN
F 2 "~" V 8130 2050 30  0000 C CNN
F 3 "~" H 8200 2050 30  0000 C CNN
	1    8200 2050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 55281858
P 8200 1700
F 0 "#PWR05" H 8200 1800 30  0001 C CNN
F 1 "VCC" H 8200 1800 30  0000 C CNN
F 2 "" H 8200 1700 60  0000 C CNN
F 3 "" H 8200 1700 60  0000 C CNN
	1    8200 1700
	1    0    0    -1  
$EndComp
Text Label 8300 2400 0    60   ~ 0
Vsense
$Comp
L VCC #PWR06
U 1 1 552818F9
P 6400 2800
F 0 "#PWR06" H 6400 2900 30  0001 C CNN
F 1 "VCC" H 6400 2900 30  0000 C CNN
F 2 "" H 6400 2800 60  0000 C CNN
F 3 "" H 6400 2800 60  0000 C CNN
	1    6400 2800
	1    0    0    -1  
$EndComp
Text Label 4100 3000 2    60   ~ 0
Vsense
$Comp
L R R2
U 1 1 55281935
P 3300 3900
F 0 "R2" V 3380 3900 40  0000 C CNN
F 1 "R" V 3307 3901 40  0000 C CNN
F 2 "~" V 3230 3900 30  0000 C CNN
F 3 "~" H 3300 3900 30  0000 C CNN
	1    3300 3900
	1    0    0    1   
$EndComp
$Comp
L R R3
U 1 1 55281944
P 3500 3900
F 0 "R3" V 3580 3900 40  0000 C CNN
F 1 "R" V 3507 3901 40  0000 C CNN
F 2 "~" V 3430 3900 30  0000 C CNN
F 3 "~" H 3500 3900 30  0000 C CNN
	1    3500 3900
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 55281953
P 3700 3900
F 0 "R4" V 3780 3900 40  0000 C CNN
F 1 "R" V 3707 3901 40  0000 C CNN
F 2 "~" V 3630 3900 30  0000 C CNN
F 3 "~" H 3700 3900 30  0000 C CNN
	1    3700 3900
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 552819EC
P 3100 3050
F 0 "R1" V 3180 3050 40  0000 C CNN
F 1 "10K" V 3107 3051 40  0000 C CNN
F 2 "~" V 3030 3050 30  0000 C CNN
F 3 "~" H 3100 3050 30  0000 C CNN
	1    3100 3050
	1    0    0    -1  
$EndComp
$Comp
L CLVBA-FKA LED1
U 1 1 55281BE1
P 3500 4600
F 0 "LED1" H 3500 4750 60  0000 C CNN
F 1 "CLVBA-FKA" H 3500 4400 60  0000 C CNN
F 2 "~" H 3750 4500 60  0000 C CNN
F 3 "~" H 3750 4500 60  0000 C CNN
	1    3500 4600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR07
U 1 1 55281BF0
P 2600 4200
F 0 "#PWR07" H 2600 4300 30  0001 C CNN
F 1 "VCC" H 2600 4300 30  0000 C CNN
F 2 "" H 2600 4200 60  0000 C CNN
F 3 "" H 2600 4200 60  0000 C CNN
	1    2600 4200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR08
U 1 1 55281D4B
P 3100 2700
F 0 "#PWR08" H 3100 2800 30  0001 C CNN
F 1 "VCC" H 3100 2800 30  0000 C CNN
F 2 "" H 3100 2700 60  0000 C CNN
F 3 "" H 3100 2700 60  0000 C CNN
	1    3100 2700
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 55281E64
P 8550 2800
F 0 "#FLG09" H 8550 2895 30  0001 C CNN
F 1 "PWR_FLAG" H 8550 2980 30  0000 C CNN
F 2 "" H 8550 2800 60  0000 C CNN
F 3 "" H 8550 2800 60  0000 C CNN
	1    8550 2800
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG010
U 1 1 55281F19
P 7200 3400
F 0 "#FLG010" H 7200 3495 30  0001 C CNN
F 1 "PWR_FLAG" H 7200 3580 30  0000 C CNN
F 2 "" H 7200 3400 60  0000 C CNN
F 3 "" H 7200 3400 60  0000 C CNN
	1    7200 3400
	1    0    0    -1  
$EndComp
Text Label 3300 3650 2    60   ~ 0
red
Text Label 3500 3650 2    60   ~ 0
green
Text Label 3700 3650 2    60   ~ 0
blue
Wire Wire Line
	3300 3100 4300 3100
Wire Wire Line
	3300 3650 3300 3100
Connection ~ 8700 2900
Wire Wire Line
	8550 2800 8550 2900
Wire Wire Line
	3100 2700 3100 2800
Wire Wire Line
	4250 4650 4050 4650
Wire Wire Line
	4250 4250 4250 4650
Wire Wire Line
	3700 4250 4250 4250
Wire Wire Line
	3700 4150 3700 4250
Wire Wire Line
	3500 4350 3500 4150
Wire Wire Line
	4150 4350 3500 4350
Wire Wire Line
	4150 4550 4150 4350
Wire Wire Line
	4050 4550 4150 4550
Wire Wire Line
	3300 4250 3300 4150
Wire Wire Line
	2850 4250 3300 4250
Wire Wire Line
	2850 4550 2850 4250
Wire Wire Line
	2950 4550 2850 4550
Wire Wire Line
	2600 4650 2950 4650
Wire Wire Line
	2600 4200 2600 4650
Wire Wire Line
	3100 3400 3100 3300
Wire Wire Line
	3500 3200 3500 3650
Wire Wire Line
	4300 3200 3500 3200
Wire Wire Line
	4100 3000 4300 3000
Wire Wire Line
	6400 2900 6300 2900
Wire Wire Line
	6400 2800 6400 2900
Connection ~ 8200 2400
Wire Wire Line
	8300 2400 8200 2400
Connection ~ 8200 3100
Wire Wire Line
	8200 2300 8200 2500
Wire Wire Line
	8200 1700 8200 1800
Wire Wire Line
	8200 3100 8800 3100
Wire Wire Line
	8200 3000 8200 3400
Wire Wire Line
	8200 3400 7900 3400
Wire Wire Line
	7400 2900 7400 2800
Wire Wire Line
	8700 2900 8700 2800
Wire Wire Line
	8550 2900 8800 2900
Connection ~ 7400 3400
Wire Wire Line
	7200 3400 7500 3400
Wire Wire Line
	7400 3300 7400 3500
Wire Wire Line
	6400 3400 6300 3400
Wire Wire Line
	6400 3500 6400 3400
Wire Wire Line
	4300 3400 3100 3400
Wire Wire Line
	4300 3300 3700 3300
Wire Wire Line
	3700 3300 3700 3650
NoConn ~ 4300 2900
$EndSCHEMATC
