/* 
 * @file uart.h
 * @author Jedi
 * @date 29 декабря 2021 г., 22:27
 */

#include "uart.h"

void uart_init() {
    UART_RX_DDR &= ~_BV(UART_RX);
    UART_TX_DDR |= _BV(UART_TX);
    UART_TX_PORT |= _BV(UART_TX);


    UBRR1H = 0;
    UBRR1L = 51; ///< = F_CPU/(16 * baud) - 1

    UCSR1B |= _BV(TXEN1);
    UCSR1C |= _BV(UCSZ10) | _BV(UCSZ11);
}

int uart_putchar(char c) {
    while (!(UCSR1A & _BV(UDRE1)));
    UDR1 = c;
    return 0;
}

int uart_printline(const char * s) {
    unsigned int i = 0;
    while (1) {
	uart_putchar(s[i]);
	i++;
	if (s[i] == '\0') {
	    uart_putchar('\r');
	    uart_putchar('\n');
	    return i;
	}
    }
    return i;
}