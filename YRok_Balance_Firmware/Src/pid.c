#include "pid.h"
#include "uart.h"
#include "imu_control.h"
#include "motor.h"

// Hz
#define PID_FREQ 1000

// for x axis
volatile int32_t gyro_offset = 0xFFFFFDC3;

volatile double angle = -1;
double angle_offset = 0;
volatile int32_t target_angle = 0;    // target angle
volatile int32_t error = 0;         // error signal
volatile int32_t error_integral = 0;    // integrated error signal
volatile int32_t Kp = 800;            // proportional gain
volatile int32_t Ki = 10;            // integral gain
volatile int32_t Kd = 0;            // derivative gain
int32_t clamp = 3200;

int calibrate_gyro() {
  int gyro_sum = 0;

  for (int i = 0; i < 1000; i++) {
    HAL_Delay(1);
    int gyro_y = get_gy();
    gyro_sum += gyro_y;
  }

  gyro_offset = gyro_sum / 1000;

  transmit_string("gyro: ");
  transmit_hex(gyro_offset);
  transmit_char('\r');
  transmit_char('\n');
}

void init_pid() {
  RCC->APB1ENR |= RCC_APB1ENR_TIM6EN;

  TIM6->DIER |= TIM_DIER_UIE;
  TIM6->PSC = 47;
  TIM6->ARR = HAL_RCC_GetHCLKFreq() / (PID_FREQ * 48);

  NVIC_EnableIRQ(TIM6_DAC_IRQn);
  NVIC_SetPriority(TIM6_DAC_IRQn, 0);

  TIM6->CR1 |= TIM_CR1_CEN;
}

int PI_update(int32_t accel_x, int32_t gyro_y) {
  if (gyro_offset == -1) {
    calibrate_gyro();
  }

  gyro_y -= gyro_offset;
  gyro_y *= -1;

  //transmit_hex(accel_x);
  //transmit_char('\t');
  //transmit_hex(gyro_y);
  //transmit_char('\t');
  angle = ((0.98) * (angle + (((gyro_y / 131.0) / 100.0))) + (0.02 * (accel_x / 182.0)));
  //transmit_hex(angle);
  //transmit_char('\r');
  //transmit_char('\n');

  error = target_angle - (int32_t) (angle - angle_offset);

  /// Calculate integral portion of PI controller, write to "error_integral" variable
  error_integral += Ki * error;

  /// Clamp the value of the integral to a limited positive range
  if (error_integral < -clamp) {
    error_integral = -clamp;
  }
  if (error_integral > clamp) {
    error_integral = clamp;
  }

  /* Hint: The value clamp is needed to prevent excessive "windup" in the integral.
  *       You'll read more about this for the post-lab. The exact value is arbitrary
  *       but affects the PI tuning.
  *       Recommend that you clamp between 0 and 3200 (what is used in the lab solution)
  */

  /// Calculate proportional portion, add integral and write to "output" variable
  int32_t output = Kp * error + error_integral + Kd * gyro_y;

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
  output /= 64;

  /// Clamp the output value between 0 and 100
  if (output < -100) {
    output = -100;
  }
  if (output > 100) {
    output = 100;
  }

  return output;
}

void TIM6_DAC_IRQHandler(void) {
  int32_t accel_x = get_ax();
  int32_t gyro_y = get_gy();

  int32_t pwm = PI_update(accel_x, gyro_y);
  if (pwm < 0) {
    set_dir(MOTOR_LEFT, MOTOR_FORWARD);
    set_dir(MOTOR_RIGHT, MOTOR_FORWARD);
    set_speed(MOTOR_LEFT, -pwm);
    set_speed(MOTOR_RIGHT, -pwm);
  } else {
    set_dir(MOTOR_LEFT, MOTOR_BACKWARD);
    set_dir(MOTOR_RIGHT, MOTOR_BACKWARD);
    set_speed(MOTOR_LEFT, pwm);
    set_speed(MOTOR_RIGHT, pwm);
  }
}
