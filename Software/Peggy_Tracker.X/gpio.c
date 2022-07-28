/**
 * @file gpio.c
 * @author Jedi
 * @date date 27 декабря 2021 г., 19:05
 * 
 */

#include "gpio.h"

void led_init() {
    /* СИД */
    LED_DDR |= _BV(DDC7);
    LED_PORT |= _BV(DDC7);
}

void led_toggle() {
    if (LED_PORT & _BV(LED_PIN))
        LED_PORT &= ~_BV(LED_PIN);
    else
        LED_PORT |= _BV(LED_PIN);
}


/**
 * @todo Если используется Sheala A, то раскомментировать строки ниже
 */
#if PCB == SHEALA_A
void led_on(){
    LED_PORT |= _BV(LED_PIN);
}

void led_off() {
    LED_PORT &= ~_BV(LED_PIN);
}

/**
 * @todo Если используется Specto A, то раскомментировать строки ниже
 */
#elif PCB == SPECTO_A
void led_on(){
    LED_PORT &= ~_BV(LED_PIN);
}

void led_off() {
    LED_PORT |= _BV(LED_PIN);
}
#endif
