#include "stm32f0xx.h"
#include "pid.h"

// for x axis
volatile int16_t target_acceleration = 0;    // target acceleration
volatile int16_t error = 0;         // error signal
volatile int16_t error_integral = 0;    // integrated error signal
volatile uint8_t Kp = 10;            // proportional gain
volatile uint8_t Ki = 5;            // integral gain

int PI_update(int16_t measured_acceleration) {
  error = target_acceleration - measured_acceleration;

  /// Calculate integral portion of PI controller, write to "error_integral" variable
  error_integral += Ki * error;

  /// Clamp the value of the integral to a limited positive range
  if (error_integral < 0) {
    error_integral = 0;
  }
  if (error_integral > 3200) {
    error_integral = 3200;
  }

  /* Hint: The value clamp is needed to prevent excessive "windup" in the integral.
  *       You'll read more about this for the post-lab. The exact value is arbitrary
  *       but affects the PI tuning.
  *       Recommend that you clamp between 0 and 3200 (what is used in the lab solution)
  */

  /// Calculate proportional portion, add integral and write to "output" variable
  int16_t output = Kp * error + error_integral;

  /* Because the calculated values for the PI controller are significantly larger than
  * the allowable range for duty cycle, you'll need to divide the result down into
  * an appropriate range. (Maximum integral clamp / X = 100% duty cycle)
  *
  * Hint: If you chose 3200 for the integral clamp you should divide by 32 (right shift by 5 bits),
  *       this will give you an output of 100 at maximum integral "windup".
  *
  * This division also turns the above calculations into pseudo fixed-point. This is because
  * the lowest 5 bits act as if they were below the decimal point until the division where they
  * were truncated off to result in an integer value.
  *
  * Technically most of this is arbitrary, in a real system you would want to use a fixed-point
  * math library. The main difference that these values make is the difference in the gain values
  * required for tuning.
  */

  /// Divide the output into the proper range for output adjustment
  output /= 32;

  /// Clamp the output value between 0 and 100
  if (output < -100) {
    output = -100;
  }
  if (output > 100) {
    output = 100;
  }

  return output;
}

