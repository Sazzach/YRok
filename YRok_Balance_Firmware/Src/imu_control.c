#include "imu_control.h"
#include "stm32f0xx.h"

// The slave address
const uint8_t SLAVE = 0x6B;
int16_t gyro_accel_data[4];
//int imu_ready;
const char i2c_error = 'Q';

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
	//I2C1->TIMINGR |= (0x0 << 28) | (0x3 << 20) | (0x1 << 16) | (0x3 << 8) | (0x9);	
	I2C1->CR1 |= 0x01;	// Enable I2C1 with PE bit

	// Now to init configure the IMU
	// SLAVE contains the slave address and it needs to be shifted 1
	I2C1->CR2 = (SLAVE << 1);
	//Set 3 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x3 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return i2c_error;

	// TXDR is the next byte I would like to transmit
	// 0x10 is the address of CTRL1_XL
	I2C1->TXDR = 0x10;

	if(write_wait() == 1)
		return i2c_error;
	
	// 0x80 is what I want to set CTRL1_XL to
	I2C1->TXDR = 0x80;

	if(write_wait() == 1)
		return i2c_error;

	// 0x80 is also what I want to set the next address to (CTRL2_G at 0x11)
	I2C1->TXDR = 0x80;

	while(1)
	{ // Wait for transfer complete. Bit 6 is 1 when I've sent the # of bytes I want
		if(I2C1->ISR & I2C_ISR_TC)
			break;
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
		return i2c_error;

	// TXDR is the next byte I would like to transmit
	// 0x18 is the address of CTRL9_XL
	I2C1->TXDR = 0x18;

	if(write_wait() == 1)
		return i2c_error;
	
	// 0x28 is what I want to set CTRL9_XL to
	// 0x28 activates the Z and X in the Accelerometer
	I2C1->TXDR = 0x28;

	if(write_wait() == 1)
		return i2c_error;

	// 0x30 is what I want to set the next address to (CTRL10_C at 0x19)
	// 0x30 activavtes the Z and Y in the Gyroscope
	I2C1->TXDR = 0x30;

	while(1)
	{ // Wait for transfer complete. Bit 6 is 1 when I've sent the # of bytes I want
		if(I2C1->ISR & I2C_ISR_TC)
			break;
	}

	I2C1->CR2 |= (0x01 << 14);	//Set stop bit

	i = who_am_i();

	return i;
	//return 0;
}

int who_am_i()
{
	uint8_t i_am;
	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x1 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return i2c_error;

	// TXDR is the next byte I would like to transmit
	// 0x0F is the address of Who_am_i
	I2C1->TXDR = 0x0F;

	while(1)
	{ // Wait for transfer complete.
		if(I2C1->ISR & I2C_ISR_TC)
			break;
	}

	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to read and RD_WRN to read (1);
	I2C1->CR2 |= (0x1 << 16);
	I2C1->CR2 |= (0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit
				
	while(1)
	{
		if(I2C1->ISR & I2C_ISR_RXNE)
		{
			break;
		}
		if(I2C1->ISR & I2C_ISR_NACKF)
		{
			I2C1->ISR |= I2C_ISR_NACKF; 	// to clear the bit
			return i2c_error; // reading failed, so leave and try again next time
		}
	}

	i_am = I2C1->RXDR;

	// could wait for transfer complete here, but probably don't need to

	I2C1->CR2 |= (0x01 << 14);	//Set stop bit
	return i_am;
}

// reads X Accelerometer
int16_t get_ax()
{
	uint16_t i_am;
	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x1 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return i2c_error;

	// TXDR is the next byte I would like to transmit
	// 0x28 is the address of X Accel
	I2C1->TXDR = 0x28;

	while(1)
	{ // Wait for transfer complete.
		if(I2C1->ISR & I2C_ISR_TC)
			break;
	}

	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to read and RD_WRN to read (1);
	I2C1->CR2 |= (0x2 << 16);
	I2C1->CR2 |= (0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit
				
	while(1)
	{
		if(I2C1->ISR & I2C_ISR_RXNE)
		{
			break;
		}
		if(I2C1->ISR & I2C_ISR_NACKF)
		{
			I2C1->ISR |= I2C_ISR_NACKF; 	// to clear the bit
			return i2c_error; // reading failed, so leave and try again next time
		}
	}

	i_am = I2C1->RXDR;

	while(1)
	{
		if(I2C1->ISR & I2C_ISR_RXNE)
		{
			break;
		}
		if(I2C1->ISR & I2C_ISR_NACKF)
		{
			I2C1->ISR |= I2C_ISR_NACKF; 	// to clear the bit
			return i2c_error; // reading failed, so leave and try again next time
		}
	}

	i_am |= I2C1->RXDR << 8;

	// could wait for transfer complete here, but probably don't need to

	I2C1->CR2 |= (0x01 << 14);	//Set stop bit
	return i_am;
}

// reads Y Gyroscope
int16_t get_gy()
{
	uint16_t i_am;
	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x1 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return i2c_error;

	// TXDR is the next byte I would like to transmit
	// 0x24 is the address of Y gyro
	I2C1->TXDR = 0x24;

	while(1)
	{ // Wait for transfer complete.
		if(I2C1->ISR & I2C_ISR_TC)
			break;
	}

	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to read and RD_WRN to read (1);
	I2C1->CR2 |= (0x2 << 16);
	I2C1->CR2 |= (0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit
				
	while(1)
	{
		if(I2C1->ISR & I2C_ISR_RXNE)
		{
			break;
		}
		if(I2C1->ISR & I2C_ISR_NACKF)
		{
			I2C1->ISR |= I2C_ISR_NACKF; 	// to clear the bit
			return i2c_error; // reading failed, so leave and try again next time
		}
	}

	i_am = I2C1->RXDR;

	while(1)
	{
		if(I2C1->ISR & I2C_ISR_RXNE)
		{
			break;
		}
		if(I2C1->ISR & I2C_ISR_NACKF)
		{
			I2C1->ISR |= I2C_ISR_NACKF; 	// to clear the bit
			return i2c_error; // reading failed, so leave and try again next time
		}
	}

	i_am |= I2C1->RXDR << 8;

	// could wait for transfer complete here, but probably don't need to

	I2C1->CR2 |= (0x01 << 14);	//Set stop bit
	return i_am;
}

// reads Z Gyroscope
int16_t get_gz()
{
	uint16_t i_am;
	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to send and RD_WRN to write (0);
	I2C1->CR2 |= (0x1 << 16);
	I2C1->CR2 &= ~(0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit

	if(write_wait() == 1)
		return i2c_error;

	// TXDR is the next byte I would like to transmit
	// 0x26 is the address of Z gyro
	I2C1->TXDR = 0x26;

	while(1)
	{ // Wait for transfer complete.
		if(I2C1->ISR & I2C_ISR_TC)
			break;
	}

	I2C1->CR2 = (SLAVE << 1);
	//Set 1 bytes to read and RD_WRN to read (1);
	I2C1->CR2 |= (0x2 << 16);
	I2C1->CR2 |= (0x1 << 10);
	I2C1->CR2 |= (0x1 << 13);	// Set Start Bit
				
	while(1)
	{
		if(I2C1->ISR & I2C_ISR_RXNE)
		{
			break;
		}
		if(I2C1->ISR & I2C_ISR_NACKF)
		{
			I2C1->ISR |= I2C_ISR_NACKF; 	// to clear the bit
			return i2c_error; // reading failed, so leave and try again next time
		}
	}

	i_am = I2C1->RXDR;

	while(1)
	{
		if(I2C1->ISR & I2C_ISR_RXNE)
		{
			break;
		}
		if(I2C1->ISR & I2C_ISR_NACKF)
		{
			I2C1->ISR |= I2C_ISR_NACKF; 	// to clear the bit
			return i2c_error; // reading failed, so leave and try again next time
		}
	}

	i_am |= I2C1->RXDR << 8;

	// could wait for transfer complete here, but probably don't need to

	I2C1->CR2 |= (0x01 << 14);	//Set stop bit
	return i_am;
}

int write_wait()
{
	// wait for write to complete or for NACK
	while(1)
	{
		if(I2C1->ISR & I2C_ISR_TXIS)
		{
			// Transfer complete
			return 0;
		}
		if(I2C1->ISR & I2C_ISR_NACKF)
		{
			I2C1->ISR |= I2C_ISR_NACKF; 	// to clear the bit
			// Got a NACK, which means the device did not respond
			return 1;
		}
	}
}
