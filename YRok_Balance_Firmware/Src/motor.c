#include "motor.h"
#include "stm32f0xx_hal.h"

uint32_t M1_BK = 1;
uint32_t M1_FW = 2;
uint32_t M2_BK = 10;
uint32_t STBY = 11;
uint32_t M2_FW = 12;
uint32_t M1_PWM = 14;
uint32_t M2_PWM = 15;

void init_motors()
{
  RCC->AHBENR |= RCC_AHBENR_GPIOBEN;

  GPIOB->MODER |= (0x1 << M1_BK*2) | // M1_BK
                  (0x1 << M1_FW*2) | // M1_FW
                  (0x1 << M2_BK*2) | // M2_BK
                  (0x1 << STBY*2) | // STBY
                  (0x1 << M2_FW*2) | // M2_FW
                  (0x2 << M1_PWM*2) | // M1_PWM
                  (0x2 << M2_PWM*2); // M2_PWM

  GPIOB->AFR[1] |= (0x1 << (M1_PWM - 8)*4) | (0x1 << (M2_PWM - 8)*4);

  RCC->APB2ENR |= RCC_APB2ENR_TIM15EN;

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

  GPIOB->ODR |= (0x1 << STBY) | (0x1 << M1_FW) | (0x1 << M2_FW);
  for(int i = 0; i < 2400; i += 2) {
    HAL_Delay(2);
    TIM15->CCR1 = i;
    TIM15->CCR2 = i;
  }

  for(int i = 2398; i >= 0; i -= 2) {
    HAL_Delay(2);
    TIM15->CCR1 = i;
    TIM15->CCR2 = i;
  }
}
