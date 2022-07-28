/**
 * @file timer0.c
 * @author: Jedi
 * @date date 24 декабря 2021 г., 19:04
 */

#include "timer0.h"


void t0_ctc_start(unsigned char clk_src, unsigned char ocr0) {
    TCCR0A = 0;
    TCCR0B = 0;
    
    OCR0A = ocr0;
    TCCR0A |= _BV(WGM01); ///< Включить режим CTC
    	    
    switch (clk_src) {
        case 1: ///< F_CPU
            TCCR0B |= _BV(CS00);
            break;
        case 2: ///< F_CPU/8
            TCCR0B |= _BV(CS01);
            break;
        case 3: ///< F_CPU/64
            TCCR0B |= _BV(CS00) | _BV(CS01);
            break;
        case 4: ///< F_CPU/256
            TCCR0B |= _BV(CS02);
            break;
        case 5: ///< F_CPU/1024
            TCCR0B |= _BV(CS02) | _BV(CS00);
            break;
        case 6: ///< Внешний источник на порту Т0, задний фронт
            TCCR0B |= _BV(CS02) | _BV(CS01);
            break;
        case 7: ///< Внешний источник на порту Т0, передний фронт
            TCCR0B |= _BV(CS02) | _BV(CS01) | _BV(CS00);
            break;
    }
    TIMSK0 |= _BV(OCIE0A);
}

void t0_stop() {
    TCCR0B &= ~(_BV(CS00) | _BV(CS01) | _BV(CS02));
}

void t0_start_from(unsigned char val, unsigned char clk_src){
    TCNT0 = val;
    TIFR0 |= _BV(TOV0);
    t0_ctc_start(clk_src, 0);
}