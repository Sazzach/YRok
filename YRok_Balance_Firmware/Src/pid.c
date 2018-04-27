#include "pid.h"
#include "uart.h"
#include "imu_control.h"
#include "motor.h"

// Hz
#define PID_FREQ 500 

// for x axis
volatile int32_t gyro_y_offset = 0xFFFFFDC3;
volatile int32_t gyro_z_offset = 0xFFFFFF9A;

// PID angle control variables
volatile double angle = -1;
double angle_offset = 0;
volatile double target_angle = 0;    // target angle
volatile int32_t error = 0;         // error signal
volatile int32_t error_integral = 0;    // integrated error signal
volatile int32_t Kp = 900;            // proportional gain
volatile int32_t Ki = 15;            // integral gain
volatile double Kd = -20;            // derivative gain
int32_t clamp = 3200;
volatile int d_filtered = 0;

// PID velocity control variables
volatile double Kp2 = 5;
volatile double Ki2 = 0.01;
//volatile double Kd2 = 0;
volatile double target_speed = 0;
volatile double error_integral2 = 0;
volatile double speed = 0;
volatile double clamp2 = 1;
volatile double out_clamp2 = 5;
volatile int en_pos = 0;

// P orientation control variables
volatile double orientation = 0;
volatile double target_orientation = 0;
volatile double Kp_o = 15;
volatile int o_clamp = 35; 

// Average the gyro values over a second for calibration
void calibrate_gyro() {
  int gyro_y_sum = 0;
  int gyro_z_sum = 0;

  for (int i = 0; i < 1000; i++) {
    HAL_Delay(1);
    int gyro_y = get_gy();
    int gyro_z = get_gz();

    gyro_y_sum += gyro_y;
    gyro_z_sum += gyro_z;
  }

  gyro_y_offset = gyro_y_sum / 1000;
  gyro_z_offset = gyro_z_sum / 1000;

  transmit_string("gyro y offset: ");
  transmit_hex(gyro_y_offset);
  transmit_string("\r\n");

  transmit_string("gyro z offset: ");
  transmit_hex(gyro_z_offset);
  transmit_string("\r\n");
}

// Initialize pid loops, mainly starts timer interrupt
void init_pid() {
  if(gyro_y_offset == -1 || gyro_z_offset == -1) {
  	calibrate_gyro();
  }

  RCC->AHBENR |= RCC_AHBENR_GPIOBEN; // For profiling
  GPIOB->MODER |= (1 << 9*2); // For profiling

  RCC->APB1ENR |= RCC_APB1ENR_TIM6EN;

  TIM6->DIER |= TIM_DIER_UIE;
  TIM6->PSC = 48;
  TIM6->ARR = HAL_RCC_GetHCLKFreq() / (PID_FREQ * 48);

  NVIC_EnableIRQ(TIM6_DAC_IRQn);
  NVIC_SetPriority(TIM6_DAC_IRQn, 0);

  TIM6->CR1 |= TIM_CR1_CEN;
}

// Update function for angle control
int PID_update(int32_t accel_x, int32_t gyro_y) {
  gyro_y -= gyro_y_offset;
  gyro_y *= -1;

  angle = ((0.98) * (angle + (((gyro_y / 131.0) / 100.0))) + (0.02 * (accel_x / 182.0)));

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

  d_filtered = (d_filtered * 7) / 8 + gyro_y / 8;

  /// Calculate proportional portion, add integral and write to "output" variable
  int32_t output = Kp * error + error_integral + Kd * (d_filtered / 131.0);

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

// Update function for velocity control
void PI_update2() {
  int32_t d_dist = TIM2->CNT - 0x7FFF;
  TIM2->CNT = 0x7FFF;
  speed = speed * 0.95 + d_dist * 0.05;
  en_pos += d_dist;

  double error2 = target_speed - speed;

  error_integral2 += Ki2 * error2;

  if(error_integral2 > clamp2) {
  	error_integral2 = clamp2;
  }
  if(error_integral2 < -clamp2) {
  	error_integral2 = -clamp2;
  }

  double output = Kp2 * error2 + Ki2 * error_integral2;
  if(output > out_clamp2) {
  	output = out_clamp2;
  }
  if(output < -out_clamp2) {
  	output = -out_clamp2;
  }

  target_angle = output;
}

// Update function for orientation control
int orientation_update(int32_t gyro_z) {
	gyro_z -= gyro_z_offset;
	orientation = orientation + gyro_z * (0.004375) / 250.0;

	double error_orientation = target_orientation - orientation;

	int output = (int) (error_orientation * Kp_o);

	if(output > o_clamp) {
		output = o_clamp;
	}
	if(output < -o_clamp) {
		output = -o_clamp;
	}

	return output;
}

void TIM6_DAC_IRQHandler(void) {
  // For profiling, hook PB9 to scope to time interrupt length
  GPIOB->ODR |= (1 << 9);

  int32_t accel_x = get_ax();
  int32_t gyro_y = get_gy();
  int32_t gyro_z = get_gz();

  int turn = orientation_update(gyro_z);

  PI_update2();

  int32_t pwm_l = -PID_update(accel_x, gyro_y);
  int32_t pwm_r = pwm_l;

  pwm_l -= turn;
  pwm_r += turn;

  set_speed(MOTOR_LEFT, pwm_l);
  set_speed(MOTOR_RIGHT, pwm_r);

  GPIOB->ODR &= ~(1 << 9); // For profiling
  TIM6->SR &= ~TIM_SR_UIF;
}
