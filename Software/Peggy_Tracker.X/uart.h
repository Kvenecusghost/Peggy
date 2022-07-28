/* 
 * @file uart.h
 * @author Jedi
 * @date 29 декабря 2021 г., 22:27
 */

#ifndef UART_H
#define	UART_H

#ifdef	__cplusplus
extern "C" {
#endif

#ifdef	__cplusplus
}
#endif

#include <xc.h>
#include <stdio.h>

#define UART_RX_DDR DDRD
#define UART_RX_PORT PORTD
#define UART_RX 2
#define UART_TX_DDR DDRD
#define UART_TX_PORT PORTD
#define UART_TX 3


/**
 * @brief Инициализирует UART. 
 * Протокол: 9600бод, 8 бит, 1 стоп бит, без проверки на четность
 */
void uart_init();

/**
 * @brief Отправляет байт по UART
 * @param c Байт для отправки по UART
 * @return 0 - если передача успешна
 */
int uart_putchar(char c);

/**
 * @brief Отправляет строку байтов по UART
 * @param s - указатель на строку
 * @param len - длина строки
 * @return 0 - если передача успешна
 */
int uart_printline(const char * s);

#endif	/* UART_H */

