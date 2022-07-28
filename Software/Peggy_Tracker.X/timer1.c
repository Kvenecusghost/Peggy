#include "timer1.h"

void t1_ctc_start(unsigned char clk_src, unsigned char ocr0){
    t1_count_number = 0;
    TCCR1A = 0;
    TCCR1B = 0;
    
    OCR1A = ocr0;
    TCCR1A |= _BV(WGM11); ///< Включить режим CTC
    	    
    switch (clk_src) {
        case 1: ///< F_CPU
            TCCR1B |= _BV(CS00);
            break;
        case 2: ///< F_CPU/8
            TCCR1B |= _BV(CS01);
            break;
        case 3: ///< F_CPU/64
            TCCR1B |= _BV(CS00) | _BV(CS01);
            break;
        case 4: ///< F_CPU/256
            TCCR1B |= _BV(CS02);
            break;
        case 5: ///< F_CPU/1024
            TCCR1B |= _BV(CS02) | _BV(CS00);
            break;
        case 6: ///< Внешний источник на порту Т0, задний фронт
            TCCR1B |= _BV(CS02) | _BV(CS01);
            break;
        case 7: ///< Внешний источник на порту Т0, передний фронт
            TCCR1B |= _BV(CS02) | _BV(CS01) | _BV(CS00);
            break;
    }
    TIMSK0 |= _BV(OCIE0A);
}

void t1_stop(){
    TCCR1B &= ~(_BV(CS10) | _BV(CS11) | _BV(CS12));
}