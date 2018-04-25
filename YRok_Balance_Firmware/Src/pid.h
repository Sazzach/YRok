#ifndef PID_H_
#define PID_H_

#include "stm32f0xx.h"

extern volatile double speed;
extern volatile double target_angle;
extern volatile double angle;
extern volatile int en_pos;
extern volatile double orientation;

/*
 * Returns the output pwm value the motors should be set to
 */
int PI_update(int32_t accel_x, int32_t gyro_y);

void init_pid();

#endif
