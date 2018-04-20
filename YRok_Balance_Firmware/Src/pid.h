#ifndef PID_H_
#define PID_H_

/*
 * Returns the output pwm value the motors should be set to
 */
int PI_update(int16_t measured_acceleration);

#endif
