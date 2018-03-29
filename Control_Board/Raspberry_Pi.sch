EESchema Schematic File Version 2
LIBS:pspice
LIBS:power
LIBS:Video
LIBS:Valve
LIBS:Triac_Thyristor
LIBS:Transistor_IGBT
LIBS:Transistor_FET
LIBS:Transistor_BJT
LIBS:Transistor_Array
LIBS:Transformer
LIBS:Timer_RTC
LIBS:Timer
LIBS:Switch
LIBS:Sensor_Voltage
LIBS:Sensor_Touch
LIBS:Sensor_Temperature
LIBS:Sensor_Proximity
LIBS:Sensor_Pressure
LIBS:Sensor_Optical
LIBS:Sensor_MultiFunction
LIBS:Sensor_Motion
LIBS:Sensor_Magnetic
LIBS:Sensor_Humidity
LIBS:Sensor_Gas
LIBS:Sensor_Current
LIBS:Sensor_Audio
LIBS:Sensor
LIBS:Relay_SolidState
LIBS:Relay
LIBS:Regulator_Switching
LIBS:Regulator_SwitchedCapacitor
LIBS:Regulator_Linear
LIBS:Regulator_Current
LIBS:Regulator_Controller
LIBS:Reference_Voltage
LIBS:Reference_Current
LIBS:RF_ZigBee
LIBS:RF_WiFi
LIBS:RF_RFID
LIBS:RF_Module
LIBS:RF_Mixer
LIBS:RF_GPS
LIBS:RF_Bluetooth
LIBS:RF_AM_FM
LIBS:RF
LIBS:Power_Supervisor
LIBS:Power_Protection
LIBS:Power_Management
LIBS:Potentiometer_Digital
LIBS:Oscillator
LIBS:Motor
LIBS:Memory_UniqueID
LIBS:Memory_ROM
LIBS:Memory_RAM
LIBS:Memory_NVRAM
LIBS:Memory_Flash
LIBS:Memory_EEPROM
LIBS:Memory_Controller
LIBS:Mechanical
LIBS:MCU_Texas_MSP430
LIBS:MCU_Texas
LIBS:MCU_SiliconLabs
LIBS:MCU_SiFive
LIBS:MCU_ST_STM8
LIBS:MCU_ST_STM32
LIBS:MCU_Parallax
LIBS:MCU_NXP_S08
LIBS:MCU_NXP_LPC
LIBS:MCU_NXP_Kinetis
LIBS:MCU_NXP_HC11
LIBS:MCU_Module
LIBS:MCU_Microchip_SAML
LIBS:MCU_Microchip_SAME
LIBS:MCU_Microchip_PIC32
LIBS:MCU_Microchip_PIC24
LIBS:MCU_Microchip_PIC18
LIBS:MCU_Microchip_PIC16
LIBS:MCU_Microchip_PIC12
LIBS:MCU_Microchip_PIC10
LIBS:MCU_Intel
LIBS:MCU_Infineon
LIBS:MCU_Cypress
LIBS:MCU_Atmel_AVR
LIBS:MCU_Atmel_ATTINY
LIBS:MCU_Atmel_ATMEGA
LIBS:MCU_Atmel_8051
LIBS:MCU_AnalogDevices
LIBS:Logic_TTL_IEEE
LIBS:Logic_Programmable
LIBS:Logic_LevelTranslator
LIBS:Logic_CMOS_IEEE
LIBS:Logic_CMOS_4000
LIBS:Logic_74xx
LIBS:Logic_74xgxx
LIBS:LED
LIBS:Jumper
LIBS:Isolator_Analog
LIBS:Isolator
LIBS:Interface_USB
LIBS:Interface_UART
LIBS:Interface_Telecom
LIBS:Interface_Optical
LIBS:Interface_LineDriver
LIBS:Interface_HID
LIBS:Interface_Expansion
LIBS:Interface_Ethernet
LIBS:Interface_CurrentLoop
LIBS:Interface_CAN_LIN
LIBS:Interface
LIBS:Graphic
LIBS:FPGA_Xilinx_Virtex7
LIBS:FPGA_Xilinx_Virtex6
LIBS:FPGA_Xilinx_Virtex5
LIBS:FPGA_Xilinx_Spartan6
LIBS:FPGA_Xilinx_Kintex7
LIBS:FPGA_Xilinx_Artix7
LIBS:FPGA_Xilinx
LIBS:FPGA_Actel
LIBS:Driver_Relay
LIBS:Driver_Motor
LIBS:Driver_LED
LIBS:Driver_FET
LIBS:Driver_Display
LIBS:Display_Graphic
LIBS:Display_Character
LIBS:Diode_Laser
LIBS:Diode_Bridge
LIBS:Diode
LIBS:Device
LIBS:DSP_Texas
LIBS:DSP_Microchip_DSPIC33
LIBS:DSP_Freescale
LIBS:Converter_DCDC
LIBS:Connector_Specialized
LIBS:Connector_Generic_Shielded
LIBS:Connector_Generic
LIBS:Comparator
LIBS:CPU
LIBS:CPLD_Xilinx
LIBS:CPLD_Altera
LIBS:Battery_Management
LIBS:Audio
LIBS:Analog_Switch
LIBS:Analog_DAC
LIBS:Analog_ADC
LIBS:Analog
LIBS:Amplifier_Video
LIBS:Amplifier_Operational
LIBS:Amplifier_Instrumentation
LIBS:Amplifier_Difference
LIBS:Amplifier_Current
LIBS:Amplifier_Buffer
LIBS:Amplifier_Audio
LIBS:Control_Board
LIBS:Control_Board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Raspberry_Pi_2_3 J7
U 1 1 5A76617F
P 5700 3850
F 0 "J7" H 6400 2600 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 5300 4750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20_Pitch2.54mm" H 6700 5100 50  0001 C CNN
F 3 "" H 5750 3700 50  0001 C CNN
	1    5700 3850
	1    0    0    -1  
$EndComp
$Comp
L CAT23C32 U4
U 1 1 5A76655F
P 3050 4600
F 0 "U4" H 2750 4900 60  0000 C CNN
F 1 "CAT24C32" H 3350 4900 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3000 4600 60  0001 C CNN
F 3 "" H 3000 4600 60  0001 C CNN
	1    3050 4600
	1    0    0    -1  
$EndComp
Text HLabel 2050 3350 0    60   Output ~ 0
nRST
Text HLabel 2050 3450 0    60   BiDi ~ 0
SWDIO
Text HLabel 2050 3550 0    60   Output ~ 0
SWD_CLK
Wire Wire Line
	5600 2550 5600 2450
Wire Wire Line
	5600 2450 5500 2450
Connection ~ 5500 2450
Wire Wire Line
	5500 2250 5500 2550
$Comp
L +5V #PWR031
U 1 1 5A7D414F
P 5500 1675
F 0 "#PWR031" H 5500 1525 50  0001 C CNN
F 1 "+5V" H 5500 1815 50  0000 C CNN
F 2 "" H 5500 1675 50  0001 C CNN
F 3 "" H 5500 1675 50  0001 C CNN
	1    5500 1675
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1675 5500 1850
Wire Wire Line
	5400 5150 5400 5250
Wire Wire Line
	5300 5250 6000 5250
Wire Wire Line
	5300 5250 5300 5150
Wire Wire Line
	5500 5250 5500 5150
Connection ~ 5400 5250
Wire Wire Line
	5600 5250 5600 5150
Connection ~ 5500 5250
Wire Wire Line
	5700 5250 5700 5150
Connection ~ 5600 5250
Wire Wire Line
	5800 5250 5800 5150
Connection ~ 5700 5250
Wire Wire Line
	5900 5250 5900 5150
Connection ~ 5800 5250
Wire Wire Line
	6000 5150 6000 5350
Connection ~ 5900 5250
Connection ~ 6000 5250
$Comp
L GND #PWR032
U 1 1 5A7D4799
P 6000 5350
F 0 "#PWR032" H 6000 5100 50  0001 C CNN
F 1 "GND" H 6000 5200 50  0000 C CNN
F 2 "" H 6000 5350 50  0001 C CNN
F 3 "" H 6000 5350 50  0001 C CNN
	1    6000 5350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C5
U 1 1 5A7D4DBE
P 2750 3900
F 0 "C5" H 2760 3970 50  0000 L CNN
F 1 "0.1uF" H 2760 3820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2750 3900 50  0001 C CNN
F 3 "" H 2750 3900 50  0001 C CNN
	1    2750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3950 4650 3950
Wire Wire Line
	4650 3950 4650 3450
Wire Wire Line
	4800 4050 4550 4050
Wire Wire Line
	4550 4050 4550 3550
$Comp
L R R11
U 1 1 5A7D53B8
P 3650 4050
F 0 "R11" V 3730 4050 50  0000 C CNN
F 1 "3.9k" V 3650 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3650 4050 50  0001 C CNN
F 3 "" H 3650 4050 50  0001 C CNN
	1    3650 4050
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 5A7D57E5
P 3850 4050
F 0 "R12" V 3930 4050 50  0000 C CNN
F 1 "3.9k" V 3850 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3850 4050 50  0001 C CNN
F 3 "" H 3850 4050 50  0001 C CNN
	1    3850 4050
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 5A7D580B
P 4050 4050
F 0 "R13" V 4130 4050 50  0000 C CNN
F 1 "3.9k" V 4050 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4050 4050 50  0001 C CNN
F 3 "" H 4050 4050 50  0001 C CNN
	1    4050 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3750 4050 3750
Wire Wire Line
	4050 3750 4050 3800
Connection ~ 3050 3750
$Comp
L GND #PWR033
U 1 1 5A7D64C9
P 2750 4000
F 0 "#PWR033" H 2750 3750 50  0001 C CNN
F 1 "GND" H 2750 3850 50  0000 C CNN
F 2 "" H 2750 4000 50  0001 C CNN
F 3 "" H 2750 4000 50  0001 C CNN
	1    2750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4450 2550 4450
Wire Wire Line
	2550 4450 2550 4900
Wire Wire Line
	2550 4900 3050 4900
Wire Wire Line
	3050 4850 3050 5000
Wire Wire Line
	2600 4550 2550 4550
Connection ~ 2550 4550
Wire Wire Line
	2600 4650 2550 4650
Connection ~ 2550 4650
Connection ~ 3050 4900
$Comp
L GND #PWR034
U 1 1 5A7D6AFA
P 3050 5000
F 0 "#PWR034" H 3050 4750 50  0001 C CNN
F 1 "GND" H 3050 4850 50  0000 C CNN
F 2 "" H 3050 5000 50  0001 C CNN
F 3 "" H 3050 5000 50  0001 C CNN
	1    3050 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 3350 4800 3350
Wire Wire Line
	4650 3450 2050 3450
Wire Wire Line
	4550 3550 2050 3550
Wire Wire Line
	3650 3750 3650 3800
Connection ~ 3650 3750
Wire Wire Line
	3850 3750 3850 3800
Connection ~ 3850 3750
Wire Wire Line
	3650 4300 3650 4750
Wire Wire Line
	3650 4450 3500 4450
Wire Wire Line
	3500 4550 4800 4550
Wire Wire Line
	3500 4650 4800 4650
Wire Wire Line
	3850 4300 3850 4550
Connection ~ 3850 4550
Wire Wire Line
	4050 4300 4050 4650
Connection ~ 4050 4650
Wire Wire Line
	3050 3750 3050 4250
Connection ~ 3650 4450
$Comp
L GND #PWR035
U 1 1 5A7D991D
P 3650 5150
F 0 "#PWR035" H 3650 4900 50  0001 C CNN
F 1 "GND" H 3650 5000 50  0000 C CNN
F 2 "" H 3650 5150 50  0001 C CNN
F 3 "" H 3650 5150 50  0001 C CNN
	1    3650 5150
	1    0    0    -1  
$EndComp
$Comp
L Jumper_2_Open JP2
U 1 1 5A7D9E7A
P 3650 4950
F 0 "JP2" H 3650 5060 50  0000 C CNN
F 1 "J_WP" H 3650 4860 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3650 4950 50  0001 C CNN
F 3 "" H 3650 4950 50  0001 C CNN
	1    3650 4950
	0    -1   -1   0   
$EndComp
$Comp
L Jumper_2_Bridged JP3
U 1 1 5A7DADF7
P 5500 2050
F 0 "JP3" H 5500 2125 50  0000 C CNN
F 1 "J_Pi_5V" H 5500 1950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5500 2050 50  0001 C CNN
F 3 "" H 5500 2050 50  0001 C CNN
	1    5500 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 3750 2750 3800
Wire Wire Line
	3300 3750 3300 2350
Wire Wire Line
	3300 2350 5900 2350
Wire Wire Line
	5900 2350 5900 2550
Connection ~ 3300 3750
Text HLabel 7300 4550 2    60   Output ~ 0
Tx
Text HLabel 7300 4650 2    60   Input ~ 0
Rx
Text Notes 2375 5775 0    60   ~ 0
EEPROM circuit from: https://github.com/raspberrypi/hats/blob/master/eeprom-circuit.png
Wire Wire Line
	6600 4550 7300 4550
Wire Wire Line
	7300 4650 6600 4650
NoConn ~ 5800 2550
NoConn ~ 6600 3150
NoConn ~ 6600 3350
NoConn ~ 6600 3450
NoConn ~ 6600 4250
NoConn ~ 6600 4350
NoConn ~ 4800 4250
NoConn ~ 4800 4150
NoConn ~ 4800 3850
NoConn ~ 4800 3750
NoConn ~ 4800 3650
NoConn ~ 4800 3550
NoConn ~ 4800 3450
NoConn ~ 4800 3250
NoConn ~ 4800 3150
NoConn ~ 6600 3650
NoConn ~ 6600 3750
NoConn ~ 6600 3850
NoConn ~ 6600 3950
NoConn ~ 6600 4050
Text HLabel 7300 2950 2    60   BiDi ~ 0
SDA
Text HLabel 7300 3050 2    60   BiDi ~ 0
SCL
Wire Wire Line
	6600 2950 7300 2950
Wire Wire Line
	7300 3050 6600 3050
Text Label 4350 4650 0    60   ~ 0
ID_SC
Text Label 4350 4550 0    60   ~ 0
ID_SD
$EndSCHEMATC
