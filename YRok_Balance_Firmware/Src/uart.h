#ifndef UART_H_
#define UART_H_

#include "stm32f0xx.h"

/*
 * command to parse from when uart_data is high/ready
 */
#define BUFFER_SIZE 1024
extern char command[BUFFER_SIZE];
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
 * returns a boolean depending on whether c1 and c2 (null terminated strings)
 * are equal
 */
int string_compare(char* c1, char* c2);

/*
 * returns a pointer to a null terminated string that won't change until the
 * next call to get_command
 */
char* get_command(void);

/*
 * initialize the uart
 */
void init_uart();

void USART3_4_IRQHandler(void);

#endif
