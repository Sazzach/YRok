#include "uart.h"
#include "stm32f0xx.h"

void transmit_char(char c) {
  // wait until transmit data register is empty
  while (!(USART4->ISR & (1 << 7))) {
  }

  // write c to transmit data register
  USART4->TDR = c;
}

void transmit_string(char *s) {
  while (*s != 0) {
    transmit_char(*s);
    s++;
  }
}

void transmit_hex(uint32_t hex) {
  int i;

  for(i = 7; i >= 0; i--) {
    char digit = (hex >> i*4) & 0xF;
    if(digit <= 9) {
      digit += '0';
    }
    else {
      digit += 'A' - 0xA;
    }

    transmit_char(digit);
  }
}

int idx = 0;
char buffer[7];
volatile int uart_data = 0;

void USART3_4_IRQHandler(void) {
  buffer[idx] = USART4->RDR;
  if (buffer[idx] == '\n' || buffer[idx] == '\r') {
    idx = 0;
    uart_data = 1;
  } else {
    idx++;
  }
}

void init_uart(void) {
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN;

  // set up Rx(PA1)/Tx(PA0) - USART4
  RCC->APB1ENR |= RCC_APB1ENR_USART4EN;

  // alternate function mode
  GPIOA->MODER &= ~((0x1 << 2*0) | (0x1 << 2*1));
  GPIOA->MODER |= (0x2 << 2*0) | (0x2 << 2*1);
  
  // alternate function 4
  GPIOA->AFR[0] &= ~(0xb << 4*0);
  GPIOA->AFR[0] |= 0x4 << 4*0;
  GPIOA->AFR[0] &= ~(0xb << 4*1);
  GPIOA->AFR[0] |= 0x4 << 4*1;

  // configure baud rate
  USART4->BRR = HAL_RCC_GetHCLKFreq() / 115200;

  // enable receiver/transmitter hardware
  USART4->CR1 |= (1 << 2) | (1 << 3) | USART_CR1_RXNEIE;  // RXNEIE causes interrupt to be generated

  // enable USART
  USART4->CR1 |= 1 << 0;

  // set up NVIC
  NVIC_EnableIRQ(USART3_4_IRQn);
  NVIC_SetPriority(USART3_4_IRQn, 0);
}
