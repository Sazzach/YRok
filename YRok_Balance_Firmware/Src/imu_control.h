#ifndef IMU_CONTROL_H_
#define IMU_CONTROL_H_

#include "stdint.h"

extern int16_t gyro_accel_data[4];
//extern int imu_ready;

/*	Initializes all the necessary pins for the I2C communication with the IMU
 *	Also communicates with the IMU to configure its settings for our use
 *	Returns a 0 if successful, a 1 otherwise
 */
int imu_init(void);

/* A helper function for I2C communication, waits until a single byte trasmission is complete
 * Returns 1 if the byte was not acknowledged, 0 otherwise.
 */
int write_wait(void);

/* Just a check to see if I can read the who_am_i register correctly
 */
int who_am_i(void);

/*	The handler for an interrupt from the IMU when Gyro data is ready, at which time Accel data will also be ready
 *	Communicates with the IMU to gather the Y and Z of the Gyro and the X and Z of the Accel
 *	Places the gathered data into the gyro_accel_data array and raises the imu_ready flag
 */
 //EXTI4_15_IRQHandler
//int get_data(void);

// Gets the 2 bytes for the accelerometer's x
int16_t get_ax(void);

// Gets the 2 bytes for the gyroscope's y
int16_t get_gy();

// Gets the 2 bytes for the gyroscope's z
int16_t get_gz();

#endif
