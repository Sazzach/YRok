#include "imu_control.h"
#include "stm32f0xx.h"

// The slave address
const uint8_t SLAVE = 0x6B;
extern int16_t gyro_accel_data[4];
extern uint8_t imu_ready;

/*	
 *
 *
 *
 *
 *	returns a 0 if completed correctly, 1 otherwise
 */
int imu_init()
{
	int i;
	imu_ready = 0;
	for(i = 0; i < 4; i++)
		gyro_accel_data[i] = 0;

	RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
	RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;
	
	//PB7 to AF1 mode to be I2C1_SDA
	GPIOB->MODER |= (0x2 << 7*2);	//Set AF mode
	GPIOB->AFR[0] |= (0x1 << 7*4);	//Select AF1
	GPIOB->OTYPER |= (0x1 << 7);	//Set to open-drain
	
	//PB6 to AF5 mode to be I2C1_SCL
	GPIOB->MODER |= (0x2 << 6*2);	//Set AF mode
	GPIOB->AFR[0] |= (0x1 << 6*4);	//Select AF1
	GPIOB->OTYPER |= (0x1 << 6);	//Set to open-drain

	// Configure the timing register for 400 KHz (fast mode) from the 48MHz clock
	// PRESC to 0x5, SCLDEL to 0x3, SDADEL to 0x3, SCLH to 0x3, SCLL to 0x9
	I2C1->TIMINGR |= (0x5 << 28) | (0x3 << 20) | (0x3 << 16) | (0x3 << 8) | (0x9);	
	I2C1->CR1 |= 0x01;	// Enable I2C1 with PE bit

	// Now to init configure the IMU
	// SLAVE contains the slave address and it needs to be shifted 1
	I2C1->CR2 = (SLAVE << 1);
	//Set 3 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x3 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return 1;

	// TXDR is the next byte I would like to transmit
	// 0x10 is the address of CTRL1_XL
	I2C1->TXDR = 0x10;

	if(write_wait() == 1)
		return 1;
	
	// 0x80 is what I want to set CTRL1_XL to
	I2C1->TXDR = 0x80;

	if(write_wait() == 1)
		return 1;

	// 0x80 is also what I want to set the next address to (CTRL2_G at 0x11)
	I2C1->TXDR = 0x80;

	while(!(I2C1->ISR & (0x01 << 6)))
	{ // Wait for transfer complete. Bit 6 is 1 when I've sent the # of bytes I want
	}					
	I2C1->CR2 |= (0x01 << 14);	//Set stop bit

	
	/* Now do it all again to set CTRL9_XL and CTRL10_C */

	// SLAVE contains the slave address and it needs to be shifted 1
	I2C1->CR2 = (SLAVE << 1);
	//Set 3 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x3 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return 1;

	// TXDR is the next byte I would like to transmit
	// 0x18 is the address of CTRL9_XL
	I2C1->TXDR = 0x18;

	if(write_wait() == 1)
		return 1;
	
	// 0x28 is what I want to set CTRL9_XL to
	// 0x28 activates the Z and X in the Accelerometer
	I2C1->TXDR = 0x30;

	if(write_wait() == 1)
		return 1;

	// 0x30 is what I want to set the next address to (CTRL10_C at 0x19)
	// 0x30 activavtes the Z and Y in the Gyroscope
	I2C1->TXDR = 0x30;

	while(!(I2C1->ISR & (0x01 << 6)))
	{ // Wait for transfer complete. Bit 6 is 1 when I've sent the # of bytes I want
	}

	I2C1->CR2 |= (0x01 << 14);	//Set stop bit

	/* Now enable the interrupts */
	EXTI->IMR |= EXTI_IMR_IM13;	// Activate line 13 for EXTI
	EXTI->RTSR |= EXTI_RTSR_RT13;	// Activate positive edge trigger

	SYSCFG->EXTICR[3] |= SYSCFG_EXTICR1_EXTI0_PB;
	NVIC_EnableIRQ(EXTI4_15_IRQn);
	NVIC_SetPriority(EXTI4_15_IRQn, 1); // 1 is the highest priority

	// Set up to interrupt when Gyro is ready -- accel should also be ready then
	// SLAVE contains the slave address and it needs to be shifted 1
	I2C1->CR2 = (SLAVE << 1);
	//Set 2 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x2 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return 1;

	// TXDR is the next byte I would like to transmit
	// 0x0D is the address of INT1_CTRL
	I2C1->TXDR = 0x0D;

	if(write_wait() == 1)
		return 1;
	
	// 0x02 is what I want to set INT1_CTRL to
	// 0x02 activates the interrupt for the Gyro data ready
	I2C1->TXDR = 0x02;

	while(!(I2C1->ISR & (0x01 << 6)))
	{ // Wait for transfer complete. Bit 6 is 1 when I've sent the # of bytes I want
	}

	I2C1->CR2 |= (0x01 << 14);	//Set stop bit

	return who_am_i();

	//return 0;
}

int who_am_i()
{
	uint8_t i_am;
	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x2 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return 1;

	// TXDR is the next byte I would like to transmit
	// 0x0F is the address of Who_am_i
	I2C1->TXDR = 0x0F;

	while(!(I2C1->ISR & (0x01 << 6)))
	{ // Wait for transfer complete. Bit 6 is 1 when I've sent the # of bytes I want
	}

	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to read and RD_WRN to read (1);
	I2C1->CR2 |= (0x1 << 16);
	I2C1->CR2 |= (0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit
				
	while(true)
	{
		if(I2C1->ISR & (0x01 << 2))
		{
			break;
		}
		if(I2C1->ISR & (0x01 << 4))
		{
			return 1; // reading failed, so leave and try again next time
		}
	}

	i_am = I2C1->RXDR;
	I2C1->CR2 |= (0x01 << 14);	//Set stop bit
	if(i_am == 0x69)
	    GPIOC->ODR |= (0x1 << 15);
	else
		GPIOC->ODR &= (0x1 << 15);

	return 0;
}

void EXTI4_15_IRQHandler()
{
	// Read the Z and X on Accel, Z and Y on Gyro
	uint16_t remaining = 10;
	uint16_t in_data[10];
	int16_t* point = &(int16_t)remaining;


	I2C1->CR2 = (SLAVE << 1);
	//Set 1 byte to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x01 << 16);
	I2C1->CR2 &= ~(0x01 << 10);
	I2C1->CR2 |= (0x01 << 13);	// Set Start Bit
	
	if(write_wait() == 1)
		return;	// Failed to connect, try again next time

	//0x24 to request start of Y Gyro data
	I2C1->TXDR = 0x24;

	while(!(I2C1->ISR & (0x01 << 6)))
	{	//Wait for transfer complete
	}			
				
	I2C1->CR2 = (SLAVE << 1);
	//Set 10 bytes to read and RD_WRN to read (1);
	//The first 6 bytes are the upper and lower bytes for the Y and Z of Gyro and X of Accel
	//These six bytes are in contiguous registers
	//The next 2 bytes are not being used, but it is quicker to read them and the last 2 as well
	//The last 2 bytes are the Z of Accel
	I2C1->CR2 |= (0xA << 16);
	I2C1->CR2 |= (0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit
				
	while(remaining > 0)
	{
		if(I2C1->ISR & (0x01 << 2))
		{
			remaining--;
			in_data[remaining] = I2C1->RXDR;
		}
		if(I2C1->ISR & (0x01 << 4))
		{
			return; // reading failed, so leave and try again next time
		}
	}
	
	I2C1->CR2 |= (0x01 << 14);	//Set stop bit


	// I read in the data as uint16_t, and I want interperet them as int16_t
	// point is a pointer to int16_t and remaining is uint16_t, so I can just use those vars
	remaining = in_data[9] + (in_data[8] << 8);	// 8 and 9 contain Y_Gyro
	gyro_accel_data[0] = *point;
	remaining = in_data[7] + (in_data[6] << 8);	// 6 and 7 contain Z Gyro
	gyro_accel_data[1] = *point;
	remaining = in_data[5] + (in_data[4] << 8);	// 5 and 4 contain X Accel
	gyro_accel_data[2] = *point;	
	remaining = in_data[1] + (in_data[0] << 8);	// 1 and 0 contain Z Accel
	gyro_accel_data[3] = *point;

	imu_ready = 1;
}

int write_wait()
{
	// wait for write to complete or for NACK
	while(1)
	{
		if(I2C1->ISR & (0x01 << 1))
		{
			// Transfer complete
			return 0;
		}
		if(I2C1->ISR & (0x01 << 4))
		{
			I2C1->ISR |= (0x01 << 4); 	// to clear the bit
			// Got a NACK, which means the device did not respond
			return 1;
		}
	}
}