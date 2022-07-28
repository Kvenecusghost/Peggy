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
#include "traffic_light.h"

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
    traffic_light_init();

    t0_compa_number = 0;
    t0_ctc_start(3, 124); ///< Запуск таймера с периодом 1мс

    wdt_enable(WDTO_60MS);
    sei();

    while (1) {
	wdt_reset();
#ifdef EMULATOR
	if (acquisition_completed) {
	    led_off();
	    acquisition_completed = 0;
	    traffic_light_process();
	    Lora.tx_message[0] = Lora.id[0];
	    Lora.tx_message[1] = Lora.id[1];
	    count++;
	    if (count < 200)
		Lora.tx_message[2] = 0xFF;
	    else if (count < 400)
		Lora.tx_message[0] = 0xF0;
	    else
		count = 0;

	    lora_message_encode(DATA_MSG_LEN);
	    lora_message_send(DATA_MSG_LEN, 60);
	    Lora.tx_message[2] = ~Lora.tx_message[2];
	}
#else
	if (acquisition_completed) {
	    led_off();
	    acquisition_completed = 0;
	    traffic_light_process();
	    Lora.tx_message[0] = Lora.id[0];
	    Lora.tx_message[1] = Lora.id[1];

	    Lora.tx_message[2] = Traffic_light.data_new;
	    lora_message_encode(DATA_MSG_LEN);
	    lora_message_send(DATA_MSG_LEN, 60);
	}

	if (rx_done) {
	    cli();
	    wdt_reset();
	    wdt_enable(WDTO_250MS);
	    rx_done = 0;
	    if (!lora_rx_callback()) {
		if (lora_rx_valid_message(CONFIG_MSG_LEN)) {
		    lora_configure(
			    Lora.rx_message[3] & 0x0F, // Номер радиоканала
			    (Lora.rx_message[3] >> 4) + 2 // Мощность передатчика
			    );
		    traffic_light_configure(
			    Lora.rx_message[2], // Тип сигналов
			    Lora.rx_message[4] // Быстродействие стрелки
			    );
		}
	    }
	    wdt_reset();
	    wdt_enable(WDTO_60MS);
	    sei();
	}
#endif
    }
    return 0;
}

/**
 * @brief Обработчик прерываний переполнения таймера 0 производит опрос 
 * входных сигналов каждую 1мс. По прошествии 150мс счетчик милисекунд 
 * обнуляется, поднимается флаг о готовности к фильтрации. 
 */
ISR(TIMER0_COMPA_vect) {
    t0_compa_number++;
    traffic_light_read();
    if (t0_compa_number >= 150) {
	t0_compa_number = 0;
	memcpy(Traffic_light.data_array, Traffic_light.ack_array, 8);
	memset(Traffic_light.ack_array, 0, 8);
	acquisition_completed = 1;
    }
    if (t0_compa_number == 50) {
	led_on();
    }
}

/**
 * @brief Прерывание вызывается при получении сигнала по LoRa.
 * Таймер 0 останавливается. Устанавливается программный флаг получения по Lora
 */
ISR(INT6_vect) {
    rx_done = 1;
}
