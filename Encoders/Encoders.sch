EESchema Schematic File Version 2
LIBS:MCU_ST_STM32
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
LIBS:Encoders-cache
EELAYER 25 0
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
$Comp
L QRE1113GR U1
U 1 1 5A8127AF
P 4450 3800
F 0 "U1" H 4300 4000 50  0000 C CNN
F 1 "QRE1113GR" H 4700 3600 50  0000 R CNN
F 2 "Encoder_Lib:QRE1113GR" H 4450 3600 50  0001 C CNN
F 3 "" H 4450 3900 50  0001 C CNN
	1    4450 3800
	1    0    0    -1  
$EndComp
$Comp
L QRE1113GR U2
U 1 1 5A8127DC
P 5850 3800
F 0 "U2" H 5700 4000 50  0000 C CNN
F 1 "QRE1113GR" H 6100 3600 50  0000 R CNN
F 2 "Encoder_Lib:QRE1113GR" H 5850 3600 50  0001 C CNN
F 3 "" H 5850 3900 50  0001 C CNN
	1    5850 3800
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5A812BD1
P 4050 3350
F 0 "R1" V 4130 3350 50  0000 C CNN
F 1 "100" V 4050 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4050 3350 50  0001 C CNN
F 3 "" H 4050 3350 50  0001 C CNN
	1    4050 3350
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A812C4C
P 4850 3350
F 0 "R2" V 4930 3350 50  0000 C CNN
F 1 "1k" V 4850 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 4850 3350 50  0001 C CNN
F 3 "" H 4850 3350 50  0001 C CNN
	1    4850 3350
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A812D33
P 5450 3350
F 0 "R3" V 5530 3350 50  0000 C CNN
F 1 "100" V 5450 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 5450 3350 50  0001 C CNN
F 3 "" H 5450 3350 50  0001 C CNN
	1    5450 3350
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5A812D60
P 6250 3350
F 0 "R4" V 6330 3350 50  0000 C CNN
F 1 "1k" V 6250 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 6250 3350 50  0001 C CNN
F 3 "" H 6250 3350 50  0001 C CNN
	1    6250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3600 4850 3700
Wire Wire Line
	4750 3700 5150 3700
Connection ~ 4850 3700
Wire Wire Line
	4050 3600 4050 3700
Wire Wire Line
	4050 3700 4150 3700
Wire Wire Line
	5450 3600 5450 3700
Wire Wire Line
	5450 3700 5550 3700
Wire Wire Line
	6250 3600 6250 3700
Wire Wire Line
	6150 3700 6550 3700
Text Label 5150 3700 2    60   ~ 0
E_A
Connection ~ 6250 3700
Text Label 6550 3700 2    60   ~ 0
E_B
$Comp
L +3.3V #PWR01
U 1 1 5A814402
P 4050 2900
F 0 "#PWR01" H 4050 2750 50  0001 C CNN
F 1 "+3.3V" H 4050 3040 50  0000 C CNN
F 2 "" H 4050 2900 50  0001 C CNN
F 3 "" H 4050 2900 50  0001 C CNN
	1    4050 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2900 4050 3100
Wire Wire Line
	4050 3000 6250 3000
Wire Wire Line
	4850 3000 4850 3100
Connection ~ 4050 3000
Wire Wire Line
	5450 3000 5450 3100
Connection ~ 4850 3000
Wire Wire Line
	6250 3000 6250 3100
Connection ~ 5450 3000
Wire Wire Line
	4150 3900 4050 3900
Wire Wire Line
	4050 4100 6250 4100
Wire Wire Line
	4050 3900 4050 4100
Wire Wire Line
	5450 4100 5450 3900
Wire Wire Line
	5450 3900 5550 3900
Wire Wire Line
	6250 3900 6250 4200
Wire Wire Line
	6250 3900 6150 3900
Connection ~ 5450 4100
Wire Wire Line
	4750 3900 4850 3900
Wire Wire Line
	4850 3900 4850 4100
Connection ~ 4850 4100
$Comp
L GND #PWR02
U 1 1 5A8148C4
P 6250 4200
F 0 "#PWR02" H 6250 3950 50  0001 C CNN
F 1 "GND" H 6250 4050 50  0000 C CNN
F 2 "" H 6250 4200 50  0001 C CNN
F 3 "" H 6250 4200 50  0001 C CNN
	1    6250 4200
	1    0    0    -1  
$EndComp
Connection ~ 6250 4100
$Comp
L Conn_01x06 J1
U 1 1 5A8151DC
P 2700 4150
F 0 "J1" H 2700 4450 50  0000 C CNN
F 1 "Conn_01x06" H 2700 3750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 2700 4150 50  0001 C CNN
F 3 "" H 2700 4150 50  0001 C CNN
	1    2700 4150
	-1   0    0    -1  
$EndComp
$Comp
L Motor_DC_ALT M1
U 1 1 5A8153C2
P 5250 4650
F 0 "M1" H 5350 4750 50  0000 L CNN
F 1 "Motor" H 5350 4450 50  0000 L TNN
F 2 "Encoder_Lib:Yellow_Motor" H 5250 4560 50  0001 C CNN
F 3 "" H 5250 4560 50  0001 C CNN
	1    5250 4650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 5A81589B
P 4800 4700
F 0 "C2" H 4810 4770 50  0000 L CNN
F 1 "0.1uF" H 4810 4620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4800 4700 50  0001 C CNN
F 3 "" H 4800 4700 50  0001 C CNN
	1    4800 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4600 4800 4350
Wire Wire Line
	4500 4350 5250 4350
Wire Wire Line
	5250 4350 5250 4450
Wire Wire Line
	5250 5050 5250 4950
Wire Wire Line
	4500 5050 5250 5050
Wire Wire Line
	4800 5050 4800 4800
Connection ~ 4800 4350
Connection ~ 4800 5050
Text Label 4500 4350 0    60   ~ 0
M+
Text Label 4500 5050 0    60   ~ 0
M-
$Comp
L +3.3V #PWR03
U 1 1 5A815E0E
P 4050 4450
F 0 "#PWR03" H 4050 4300 50  0001 C CNN
F 1 "+3.3V" H 4050 4590 50  0000 C CNN
F 2 "" H 4050 4450 50  0001 C CNN
F 3 "" H 4050 4450 50  0001 C CNN
	1    4050 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5A815F79
P 4050 4950
F 0 "#PWR04" H 4050 4700 50  0001 C CNN
F 1 "GND" H 4050 4800 50  0000 C CNN
F 2 "" H 4050 4950 50  0001 C CNN
F 3 "" H 4050 4950 50  0001 C CNN
	1    4050 4950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 5A815FA6
P 4050 4700
F 0 "C1" H 4060 4770 50  0000 L CNN
F 1 "0.1uF" H 4060 4620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4050 4700 50  0001 C CNN
F 3 "" H 4050 4700 50  0001 C CNN
	1    4050 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4800 4050 4950
Wire Wire Line
	4050 4450 4050 4600
Text Notes 3950 2500 0    60   ~ 0
Based on: https://www.pololu.com/product/2591
Wire Wire Line
	2900 3950 3300 3950
Wire Wire Line
	2900 4050 3300 4050
Wire Wire Line
	2900 4150 3050 4150
Wire Wire Line
	3050 4150 3050 3800
Wire Wire Line
	2900 4350 3300 4350
Wire Wire Line
	2900 4450 3300 4450
Wire Wire Line
	2900 4250 3050 4250
Wire Wire Line
	3050 4250 3050 4600
$Comp
L +3.3V #PWR05
U 1 1 5A817033
P 3050 3800
F 0 "#PWR05" H 3050 3650 50  0001 C CNN
F 1 "+3.3V" H 3050 3940 50  0000 C CNN
F 2 "" H 3050 3800 50  0001 C CNN
F 3 "" H 3050 3800 50  0001 C CNN
	1    3050 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5A81705B
P 3050 4600
F 0 "#PWR06" H 3050 4350 50  0001 C CNN
F 1 "GND" H 3050 4450 50  0000 C CNN
F 2 "" H 3050 4600 50  0001 C CNN
F 3 "" H 3050 4600 50  0001 C CNN
	1    3050 4600
	1    0    0    -1  
$EndComp
Text Label 3300 3950 2    60   ~ 0
M+
Text Label 3300 4050 2    60   ~ 0
M-
Text Label 3300 4350 2    60   ~ 0
E_A
Text Label 3300 4450 2    60   ~ 0
E_B
Text Notes 2200 5050 0    60   ~ 0
Extra ground pin for shielding?
$EndSCHEMATC
