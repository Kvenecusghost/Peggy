/* 
 * @file spi.h
 * @author Jedi
 * @date 28 декабря 2021 г., 14:19
 */

#ifndef SPI_H
#define	SPI_H

#include "main.h"


#if PCB == SHEALA_A
#define SPI_NSS_DDR DDRB
#define SPI_NSS_PORT PORTB
#define SPI_NSS_PIN 4
#define SPI_RST_DDR DDRD
#define SPI_RST_PORT PORTD
#define SPI_RST_PIN 4
#elif PCB == SPECTO_A
#define SPI_NSS_PIN 0
#define SPI_NSS_DDR DDRB
#define SPI_NSS_PORT PORTB
#define SPI_RST_PIN 0
#define SPI_RST_DDR DDRF
#define SPI_RST_PORT PORTF
#endif

/**
 * @brief Инициализирует модуль SPI в режиме ведущего
 */
void spi_init();

/**
 * @brief Передаёт и принимает байт 
 * @param data байт данных для отправки по шине MOSI
 * @return байт полученный по шине MISO
 */
uint8_t spi_TxRx_single(unsigned char data);


/**
 * @brief Лог. 0 на выходе NSS
 */
void spi_nss_low();

/**
 * @brief Лог. 1 на выходе NSS
 */
void spi_nss_high();

/**
 * @brief Лог. 0 на выходе RST
 */
void spi_rst_low();

/**
 * @brief Лог. 1 на выходе RST
 */
void spi_rst_high();

#endif	/* SPI_H */

