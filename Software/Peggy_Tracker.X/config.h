/* 
 * File:   config.h
 * Author: Jedi
 *
 * Created on 14 февраля 2022 г., 13:29
 */

#ifndef CONFIG_H
#define	CONFIG_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "avr/eeprom.h"

    /**
     * @brief Переменные хранящиеся в EEPROM
     */
    unsigned char EEMEM ee_id0 = 0x00; ///< Нулевой байт ID
    unsigned char EEMEM ee_id1 = 0x01; ///< Первый байт ID
    unsigned char EEMEM ee_signals_type = 0x3F; ///< Типы сигналов. 0 - стрелка, 1 - красный
    unsigned char EEMEM ee_radio_channel = 0; ///< Номер радио канала 0~9
    unsigned char EEMEM ee_power = 17; ///< Мощность радио сигнала 2~17
    unsigned char EEMEM ee_arrows_delay = 5; ///< Быстродействие стрелки 0~255


#ifdef	__cplusplus
}
#endif

#endif	/* CONFIG_H */

