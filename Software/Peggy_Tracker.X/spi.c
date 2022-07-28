/* 
 * @file spi.c
 * @author Jedi
 * @date 28 декабря 2021 г., 14:19
 */

#include "spi.h"
#include "timer1.h"
#include "gpio.h"

void spi_init() {
    SPI_NSS_DDR |= _BV(SPI_NSS_PIN); ///< Настраиваем NSS в режим вывода
    SPI_NSS_PORT |= _BV(SPI_NSS_PIN); ///< Включение подтяжки на порте NSS
    SPI_RST_DDR |= _BV(SPI_RST_PIN); ///< Настраиваем RST в режим вывода
    SPI_RST_PORT |= _BV(SPI_RST_PIN); ///< Включение подтяжки на порте RST
        
    DDRB |= _BV(DD0) | _BV(DD1) | _BV(DD2); ///< Настраиваем SS, MOSI, SCK в режиме вывода
    SPCR |= _BV(SPE) | _BV(MSTR); ///< включаем SPI в режиме ведущего
//    SPSR |= _BV(SPI2X); ///< Частота SPI F_CPU/2
}

uint8_t spi_TxRx_single(unsigned char data) {
    SPDR = data;
    while (!(SPSR & _BV(SPIF)))
	    ;
    return SPDR;
}


void spi_nss_low() {
    SPI_NSS_PORT &= ~_BV(SPI_NSS_PIN);
}

void spi_nss_high() {
    SPI_NSS_PORT |= _BV(SPI_NSS_PIN);
}

void spi_rst_low() {
    SPI_RST_PORT &= ~_BV(SPI_RST_PIN);
}

void spi_rst_high() {
    SPI_RST_PORT |= _BV(SPI_RST_PIN);
}
