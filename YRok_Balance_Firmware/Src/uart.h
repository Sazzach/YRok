#ifndef UART_H_
#define UART_H_

#include "stm32f0xx.h"

/*
 * buffer to read from when uart_data is high/ready
 */
extern char buffer[7];
/*
 * signals when the buffer can be read (after a newline is read)
 */
extern volatile int uart_data;

/*
 * transmit a character over the uart
 */
void transmit_char(char c);

/*
 * transmit a string over the uart
 */
void transmit_string(char *s);

/*
 * transmit hex over the uart
 */
void transmit_hex(uint32_t hex);

/*
 * initialize the uart
 */
void init_uart();

void USART3_4_IRQHandler(void);

#endif
