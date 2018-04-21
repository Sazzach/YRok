#ifndef PID_H_
#define PID_H_

#include "stm32f0xx.h"

/*
 * Returns the output pwm value the motors should be set to
 */
int PI_update(int32_t accel_x, int32_t gyro_y);

#endif
