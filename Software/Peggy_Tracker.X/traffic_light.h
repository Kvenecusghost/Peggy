/* 
 * File:   traffic_light.h
 * Author: Jedi
 *
 * Created on 14 февраля 2022 г., 13:11
 */

#ifndef TRAFFIC_LIGHT_H
#define	TRAFFIC_LIGHT_H

#ifdef	__cplusplus
extern "C" {
#endif
#include "main.h"

    struct traffic_light_t {
        unsigned char ack_array[8];
        unsigned char data_array[8];
        unsigned char arrows_array[8];
        volatile unsigned char data_new;
        volatile unsigned char signals_type;
        volatile unsigned char arrows_delay;
    } Traffic_light;

    void traffic_light_init();

    /**
     * @brief Считывает состояние каналов. Если на канале присутствует лог. 1, то 
     * инкрементирует соответствующий байт в data_array. Данная функция вызывается 
     * по событию 1мс
     */
    void traffic_light_read();

    /**
     * @brief Обрабатывает красный сигнал светофора и стрелку. Данная функция 
     * вызывается по событию 150мс
     */
    void traffic_light_process();
    
    /**
     * @brief Настраивает параметры считывания состояния светофора
     */
    void traffic_light_configure(unsigned char _signals_type, 
            unsigned char _arrows_delay);


#ifdef	__cplusplus
}
#endif

#endif	/* TRAFFIC_LIGHT_H */

