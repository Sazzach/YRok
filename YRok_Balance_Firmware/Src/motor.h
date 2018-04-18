#ifndef MOTOR_H
#define MOTOR_H

#include "stm32f0xx_hal.h"

#define MOTOR_STOP 0
#define MOTOR_FORWARD 1
#define MOTOR_BACKWARD 2

void init_motors();
void enable_motors();
void disable_motors();

void set_dir(int32_t motor, int32_t dir);
void set_speed(int32_t motor, uint32_t speed);

#endif
