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
Sheet 5 6
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
L TB6612FNG U8
U 1 1 5A8722E1
P 4900 2700
F 0 "U8" H 4750 3550 50  0000 L CNN
F 1 "TB6612FNG" H 5350 1950 50  0000 L CNN
F 2 "Housings_SSOP:SSOP-24_5.3x8.2mm_Pitch0.65mm" H 5350 3300 50  0001 C CNN
F 3 "" H 5350 3300 50  0001 C CNN
	1    4900 2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR060
U 1 1 5A8722F6
P 4600 1400
F 0 "#PWR060" H 4600 1250 50  0001 C CNN
F 1 "+3.3V" H 4600 1540 50  0000 C CNN
F 2 "" H 4600 1400 50  0001 C CNN
F 3 "" H 4600 1400 50  0001 C CNN
	1    4600 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR061
U 1 1 5A8722FC
P 5000 1400
F 0 "#PWR061" H 5000 1250 50  0001 C CNN
F 1 "+5V" H 5000 1540 50  0000 C CNN
F 2 "" H 5000 1400 50  0001 C CNN
F 3 "" H 5000 1400 50  0001 C CNN
	1    5000 1400
	1    0    0    -1  
$EndComp
$Comp
L R R22
U 1 1 5A872302
P 4900 4200
F 0 "R22" V 4980 4200 50  0000 C CNN
F 1 "0.1" V 4900 4200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4900 4200 50  0001 C CNN
F 3 "" H 4900 4200 50  0001 C CNN
	1    4900 4200
	1    0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 5A872309
P 5200 4200
F 0 "R23" V 5280 4200 50  0000 C CNN
F 1 "0.1" V 5200 4200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 5200 4200 50  0001 C CNN
F 3 "" H 5200 4200 50  0001 C CNN
	1    5200 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR062
U 1 1 5A872310
P 4900 4450
F 0 "#PWR062" H 4900 4200 50  0001 C CNN
F 1 "GND" H 4900 4300 50  0000 C CNN
F 2 "" H 4900 4450 50  0001 C CNN
F 3 "" H 4900 4450 50  0001 C CNN
	1    4900 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR063
U 1 1 5A872316
P 5200 4450
F 0 "#PWR063" H 5200 4200 50  0001 C CNN
F 1 "GND" H 5200 4300 50  0000 C CNN
F 2 "" H 5200 4450 50  0001 C CNN
F 3 "" H 5200 4450 50  0001 C CNN
	1    5200 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR064
U 1 1 5A87231C
P 4600 3700
F 0 "#PWR064" H 4600 3450 50  0001 C CNN
F 1 "GND" H 4600 3550 50  0000 C CNN
F 2 "" H 4600 3700 50  0001 C CNN
F 3 "" H 4600 3700 50  0001 C CNN
	1    4600 3700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C16
U 1 1 5A872322
P 5500 1700
F 0 "C16" H 5510 1770 50  0000 L CNN
F 1 "0.1uF" H 5510 1620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5500 1700 50  0001 C CNN
F 3 "" H 5500 1700 50  0001 C CNN
	1    5500 1700
	1    0    0    -1  
$EndComp
$Comp
L CP1_Small C17
U 1 1 5A872329
P 5800 1700
F 0 "C17" H 5810 1770 50  0000 L CNN
F 1 "10uF" H 5810 1620 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_4x4.5" H 5800 1700 50  0001 C CNN
F 3 "" H 5800 1700 50  0001 C CNN
	1    5800 1700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C15
U 1 1 5A872330
P 4250 1700
F 0 "C15" H 4260 1770 50  0000 L CNN
F 1 "0.1uF" H 4260 1620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4250 1700 50  0001 C CNN
F 3 "" H 4250 1700 50  0001 C CNN
	1    4250 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR065
U 1 1 5A872337
P 5500 1800
F 0 "#PWR065" H 5500 1550 50  0001 C CNN
F 1 "GND" H 5500 1650 50  0000 C CNN
F 2 "" H 5500 1800 50  0001 C CNN
F 3 "" H 5500 1800 50  0001 C CNN
	1    5500 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR066
U 1 1 5A87233D
P 5800 1800
F 0 "#PWR066" H 5800 1550 50  0001 C CNN
F 1 "GND" H 5800 1650 50  0000 C CNN
F 2 "" H 5800 1800 50  0001 C CNN
F 3 "" H 5800 1800 50  0001 C CNN
	1    5800 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR067
U 1 1 5A872343
P 4250 1800
F 0 "#PWR067" H 4250 1550 50  0001 C CNN
F 1 "GND" H 4250 1650 50  0000 C CNN
F 2 "" H 4250 1800 50  0001 C CNN
F 3 "" H 4250 1800 50  0001 C CNN
	1    4250 1800
	1    0    0    -1  
$EndComp
Text Notes 5350 3350 0    60   ~ 0
Chip has internal flyback diodes\nand pulldowns.
$Comp
L Motor_Servo M1
U 1 1 5A872578
P 4600 5400
F 0 "M1" H 4400 5575 50  0000 L CNN
F 1 "SG90" H 4400 5240 50  0000 L TNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4600 5210 50  0001 C CNN
F 3 "" H 4600 5210 50  0001 C CNN
	1    4600 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR068
U 1 1 5A872586
P 4150 5750
F 0 "#PWR068" H 4150 5500 50  0001 C CNN
F 1 "GND" H 4150 5600 50  0000 C CNN
F 2 "" H 4150 5750 50  0001 C CNN
F 3 "" H 4150 5750 50  0001 C CNN
	1    4150 5750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR069
U 1 1 5A872593
P 4150 5050
F 0 "#PWR069" H 4150 4900 50  0001 C CNN
F 1 "+5V" H 4150 5190 50  0000 C CNN
F 2 "" H 4150 5050 50  0001 C CNN
F 3 "" H 4150 5050 50  0001 C CNN
	1    4150 5050
	1    0    0    -1  
$EndComp
Text HLabel 5850 3850 2    60   Output ~ 0
M1_I
Text HLabel 5850 3750 2    60   Output ~ 0
M2_I
Text HLabel 3800 5300 0    60   Input ~ 0
S1_PWM
$Comp
L Motor_Servo M2
U 1 1 5A875F81
P 4600 6750
F 0 "M2" H 4400 6925 50  0000 L CNN
F 1 "SG90" H 4400 6590 50  0000 L TNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4600 6560 50  0001 C CNN
F 3 "" H 4600 6560 50  0001 C CNN
	1    4600 6750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR070
U 1 1 5A875F87
P 4150 7100
F 0 "#PWR070" H 4150 6850 50  0001 C CNN
F 1 "GND" H 4150 6950 50  0000 C CNN
F 2 "" H 4150 7100 50  0001 C CNN
F 3 "" H 4150 7100 50  0001 C CNN
	1    4150 7100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR071
U 1 1 5A875F8D
P 4150 6400
F 0 "#PWR071" H 4150 6250 50  0001 C CNN
F 1 "+5V" H 4150 6540 50  0000 C CNN
F 2 "" H 4150 6400 50  0001 C CNN
F 3 "" H 4150 6400 50  0001 C CNN
	1    4150 6400
	1    0    0    -1  
$EndComp
Text HLabel 3800 6650 0    60   Input ~ 0
S2_PWM
Text HLabel 3650 2300 0    60   Input ~ 0
STBY
Text HLabel 3650 2450 0    60   Input ~ 0
PWM1
Text HLabel 3650 2650 0    60   Input ~ 0
PWM2
Text HLabel 3650 2800 0    60   Input ~ 0
M1_FW
Text HLabel 3650 2900 0    60   Input ~ 0
M1_BK
Text HLabel 3650 3100 0    60   Input ~ 0
M2_FW
Text HLabel 3650 3000 0    60   Input ~ 0
M2_BK
Text HLabel 5850 2400 2    60   Output ~ 0
M1+
Text HLabel 5850 2500 2    60   Output ~ 0
M1-
Text HLabel 5850 3000 2    60   Output ~ 0
M2+
Text HLabel 5850 2900 2    60   Output ~ 0
M2-
Text Notes 5350 4300 0    60   ~ 0
Stall current is 900 mA\nGives .09v drop at stall.
Wire Wire Line
	5500 2400 5850 2400
Wire Wire Line
	5550 2400 5550 2300
Wire Wire Line
	5550 2300 5500 2300
Wire Wire Line
	5500 2500 5850 2500
Wire Wire Line
	5550 2500 5550 2600
Wire Wire Line
	5550 2600 5500 2600
Wire Wire Line
	5500 2800 5550 2800
Wire Wire Line
	5550 2800 5550 2900
Wire Wire Line
	5500 2900 5850 2900
Wire Wire Line
	5500 3000 5850 3000
Wire Wire Line
	5550 3000 5550 3100
Wire Wire Line
	5550 3100 5500 3100
Wire Wire Line
	4900 3700 4900 3950
Wire Wire Line
	4900 3750 5000 3750
Wire Wire Line
	5000 3750 5000 3700
Wire Wire Line
	5100 3700 5100 3750
Wire Wire Line
	5100 3750 5850 3750
Wire Wire Line
	5200 3700 5200 3950
Connection ~ 5550 2400
Connection ~ 5550 2500
Connection ~ 5550 2900
Connection ~ 5550 3000
Wire Wire Line
	5800 1550 5800 1600
Wire Wire Line
	4250 1550 4250 1600
Connection ~ 5200 3750
Wire Wire Line
	4900 3850 5850 3850
Connection ~ 4900 3750
Connection ~ 4900 3850
Wire Wire Line
	4600 1400 4600 1700
Wire Wire Line
	5000 1400 5000 1700
Wire Wire Line
	4250 1550 4600 1550
Connection ~ 4600 1550
Wire Wire Line
	5500 1600 5500 1550
Wire Wire Line
	5000 1550 5800 1550
Connection ~ 5000 1550
Connection ~ 5500 1550
Wire Wire Line
	5100 1700 5100 1550
Connection ~ 5100 1550
Wire Wire Line
	5200 1700 5200 1550
Connection ~ 5200 1550
Wire Wire Line
	4150 5500 4150 5750
Wire Wire Line
	4150 5500 4300 5500
Wire Wire Line
	4150 5050 4150 5400
Wire Wire Line
	4150 5400 4300 5400
Wire Wire Line
	3650 2300 4300 2300
Wire Wire Line
	3650 2800 4300 2800
Wire Wire Line
	3650 2900 4300 2900
Wire Wire Line
	3650 3000 4300 3000
Wire Wire Line
	3650 3100 4300 3100
Wire Wire Line
	4150 6850 4150 7100
Wire Wire Line
	4150 6850 4300 6850
Wire Wire Line
	4150 6400 4150 6750
Wire Wire Line
	4150 6750 4300 6750
Wire Wire Line
	4300 5300 3800 5300
Wire Wire Line
	3800 6650 4300 6650
$Comp
L R R20
U 1 1 5A864B97
P 3950 2450
F 0 "R20" V 4030 2450 50  0000 C CNN
F 1 "100" V 3950 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3950 2450 50  0001 C CNN
F 3 "" H 3950 2450 50  0001 C CNN
	1    3950 2450
	0    1    1    0   
$EndComp
$Comp
L R R21
U 1 1 5A86528B
P 3950 2650
F 0 "R21" V 4030 2650 50  0000 C CNN
F 1 "100" V 3950 2650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3950 2650 50  0001 C CNN
F 3 "" H 3950 2650 50  0001 C CNN
	1    3950 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 2500 4250 2500
Wire Wire Line
	4250 2500 4250 2450
Wire Wire Line
	4250 2450 4200 2450
Wire Wire Line
	4200 2650 4250 2650
Wire Wire Line
	4250 2650 4250 2600
Wire Wire Line
	4250 2600 4300 2600
Wire Wire Line
	3700 2450 3650 2450
Wire Wire Line
	3700 2650 3650 2650
$EndSCHEMATC
