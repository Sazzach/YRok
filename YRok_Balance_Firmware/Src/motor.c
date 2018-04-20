#include "motor.h"

uint32_t M1_FW = 1;
uint32_t M1_BK = 2;
uint32_t M2_FW = 12;
uint32_t STBY = 11;
uint32_t M2_BK = 10;
uint32_t M1_PWM = 14;
uint32_t M2_PWM = 15;

// TODO try Timer 2 with PA0 - Ch1 and PA1 - Ch2

void init_motors()
{
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN | RCC_AHBENR_GPIOBEN;
  //RCC->APB1ENR |= RCC_APB1ENR_TIM2EN | RCC_APB1ENR_TIM3EN;
  RCC->APB2ENR |= RCC_APB2ENR_TIM15EN;

  //GPIOA->MODER |= (0x2 << 15*2); // E1_A

  //GPIOA->AFR[2] |= (0x2 << (15 - 8)*4);

  GPIOB->MODER |= (0x1 << M1_BK*2) | // M1_BK
                  (0x1 << M1_FW*2) | // M1_FW
                  (0x1 << M2_BK*2) | // M2_BK
                  (0x1 << STBY*2) | // STBY
                  (0x1 << M2_FW*2) | // M2_FW
                  (0x2 << M1_PWM*2) | // M1_PWM
                  (0x2 << M2_PWM*2); // M2_PWM
                  //(0x2 << 3*2); // E1_B
                  //(0x2 << 4*2) | // E2_A
                  //(0x2 << 5*2); // E2_B

  //GPIOB->AFR[0] |= (0x2 << 3*4) | (0x1 << 4*4) | (0x1 << 5*4);
  //GPIOB->AFR[0] |= (0x2 << 3*4);
  GPIOB->AFR[1] |= (0x1 << (M1_PWM - 8)*4) |(0x1 << (M2_PWM - 8)*4);

  // Select PWM mode 1, and enable OC1 preload register
  TIM15->CCMR1 |= TIM_CCMR1_OC1M_2 | TIM_CCMR1_OC1M_1 | TIM_CCMR1_OC1PE |
                  TIM_CCMR1_OC2M_2 | TIM_CCMR1_OC2M_1 | TIM_CCMR1_OC2PE;
  TIM15->CCER |= TIM_CCER_CC1E |
                 TIM_CCER_CC2E;
  TIM15->BDTR |= TIM_BDTR_MOE;
  TIM15->PSC = 0;
  TIM15->ARR = 2400; // PWM at 20kHz (Clock is 48MHz)
  TIM15->CCR1 = 0;
  TIM15->CCR2 = 0;

  // Start timer
  TIM15->CR1 |= TIM_CR1_CEN;

//  // Setup timer 2 (E1)
//  TIM2->CCMR1 |= (TIM_CCMR1_CC1S_0 | TIM_CCMR1_CC2S_0);
//  TIM2->SMCR |= (TIM_SMCR_SMS_1 | TIM_SMCR_SMS_0);
//  TIM2->CCER |= (TIM_CCER_CC1E | TIM_CCER_CC2E);
//  TIM2->ARR = 0xFFFF;
//  TIM2->CNT = 0x7FFF;
//  TIM2->CR1 |= TIM_CR1_CEN;
//
//  // Setup timer 3 (E2)
//  TIM3->CCMR1 |= (TIM_CCMR1_CC1S_0 | TIM_CCMR1_CC2S_0);
//  TIM3->SMCR |= (TIM_SMCR_SMS_1 | TIM_SMCR_SMS_0);
//  TIM3->ARR = 0xFFFF;
//  TIM3->CNT = 0x7FFF;
//  TIM3->CR1 |= TIM_CR1_CEN;
}

void enable_motors()
{
  GPIOB->ODR |= (0x1 << STBY);
}

void disable_motors()
{
  GPIOB->ODR &= ~(0x1 << STBY);
}

void set_dir(int32_t motor, int32_t dir)
{
  uint32_t fw_pin = M1_FW;
  uint32_t bk_pin = M1_BK;

  if(motor == 2)
  {
    fw_pin = M2_FW;
    bk_pin = M2_BK;
  }

  switch(dir)
  {
    case MOTOR_STOP:
      GPIOB->ODR &= ~((0x1 << fw_pin) | (0x1 << bk_pin));
      break;
    case MOTOR_FORWARD:
      GPIOB->ODR |= (0x1 << fw_pin);
      GPIOB->ODR &= ~(0x1 << bk_pin);
      break;
    case MOTOR_BACKWARD:
      GPIOB->ODR |= (0x1 << bk_pin);
      GPIOB->ODR &= ~(0x1 << fw_pin);
      break;
  }
}

void set_speed(int32_t motor, uint32_t speed)
{
  uint32_t tim_speed = (TIM15->ARR / 100) * speed;

  if(motor == 1)
  {
    TIM15->CCR1 = tim_speed;
  }
  else if(motor == 2)
  {
    TIM15->CCR2 = tim_speed;
  }
}
