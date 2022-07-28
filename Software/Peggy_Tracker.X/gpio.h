/* 
 * @file gpio.h
 * @author Jedi
 * @data 27 декабря 2021 г., 19:04
 */

#ifndef GPIO_H
#define	GPIO_H

#ifdef	__cplusplus
extern "C" {
#endif




#ifdef	__cplusplus
}
#endif

#include "main.h"
#include "xc.h"


#define LED_DDR DDRC
#define LED_PORT PORTC
#define LED_PIN PIN7


/**
 * @brief Инициализирует порты ввода вывода
 */
void led_init();

/**
 * @brief Переключает состояние светодиода
 */
void led_toggle();

/**
 * @brief Зажигает светодиод
 */
void led_on();

/**
 * @brief Тушит светодиод
 */
void led_off();

#endif	/* GPIO_H */

