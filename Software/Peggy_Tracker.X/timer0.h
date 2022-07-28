/* 
 * @file: timer0.h
 * @author: Jedi
 * @date 27 декабря 2021 г., 19:04
 */

#ifndef TIMER0_H
#define	TIMER0_H

#include <xc.h>
#include <stdbool.h>
#ifdef	__cplusplus
extern "C" {
#endif




#ifdef	__cplusplus
}
#endif



/**
 * @brief Инициализация работы таймера 0
 * @param tov Если true, то включить прерывания по переполнению таймера
 */
void t0_init();

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
void t0_ctc_start(unsigned char clk_src, unsigned char ocr0);

/**
 * @brief Останавливает таймер
 */
void t0_stop();

/**
 * @brief Запускает таймер 0 с заданного начального значения
 * @param val начальное значение таймера
 * @param clk_src источник тактирования таймера 0
 * 1 - F_CPU
 * 2 - F_CPU/8
 * 3 - F_CPU/64
 * 4 - F_CPU/256
 * 5 - F_CPU/1024
 * 6 - Внешний источник на порту Т0, задний фронт
 * 7 - Внешний источник на порту T0, передний фронт
 */
void t0_start_from(unsigned char val, unsigned char clk_src);

#endif	/* TIMER0_H */

