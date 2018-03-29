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
Sheet 1 6
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
L LSM6DS3 U2
U 1 1 5A68D176
P 5150 6650
F 0 "U2" H 4700 7250 50  0000 L CNN
F 1 "LSM6DS3" H 4700 7150 50  0000 L BNN
F 2 "Control_Board:LSM6DS3" H 4750 5950 50  0001 L CNN
F 3 "" H 5250 6000 50  0001 C CNN
	1    5150 6650
	1    0    0    -1  
$EndComp
$Comp
L STM32F071CBT6 U1
U 1 1 5A73AF4F
P 4850 2450
F 0 "U1" H 4450 3650 50  0000 L BNN
F 1 "STM32F071CBT6" H 5050 1200 50  0000 R BNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 5650 3650 50  0001 R TNN
F 3 "" H 3000 2050 50  0001 C CNN
	1    4850 2450
	1    0    0    -1  
$EndComp
$Sheet
S 8600 1300 1000 750 
U 5A765427
F0 "Raspberry_Pi" 60
F1 "Raspberry_Pi.sch" 60
F2 "nRST" O L 8600 1400 60 
F3 "SWDIO" B L 8600 1500 60 
F4 "SWD_CLK" O L 8600 1600 60 
F5 "Tx" O L 8600 1800 60 
F6 "Rx" I L 8600 1900 60 
F7 "SDA" B R 9600 1500 60 
F8 "SCL" B R 9600 1600 60 
$EndSheet
$Sheet
S 8600 4100 1000 600 
U 5A76DD38
F0 "Encoder_Comp" 60
F1 "Encoder.sch" 60
F2 "E1_A" I R 9600 4200 60 
F3 "E1_B" I R 9600 4300 60 
F4 "E2_A" I R 9600 4500 60 
F5 "E2_B" I R 9600 4600 60 
F6 "E1_A_Cmp" O L 8600 4200 60 
F7 "E1_B_Cmp" O L 8600 4300 60 
F8 "E2_A_Cmp" O L 8600 4500 60 
F9 "E2_B_Cmp" O L 8600 4600 60 
$EndSheet
$Comp
L LED D1
U 1 1 5A799712
P 1800 6550
F 0 "D1" H 1800 6650 50  0000 C CNN
F 1 "RED" H 1800 6450 50  0000 C CNN
F 2 "LEDs:LED_0603_HandSoldering" H 1800 6550 50  0001 C CNN
F 3 "" H 1800 6550 50  0001 C CNN
	1    1800 6550
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C3
U 1 1 5A7F38D4
P 5800 5750
F 0 "C3" H 5810 5820 50  0000 L CNN
F 1 "0.1uF" H 5810 5670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5800 5750 50  0001 C CNN
F 3 "" H 5800 5750 50  0001 C CNN
	1    5800 5750
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 5A7F441A
P 5250 5550
F 0 "#PWR01" H 5250 5400 50  0001 C CNN
F 1 "+3.3V" H 5250 5690 50  0000 C CNN
F 2 "" H 5250 5550 50  0001 C CNN
F 3 "" H 5250 5550 50  0001 C CNN
	1    5250 5550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 5A7F49B5
P 5500 5750
F 0 "C2" H 5510 5820 50  0000 L CNN
F 1 "0.1uF" H 5510 5670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5500 5750 50  0001 C CNN
F 3 "" H 5500 5750 50  0001 C CNN
	1    5500 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5A7F4DCF
P 5500 5850
F 0 "#PWR02" H 5500 5600 50  0001 C CNN
F 1 "GND" H 5500 5700 50  0000 C CNN
F 2 "" H 5500 5850 50  0001 C CNN
F 3 "" H 5500 5850 50  0001 C CNN
	1    5500 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5A7F4E6C
P 5800 5850
F 0 "#PWR03" H 5800 5600 50  0001 C CNN
F 1 "GND" H 5800 5700 50  0000 C CNN
F 2 "" H 5800 5850 50  0001 C CNN
F 3 "" H 5800 5850 50  0001 C CNN
	1    5800 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5A7F6CB7
P 5250 7350
F 0 "#PWR04" H 5250 7100 50  0001 C CNN
F 1 "GND" H 5250 7200 50  0000 C CNN
F 2 "" H 5250 7350 50  0001 C CNN
F 3 "" H 5250 7350 50  0001 C CNN
	1    5250 7350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5A8052A1
P 4450 7350
F 0 "#PWR05" H 4450 7100 50  0001 C CNN
F 1 "GND" H 4450 7200 50  0000 C CNN
F 2 "" H 4450 7350 50  0001 C CNN
F 3 "" H 4450 7350 50  0001 C CNN
	1    4450 7350
	1    0    0    -1  
$EndComp
$Sheet
S 650  850  800  600 
U 5A85B580
F0 "Power" 60
F1 "Power.sch" 60
F2 "BAT_REF" O R 1450 1150 60 
$EndSheet
$Comp
L SW_Push SW2
U 1 1 5A88CC8C
P 6900 1700
F 0 "SW2" H 6950 1800 50  0000 L CNN
F 1 "SW_RST" H 6900 1640 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 6900 1900 50  0001 C CNN
F 3 "" H 6900 1900 50  0001 C CNN
	1    6900 1700
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 5A88D041
P 1050 3050
F 0 "#PWR06" H 1050 2900 50  0001 C CNN
F 1 "+3.3V" H 1050 3190 50  0000 C CNN
F 2 "" H 1050 3050 50  0001 C CNN
F 3 "" H 1050 3050 50  0001 C CNN
	1    1050 3050
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW1
U 1 1 5A8C05F4
P 1350 3350
F 0 "SW1" H 1400 3450 50  0000 L CNN
F 1 "SW_Push" H 1350 3290 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 1350 3550 50  0001 C CNN
F 3 "" H 1350 3550 50  0001 C CNN
	1    1350 3350
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A834DA9
P 1800 6950
F 0 "R2" V 1880 6950 50  0000 C CNN
F 1 "470" V 1800 6950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 1800 6950 50  0001 C CNN
F 3 "" H 1800 6950 50  0001 C CNN
	1    1800 6950
	1    0    0    -1  
$EndComp
$Comp
L Jumper_2_Open JP1
U 1 1 5A858874
P 3450 1100
F 0 "JP1" H 3450 1210 50  0000 C CNN
F 1 "J_Boot" H 3450 1010 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3450 1100 50  0001 C CNN
F 3 "" H 3450 1100 50  0001 C CNN
	1    3450 1100
	0    -1   1    0   
$EndComp
$Comp
L R R7
U 1 1 5A85A4F7
P 3450 1700
F 0 "R7" V 3530 1700 50  0000 C CNN
F 1 "10k" V 3450 1700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 3450 1700 50  0001 C CNN
F 3 "" H 3450 1700 50  0001 C CNN
	1    3450 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5A85B4D6
P 3450 1950
F 0 "#PWR07" H 3450 1700 50  0001 C CNN
F 1 "GND" H 3450 1800 50  0000 C CNN
F 2 "" H 3450 1950 50  0001 C CNN
F 3 "" H 3450 1950 50  0001 C CNN
	1    3450 1950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 5A85C735
P 2300 1400
F 0 "#PWR08" H 2300 1250 50  0001 C CNN
F 1 "+3.3V" H 2300 1540 50  0000 C CNN
F 2 "" H 2300 1400 50  0001 C CNN
F 3 "" H 2300 1400 50  0001 C CNN
	1    2300 1400
	1    0    0    -1  
$EndComp
$Sheet
S 8600 2300 1000 1450
U 5A8720E9
F0 "Motors" 60
F1 "Motors.sch" 60
F2 "M1_I" O L 8600 2900 60 
F3 "M2_I" O L 8600 3400 60 
F4 "S1_PWM" I L 8600 3600 60 
F5 "S2_PWM" I L 8600 3700 60 
F6 "STBY" I L 8600 2400 60 
F7 "PWM1" I L 8600 2600 60 
F8 "PWM2" I L 8600 3100 60 
F9 "M1_FW" I L 8600 2700 60 
F10 "M1_BK" I L 8600 2800 60 
F11 "M2_FW" I L 8600 3200 60 
F12 "M2_BK" I L 8600 3300 60 
F13 "M1+" O R 9600 2700 60 
F14 "M1-" O R 9600 2800 60 
F15 "M2+" O R 9600 3200 60 
F16 "M2-" O R 9600 3300 60 
$EndSheet
$Comp
L GND #PWR09
U 1 1 5A8E58B3
P 6900 2100
F 0 "#PWR09" H 6900 1850 50  0001 C CNN
F 1 "GND" H 6900 1950 50  0000 C CNN
F 2 "" H 6900 2100 50  0001 C CNN
F 3 "" H 6900 2100 50  0001 C CNN
	1    6900 2100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x05 J4
U 1 1 5A8F12E6
P 7650 750
F 0 "J4" H 7650 1050 50  0000 C CNN
F 1 "SWD" H 7650 450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 7650 750 50  0001 C CNN
F 3 "" H 7650 750 50  0001 C CNN
	1    7650 750 
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C4
U 1 1 5A8F89AE
P 6500 1700
F 0 "C4" H 6510 1770 50  0000 L CNN
F 1 "0.1uF" H 6510 1620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6500 1700 50  0001 C CNN
F 3 "" H 6500 1700 50  0001 C CNN
	1    6500 1700
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x06 J5
U 1 1 5A848BA2
P 10950 3350
F 0 "J5" H 10950 3650 50  0000 C CNN
F 1 "M1" H 10950 2950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 10950 3350 50  0001 C CNN
F 3 "" H 10950 3350 50  0001 C CNN
	1    10950 3350
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x06 J6
U 1 1 5A848CA8
P 10950 4850
F 0 "J6" H 10950 5150 50  0000 C CNN
F 1 "M2" H 10950 4450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 10950 4850 50  0001 C CNN
F 3 "" H 10950 4850 50  0001 C CNN
	1    10950 4850
	1    0    0    -1  
$EndComp
Text Label 10350 3150 0    60   ~ 0
M1+
Text Label 10350 3250 0    60   ~ 0
M1-
Text Label 10350 3550 0    60   ~ 0
E1_A
Text Label 10350 3650 0    60   ~ 0
E1_B
Text Label 10350 4650 0    60   ~ 0
M2+
Text Label 10350 4750 0    60   ~ 0
M2-
Text Label 10350 5050 0    60   ~ 0
E2_A
Text Label 10350 5150 0    60   ~ 0
E2_B
$Comp
L +3.3V #PWR010
U 1 1 5A8715F3
P 10650 3000
F 0 "#PWR010" H 10650 2850 50  0001 C CNN
F 1 "+3.3V" H 10650 3140 50  0000 C CNN
F 2 "" H 10650 3000 50  0001 C CNN
F 3 "" H 10650 3000 50  0001 C CNN
	1    10650 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5A872E4E
P 10650 3800
F 0 "#PWR011" H 10650 3550 50  0001 C CNN
F 1 "GND" H 10650 3650 50  0000 C CNN
F 2 "" H 10650 3800 50  0001 C CNN
F 3 "" H 10650 3800 50  0001 C CNN
	1    10650 3800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR012
U 1 1 5A873E6B
P 10650 4500
F 0 "#PWR012" H 10650 4350 50  0001 C CNN
F 1 "+3.3V" H 10650 4640 50  0000 C CNN
F 2 "" H 10650 4500 50  0001 C CNN
F 3 "" H 10650 4500 50  0001 C CNN
	1    10650 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 5A8741AC
P 10650 5300
F 0 "#PWR013" H 10650 5050 50  0001 C CNN
F 1 "GND" H 10650 5150 50  0000 C CNN
F 2 "" H 10650 5300 50  0001 C CNN
F 3 "" H 10650 5300 50  0001 C CNN
	1    10650 5300
	1    0    0    -1  
$EndComp
Text Label 9900 4500 2    60   ~ 0
E2_A
Text Label 9900 4600 2    60   ~ 0
E2_B
Text Label 9900 4200 2    60   ~ 0
E1_A
Text Label 9900 4300 2    60   ~ 0
E1_B
Text Label 9900 2700 2    60   ~ 0
M1+
Text Label 9900 2800 2    60   ~ 0
M1-
Text Label 9900 3200 2    60   ~ 0
M2+
Text Label 9900 3300 2    60   ~ 0
M2-
$Comp
L QRD1114 U3
U 1 1 5A901541
P 9100 5900
F 0 "U3" H 8950 6100 50  0000 C CNN
F 1 "QRD1114" H 9250 5700 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9100 5700 50  0001 C CNN
F 3 "" H 9100 6000 50  0001 C CNN
	1    9100 5900
	-1   0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5A902C72
P 9500 5450
F 0 "R10" V 9580 5450 50  0000 C CNN
F 1 "100" V 9500 5450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 9500 5450 50  0001 C CNN
F 3 "" H 9500 5450 50  0001 C CNN
	1    9500 5450
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5A902E7B
P 9500 6100
F 0 "#PWR014" H 9500 5850 50  0001 C CNN
F 1 "GND" H 9500 5950 50  0000 C CNN
F 2 "" H 9500 6100 50  0001 C CNN
F 3 "" H 9500 6100 50  0001 C CNN
	1    9500 6100
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR015
U 1 1 5A903294
P 9500 5200
F 0 "#PWR015" H 9500 5050 50  0001 C CNN
F 1 "+3.3V" H 9500 5340 50  0000 C CNN
F 2 "" H 9500 5200 50  0001 C CNN
F 3 "" H 9500 5200 50  0001 C CNN
	1    9500 5200
	-1   0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5A9039BF
P 8700 5450
F 0 "R9" V 8780 5450 50  0000 C CNN
F 1 "10k" V 8700 5450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 8700 5450 50  0001 C CNN
F 3 "" H 8700 5450 50  0001 C CNN
	1    8700 5450
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR016
U 1 1 5A903BF8
P 8700 5200
F 0 "#PWR016" H 8700 5050 50  0001 C CNN
F 1 "+3.3V" H 8700 5340 50  0000 C CNN
F 2 "" H 8700 5200 50  0001 C CNN
F 3 "" H 8700 5200 50  0001 C CNN
	1    8700 5200
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5A903D1A
P 8700 6100
F 0 "#PWR017" H 8700 5850 50  0001 C CNN
F 1 "GND" H 8700 5950 50  0000 C CNN
F 2 "" H 8700 6100 50  0001 C CNN
F 3 "" H 8700 6100 50  0001 C CNN
	1    8700 6100
	-1   0    0    -1  
$EndComp
Text Label 8100 4200 0    60   ~ 0
E1_A_Cmp
Text Label 8100 4300 0    60   ~ 0
E1_B_Cmp
Text Label 8100 4500 0    60   ~ 0
E2_A_Cmp
Text Label 8100 4600 0    60   ~ 0
E2_B_Cmp
Text Label 6050 2700 2    60   ~ 0
E1_A_Cmp
Text Label 6050 2600 2    60   ~ 0
E1_B_Cmp
Text Label 6050 2500 2    60   ~ 0
E2_A_Cmp
Text Label 6050 2400 2    60   ~ 0
E2_B_Cmp
Text Label 6050 3100 2    60   ~ 0
E1_A_Cmp
Text Label 3800 1900 0    60   ~ 0
E1_B_Cmp
Text Label 3800 2000 0    60   ~ 0
E2_A_Cmp
Text Label 3800 2100 0    60   ~ 0
E2_B_Cmp
Text Label 8100 2400 0    60   ~ 0
STBY
Text Label 8100 2600 0    60   ~ 0
PWM1
Text Label 8100 2700 0    60   ~ 0
M1_FW
Text Label 8100 2800 0    60   ~ 0
M1_BK
Text Label 8100 2900 0    60   ~ 0
M1_I
Text Label 8100 3100 0    60   ~ 0
PWM2
Text Label 8100 3200 0    60   ~ 0
M2_FW
Text Label 8100 3300 0    60   ~ 0
M2_BK
Text Label 8100 3400 0    60   ~ 0
M2_I
Text Label 8100 3600 0    60   ~ 0
S1_PWM
Text Label 8100 3700 0    60   ~ 0
S2_PWM
Text Label 3800 1800 0    60   ~ 0
M1_FW
Text Label 3800 1700 0    60   ~ 0
M1_BK
Text Label 3800 2800 0    60   ~ 0
M2_FW
Text Label 3800 2600 0    60   ~ 0
M2_BK
Text Label 6050 2300 2    60   ~ 0
M1_I
Text Label 3800 1600 0    60   ~ 0
M2_I
Text Label 1900 1150 2    60   ~ 0
BAT_REF
Text Label 6050 1800 2    60   ~ 0
BAT_REF
Text Label 8150 5800 0    60   ~ 0
OBJ_SENSE
Text Label 6050 1900 2    60   ~ 0
OBJ_SENSE
Text Label 3800 3000 0    60   ~ 0
PWM1
Text Label 3800 3100 0    60   ~ 0
PWM2
Text Label 3800 2400 0    60   ~ 0
S1_PWM
Text Label 3800 2500 0    60   ~ 0
S2_PWM
Text Label 6050 1700 2    60   ~ 0
STM_RX
Text Label 6050 1600 2    60   ~ 0
STM_TX
Text Label 8100 1500 0    60   ~ 0
SWDIO
Text Label 8100 1600 0    60   ~ 0
SWD_CLK
Text Label 6050 2900 2    60   ~ 0
SWDIO
Text Label 6050 3000 2    60   ~ 0
SWD_CLK
Text Label 3800 2700 0    60   ~ 0
STBY
Text Label 6050 3300 2    60   ~ 0
LASER_EN
Text Label 6050 2000 2    60   ~ 0
LIGHT_EN
Text Label 6150 6350 2    60   ~ 0
INT1
Text Label 6150 6450 2    60   ~ 0
INT2
Text Label 3800 2900 0    60   ~ 0
INT1
Text Label 6050 2800 2    60   ~ 0
INT2
$Comp
L R R4
U 1 1 5AA02EE0
P 2300 1850
F 0 "R4" V 2380 1850 50  0000 C CNN
F 1 "3.9k" V 2300 1850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2300 1850 50  0001 C CNN
F 3 "" H 2300 1850 50  0001 C CNN
	1    2300 1850
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5AA0301C
P 2500 1850
F 0 "R6" V 2580 1850 50  0000 C CNN
F 1 "3.9k" V 2500 1850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2500 1850 50  0001 C CNN
F 3 "" H 2500 1850 50  0001 C CNN
	1    2500 1850
	1    0    0    -1  
$EndComp
Text Label 1900 2300 0    60   ~ 0
SDA
Text Label 1900 2200 0    60   ~ 0
SCL
Text Label 6050 3500 2    60   ~ 0
USER_LED
Text Label 6050 3400 2    60   ~ 0
USER_BTN
Wire Wire Line
	5150 7250 5150 7300
Wire Wire Line
	5150 7300 5250 7300
Wire Wire Line
	5250 7250 5250 7350
Connection ~ 5250 7300
Wire Wire Line
	5250 5550 5250 6050
Wire Wire Line
	5250 5950 5150 5950
Wire Wire Line
	5150 5950 5150 6050
Connection ~ 5250 5950
Wire Wire Line
	5250 5600 5800 5600
Wire Wire Line
	5500 5600 5500 5650
Connection ~ 5250 5600
Wire Wire Line
	5800 5600 5800 5650
Connection ~ 5500 5600
Wire Wire Line
	4550 6450 4450 6450
Wire Wire Line
	4450 6350 4450 7350
Wire Wire Line
	4550 6550 4450 6550
Connection ~ 4450 6550
Wire Wire Line
	5750 6350 6150 6350
Wire Wire Line
	5750 6450 6150 6450
Connection ~ 6900 1400
Wire Wire Line
	10750 3350 10650 3350
Wire Wire Line
	10650 3350 10650 3000
Wire Wire Line
	10750 3450 10650 3450
Wire Wire Line
	10650 3450 10650 3800
Wire Wire Line
	10750 4850 10650 4850
Wire Wire Line
	10650 4850 10650 4500
Wire Wire Line
	10750 4950 10650 4950
Wire Wire Line
	10650 4950 10650 5300
Wire Wire Line
	10750 4750 10350 4750
Wire Wire Line
	10750 4650 10350 4650
Wire Wire Line
	10750 5050 10350 5050
Wire Wire Line
	10750 5150 10350 5150
Wire Wire Line
	10750 3150 10350 3150
Wire Wire Line
	10350 3250 10750 3250
Wire Wire Line
	10750 3550 10350 3550
Wire Wire Line
	10350 3650 10750 3650
Wire Wire Line
	9600 4200 9900 4200
Wire Wire Line
	9600 4300 9900 4300
Wire Wire Line
	9600 4500 9900 4500
Wire Wire Line
	9600 4600 9900 4600
Wire Wire Line
	9600 2700 9900 2700
Wire Wire Line
	9600 2800 9900 2800
Wire Wire Line
	9600 3200 9900 3200
Wire Wire Line
	9600 3300 9900 3300
Wire Wire Line
	9500 5800 9400 5800
Wire Wire Line
	8150 5800 8800 5800
Connection ~ 8700 5800
Wire Wire Line
	8100 4200 8600 4200
Wire Wire Line
	8100 4300 8600 4300
Wire Wire Line
	8100 4500 8600 4500
Wire Wire Line
	8100 4600 8600 4600
Wire Wire Line
	5500 2400 6050 2400
Wire Wire Line
	5500 2500 6050 2500
Wire Wire Line
	5500 2600 6050 2600
Wire Wire Line
	5500 2700 6050 2700
Wire Wire Line
	3800 1900 4350 1900
Wire Wire Line
	5500 3100 6050 3100
Wire Wire Line
	4350 2000 3800 2000
Wire Wire Line
	4350 2100 3800 2100
Wire Wire Line
	8600 3700 8100 3700
Wire Wire Line
	8100 3600 8600 3600
Wire Wire Line
	8600 3400 8100 3400
Wire Wire Line
	8100 3300 8600 3300
Wire Wire Line
	8600 3200 8100 3200
Wire Wire Line
	8100 3100 8600 3100
Wire Wire Line
	8600 2900 8100 2900
Wire Wire Line
	8100 2800 8600 2800
Wire Wire Line
	8600 2700 8100 2700
Wire Wire Line
	8100 2600 8600 2600
Wire Wire Line
	8600 2400 8100 2400
Wire Wire Line
	5500 3300 6050 3300
Wire Wire Line
	5500 3400 6050 3400
Wire Wire Line
	5500 3500 6050 3500
Wire Wire Line
	4350 3300 3800 3300
Wire Wire Line
	5500 1600 6050 1600
Wire Wire Line
	5500 1700 6050 1700
Wire Wire Line
	5500 1800 6050 1800
Wire Wire Line
	5500 1900 6050 1900
Wire Wire Line
	1450 1150 1900 1150
Wire Wire Line
	4350 3100 3800 3100
Wire Wire Line
	4350 3000 3800 3000
Wire Wire Line
	4350 2400 3800 2400
Wire Wire Line
	3800 2500 4350 2500
Wire Wire Line
	8600 1800 8100 1800
Wire Wire Line
	8100 1900 8600 1900
Wire Wire Line
	4350 2700 3800 2700
Wire Wire Line
	4350 2800 3800 2800
Wire Wire Line
	7750 1500 8600 1500
Wire Wire Line
	7550 1600 8600 1600
Wire Wire Line
	5500 2900 6050 2900
Wire Wire Line
	5500 3000 6050 3000
Wire Wire Line
	4350 3400 3800 3400
Wire Wire Line
	4350 2600 3800 2600
Wire Wire Line
	4350 2900 3800 2900
Wire Wire Line
	4350 1600 3800 1600
Wire Wire Line
	5500 2800 6050 2800
Connection ~ 3450 1400
Wire Wire Line
	3450 1300 3450 1450
Wire Wire Line
	2300 2100 2300 2200
Connection ~ 2300 2200
Wire Wire Line
	2500 2100 2500 2300
Connection ~ 2500 2300
Wire Wire Line
	2300 1400 2300 1600
Wire Wire Line
	5500 1400 8600 1400
Wire Wire Line
	4350 1700 3800 1700
Wire Wire Line
	4350 1800 3800 1800
Wire Wire Line
	9500 5700 9500 5800
Wire Wire Line
	9500 6100 9500 6000
Wire Wire Line
	9500 6000 9400 6000
Wire Wire Line
	8700 5700 8700 5800
Wire Wire Line
	8800 6000 8700 6000
Wire Wire Line
	8700 6000 8700 6100
$Comp
L GND #PWR018
U 1 1 5AA4FFDC
P 1800 7200
F 0 "#PWR018" H 1800 6950 50  0001 C CNN
F 1 "GND" H 1800 7050 50  0000 C CNN
F 2 "" H 1800 7200 50  0001 C CNN
F 3 "" H 1800 7200 50  0001 C CNN
	1    1800 7200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR019
U 1 1 5AA515AE
P 1800 6050
F 0 "#PWR019" H 1800 5900 50  0001 C CNN
F 1 "+3.3V" H 1800 6190 50  0000 C CNN
F 2 "" H 1800 6050 50  0001 C CNN
F 3 "" H 1800 6050 50  0001 C CNN
	1    1800 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5950 2400 6400
Text Label 2400 5950 3    60   ~ 0
USER_LED
Wire Wire Line
	1800 6050 1800 6400
$Comp
L R R1
U 1 1 5A8537C9
P 1650 3700
F 0 "R1" V 1730 3700 50  0000 C CNN
F 1 "10k" V 1650 3700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 1650 3700 50  0001 C CNN
F 3 "" H 1650 3700 50  0001 C CNN
	1    1650 3700
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A853930
P 2000 3350
F 0 "R3" V 2080 3350 50  0000 C CNN
F 1 "10k" V 2000 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2000 3350 50  0001 C CNN
F 3 "" H 2000 3350 50  0001 C CNN
	1    2000 3350
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C1
U 1 1 5A85AF64
P 2350 3700
F 0 "C1" H 2360 3770 50  0000 L CNN
F 1 "0.1uF" H 2360 3620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2350 3700 50  0001 C CNN
F 3 "" H 2350 3700 50  0001 C CNN
	1    2350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3350 1750 3350
Wire Wire Line
	1650 3350 1650 3450
Connection ~ 1650 3350
Wire Wire Line
	1150 3350 1050 3350
Wire Wire Line
	1050 3350 1050 3050
Wire Wire Line
	2250 3350 2850 3350
Wire Wire Line
	2350 3350 2350 3600
Wire Wire Line
	2350 3800 2350 4200
Wire Wire Line
	2350 4050 1650 4050
Wire Wire Line
	1650 4050 1650 3950
$Comp
L GND #PWR020
U 1 1 5A85FDD2
P 2350 4200
F 0 "#PWR020" H 2350 3950 50  0001 C CNN
F 1 "GND" H 2350 4050 50  0000 C CNN
F 2 "" H 2350 4200 50  0001 C CNN
F 3 "" H 2350 4200 50  0001 C CNN
	1    2350 4200
	1    0    0    -1  
$EndComp
Connection ~ 2350 4050
Connection ~ 2350 3350
Text Label 2850 3350 2    60   ~ 0
USER_BTN
Wire Wire Line
	6900 1300 6900 1500
$Comp
L R R8
U 1 1 5A86EB29
P 6900 1050
F 0 "R8" V 6980 1050 50  0000 C CNN
F 1 "10k" V 6900 1050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 6900 1050 50  0001 C CNN
F 3 "" H 6900 1050 50  0001 C CNN
	1    6900 1050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR021
U 1 1 5A86EE66
P 6900 800
F 0 "#PWR021" H 6900 650 50  0001 C CNN
F 1 "+3.3V" H 6900 940 50  0000 C CNN
F 2 "" H 6900 800 50  0001 C CNN
F 3 "" H 6900 800 50  0001 C CNN
	1    6900 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1400 6500 1600
Connection ~ 6500 1400
Wire Wire Line
	6500 1800 6500 2000
Wire Wire Line
	6500 2000 6900 2000
Wire Wire Line
	6900 1900 6900 2100
Connection ~ 6900 2000
Wire Wire Line
	7750 950  7750 1500
Wire Wire Line
	7550 1600 7550 950 
Wire Wire Line
	7850 1400 7850 950 
Connection ~ 7850 1400
Wire Wire Line
	7450 950  7450 1050
Wire Wire Line
	7450 1050 7200 1050
Wire Wire Line
	7200 1050 7200 800 
Wire Wire Line
	7650 950  7650 1800
$Comp
L GND #PWR022
U 1 1 5A87403E
P 7650 1800
F 0 "#PWR022" H 7650 1550 50  0001 C CNN
F 1 "GND" H 7650 1650 50  0000 C CNN
F 2 "" H 7650 1800 50  0001 C CNN
F 3 "" H 7650 1800 50  0001 C CNN
	1    7650 1800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR023
U 1 1 5A87424B
P 7200 800
F 0 "#PWR023" H 7200 650 50  0001 C CNN
F 1 "+3.3V" H 7200 940 50  0000 C CNN
F 2 "" H 7200 800 50  0001 C CNN
F 3 "" H 7200 800 50  0001 C CNN
	1    7200 800 
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5A8CA596
P 2400 6650
F 0 "R5" V 2480 6650 50  0000 C CNN
F 1 "470" V 2400 6650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2400 6650 50  0001 C CNN
F 3 "" H 2400 6650 50  0001 C CNN
	1    2400 6650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 5A8EC9EF
P 2400 7200
F 0 "#PWR024" H 2400 6950 50  0001 C CNN
F 1 "GND" H 2400 7050 50  0000 C CNN
F 2 "" H 2400 7200 50  0001 C CNN
F 3 "" H 2400 7200 50  0001 C CNN
	1    2400 7200
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 5A8EF256
P 2400 7050
F 0 "D2" H 2400 7150 50  0000 C CNN
F 1 "GREEN" H 2400 6950 50  0000 C CNN
F 2 "LEDs:LED_0603_HandSoldering" H 2400 7050 50  0001 C CNN
F 3 "" H 2400 7050 50  0001 C CNN
	1    2400 7050
	0    -1   -1   0   
$EndComp
$Sheet
S 700  4800 800  600 
U 5A98B051
F0 "Lights" 60
F1 "Lights.sch" 60
F2 "LASER_EN" I R 1500 5050 60 
F3 "LIGHT_EN" I R 1500 5150 60 
$EndSheet
Wire Wire Line
	1500 5050 2000 5050
Wire Wire Line
	1500 5150 2000 5150
Text Label 2000 5050 2    60   ~ 0
LASER_EN
Text Label 2000 5150 2    60   ~ 0
LIGHT_EN
Wire Wire Line
	4650 650  4250 650 
Wire Wire Line
	4650 750  4250 750 
Wire Wire Line
	5150 650  5550 650 
Wire Wire Line
	5550 750  5150 750 
Text Label 4250 650  0    60   ~ 0
STM_TX
Text Label 4250 750  0    60   ~ 0
STM_RX
Text Label 8100 1800 0    60   ~ 0
Pi_TX
Text Label 8100 1900 0    60   ~ 0
Pi_RX
Text Label 5550 750  2    60   ~ 0
Pi_TX
Text Label 5550 650  2    60   ~ 0
Pi_RX
$Comp
L GND #PWR025
U 1 1 5A9AD178
P 4500 950
F 0 "#PWR025" H 4500 700 50  0001 C CNN
F 1 "GND" H 4500 800 50  0000 C CNN
F 2 "" H 4500 950 50  0001 C CNN
F 3 "" H 4500 950 50  0001 C CNN
	1    4500 950 
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J3
U 1 1 5A9EA13C
P 5650 4650
F 0 "J3" H 5650 4750 50  0000 C CNN
F 1 "Breakout_B" H 5650 4450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5650 4650 50  0001 C CNN
F 3 "" H 5650 4650 50  0001 C CNN
	1    5650 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4850 4800 4850
Wire Wire Line
	4250 4950 4800 4950
$Comp
L +3.3V #PWR026
U 1 1 5AA017ED
P 4350 4500
F 0 "#PWR026" H 4350 4350 50  0001 C CNN
F 1 "+3.3V" H 4350 4640 50  0000 C CNN
F 2 "" H 4350 4500 50  0001 C CNN
F 3 "" H 4350 4500 50  0001 C CNN
	1    4350 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 5AA02710
P 4450 5100
F 0 "#PWR027" H 4450 4850 50  0001 C CNN
F 1 "GND" H 4450 4950 50  0000 C CNN
F 2 "" H 4450 5100 50  0001 C CNN
F 3 "" H 4450 5100 50  0001 C CNN
	1    4450 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4650 5150 4650
Wire Wire Line
	5150 4750 5450 4750
Text Label 5150 4650 0    60   ~ 0
INT2
Text Label 5150 4750 0    60   ~ 0
INT1
$Comp
L Conn_02x03_Odd_Even J2
U 1 1 5AA0DD04
P 4850 750
F 0 "J2" H 4900 950 50  0000 C CNN
F 1 "Conn_02x03" H 4900 550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 4850 750 50  0001 C CNN
F 3 "" H 4850 750 50  0001 C CNN
	1    4850 750 
	1    0    0    1   
$EndComp
Wire Wire Line
	4650 850  4500 850 
Wire Wire Line
	4500 850  4500 950 
$Comp
L GND #PWR028
U 1 1 5AA0E5B7
P 5300 950
F 0 "#PWR028" H 5300 700 50  0001 C CNN
F 1 "GND" H 5300 800 50  0000 C CNN
F 2 "" H 5300 950 50  0001 C CNN
F 3 "" H 5300 950 50  0001 C CNN
	1    5300 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 850  5300 850 
Wire Wire Line
	5300 850  5300 950 
Text Notes 4750 4400 0    60   ~ 0
Connectors for Breakout\nBoard / Debug
Wire Wire Line
	4550 6950 4350 6950
Wire Wire Line
	4350 6950 4350 6000
$Comp
L +3.3V #PWR029
U 1 1 5AA7AB6F
P 4350 6000
F 0 "#PWR029" H 4350 5850 50  0001 C CNN
F 1 "+3.3V" H 4350 6140 50  0000 C CNN
F 2 "" H 4350 6000 50  0001 C CNN
F 3 "" H 4350 6000 50  0001 C CNN
	1    4350 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6350 4450 6350
Connection ~ 4450 6450
$Comp
L Conn_01x04 J1
U 1 1 5AA8BD54
P 4050 4750
F 0 "J1" H 4050 4950 50  0000 C CNN
F 1 "Breakout_A" H 4050 4450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 4050 4750 50  0001 C CNN
F 3 "" H 4050 4750 50  0001 C CNN
	1    4050 4750
	-1   0    0    -1  
$EndComp
Text Label 4800 4850 2    60   ~ 0
SDA
Text Label 4800 4950 2    60   ~ 0
SCL
Text Label 3900 6750 0    60   ~ 0
SDA
Text Label 3900 6850 0    60   ~ 0
SCL
Wire Wire Line
	3900 6750 4550 6750
Wire Wire Line
	4550 6850 3900 6850
Wire Wire Line
	9600 1500 10100 1500
Wire Wire Line
	9600 1600 10100 1600
Text Label 10100 1500 2    60   ~ 0
SDA
Text Label 10100 1600 2    60   ~ 0
SCL
Wire Wire Line
	4250 4750 4350 4750
Wire Wire Line
	4350 4750 4350 4500
Wire Wire Line
	4250 4650 4450 4650
Wire Wire Line
	4450 4650 4450 5100
Wire Wire Line
	2300 1500 2500 1500
Connection ~ 2300 1500
Wire Wire Line
	2500 1500 2500 1600
Wire Wire Line
	3450 1400 4350 1400
$Comp
L +3.3V #PWR030
U 1 1 5AAB2FAD
P 3450 900
F 0 "#PWR030" H 3450 750 50  0001 C CNN
F 1 "+3.3V" H 3450 1040 50  0000 C CNN
F 2 "" H 3450 900 50  0001 C CNN
F 3 "" H 3450 900 50  0001 C CNN
	1    3450 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2200 4350 2200
Wire Wire Line
	4350 2300 1900 2300
Wire Wire Line
	5500 2100 6050 2100
Wire Wire Line
	5500 2000 6050 2000
Wire Wire Line
	5500 2200 6050 2200
Wire Wire Line
	5500 2300 6050 2300
$EndSCHEMATC
