/* 
 * File:   timer1.h
 * Author: Jedi
 *
 * Created on 24 февраля 2022 г., 16:48
 */

#ifndef TIMER1_H
#define	TIMER1_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "main.h"

volatile uint16_t t1_count_number;
    
/**
 * @brief Инициализация работы таймера 0
 * @param tov Если true, то включить прерывания по переполнению таймера
 */
void t1_init();

/**
 * @brief Включает таймер 0
 * @param clk_src источник тактирования таймера 0
 * 1 - F_CPU
 * 2 - F_CPU/8
 * 3 - F_CPU/64
 * 4 - F_CPU/256
 * 5 - F_CPU/1024
 * 6 - Внешний источник на порту Т0, задний фронт
 * 7 - Внешний источник на порту T0, передний фронт
 * @param ocr0 таймер будет считать до этого числа
 */
void t1_ctc_start(unsigned char clk_src, unsigned char ocr0);

/**
 * @brief Останавливает таймер
 */
void t1_stop();


#ifdef	__cplusplus
}
#endif

#endif	/* TIMER1_H */

