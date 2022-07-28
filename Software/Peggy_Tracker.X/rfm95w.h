/*
 * @file rfm95w.h
 * @author Jedi
 * @date Aug 8, 2019
 */

#ifndef RFM95W_H_
#define RFM95W_H_

#define F_CPU 8000000UL

#include "xc.h"
#include "spi.h"
#include <util/delay.h>

#define PA_OUTPUT_RFO_PIN       0
#define PA_OUTPUT_PA_BOOST_PIN  1
#define FREQUENCY 868e6
#define BANDWIDTH 500e3

#define RFM95W_OK 0;
#define RFM95W_TIMEOUT -1;

struct rfm95w_t {
    unsigned long frequency;
    unsigned char header_mode;
    unsigned char packet_index;
    unsigned char message_length;
    volatile unsigned char message[16];
} RFM95W;

/**
 * @brief Инициализирует модуль rfm95w
 * @param frequency Несущая частота, на которой происходит прием/передача
 * @param power мощность сигнала 2~17dBm
 * @return Возвращает 0, если модуль успешно инициализирован, -1 если модуль 
 * вернул неверную версию
 */
char rfm95w_begin(long frequency, unsigned char power);

/**
 * @brief Считывает полученный пакет из модуля rfm95w
 * @param size Количество байт для считывания
 * @return Возвращает количество полученных байт
 */
int rfm95w_packet_parse(int size);

/**
 * @brief  Подготавливает модуль к режиму передачи
 * @param hm режим передачи. 0 - с опциональным заголовком, 1 - без опционального заголовка
 * @return 0, если модуль успешно подготовлен
 */
char rfm95w_packet_begin(char hm);

/**
 * @brief Передача данных из буфера передачи FIFO по радиоканалу
 * @return 0, если данные успешно отправлены
 */
int8_t rfm95w_packet_end();

/**
 * @brief Запись данных в буфер для последующей передачи по радиоканалу
 * @param buffer указатель на массив с данными в памяти МК
 * @param size количество байт для передачи
 * @return количество записанных байт
 */
char rfm95w_packet_write(unsigned char *buffer, unsigned char size);

/**
 * @brief Обработчик прерывания RX_DONE. Вызывается обработчиком прерывания GPIO
 * @return 0 если приём успешен, -1 если произошла ошибка CRC, -2 если длина сообщения не совпадает с ожидаемой
 */
char rfm95w_rxdone_callback();

/**
 @brief Начинает работу модуля в режиме непрерывного приёма. В данном режиме при получении
 * сообщения в модуле запускается прерывание RX_DONE но не происходит переход в режим STAND_BY.
 * Кроме того игнорируется прерывание RX_TIMEOUT. Для отслеживания прерывания RX_DONE можно
 * воспользоваться ножкой DIO0 модуля.
 * @param size длина ожидаемой полезной нагрузки
 * @return возвращает 0, если модуль успешно инициализирован в режиме непрерывного приёма
 */
void rfm95w_rx_continious(unsigned char size);
 
/**
 * @brief Считывает из памяти модуля байт версии модуля. 
 * @return Версия модуля.Для RFM95W 0x12
 */
int8_t rfm95w_get_version();
#endif /* RFM95W_H_ */
