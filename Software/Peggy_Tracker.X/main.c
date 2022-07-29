/*
 * @file: main.c
 * @author: Jedi
 * @date 27 декабря 2021 г., 19:03
 */
#define F_CPU 8000000UL

#include "main.h"
#include "timer0.h"
#include "gpio.h"
#include <avr/interrupt.h>
#include <util/delay.h>
#include "uart.h"
#include "lora.h"
#include "string.h"

#include "avr/wdt.h"

volatile unsigned char acquisition_completed = 0;
volatile unsigned char rx_done = 0;
volatile unsigned char t0_compa_number;

/**
 * @brief Точка входа в программу
 */
int main(void) {
#define EMULATOR    
#ifdef EMULATOR
    uint32_t count = 0;
#endif

    cli();
    wdt_reset();
    wdt_enable(WDTO_250MS);

    led_init();

    lora_init();
    
    t0_compa_number = 0;
    t0_ctc_start(3, 124); ///< Запуск таймера с периодом 1мс

    wdt_enable(WDTO_60MS);
    sei();

    while (1) {
	wdt_reset();
    }
    return 0;
}

/**
 * @brief Обработчик прерываний переполнения таймера 0 производит опрос 
 * входных сигналов каждую 1мс. По прошествии 150мс счетчик милисекунд 
 * обнуляется, поднимается флаг о готовности к фильтрации. 
 */
ISR(TIMER0_COMPA_vect) {
}

/**
 * @brief Прерывание вызывается при получении сигнала по LoRa.
 * Таймер 0 останавливается. Устанавливается программный флаг получения по Lora
 */
ISR(INT6_vect) {
    rx_done = 1;
}
