/* 
 * @file lora.h
 * @author Jedi
 * @date 31 декабря 2021 г., 13:53
 */

#ifndef LORA_H
#define	LORA_H

#ifdef	__cplusplus
extern "C" {
#endif




#ifdef	__cplusplus
}
#endif

#include "main.h"

#define CONFIG_MSG_LEN 6
#define DATA_MSG_LEN 4

#if PCB == SHEALA_A
#define DIO0 6
#define DIO0_PORT PORTE
#define DIO0_DDR DDRE
#elif PCB == SPECTO_A
#define DIO0 6
#define DIO0_PORT PORTE
#define DIO0_PIN PINE
#define DIO0_DDR DDRE

/**
 * @warning Кусок кода для Specto A v3.0 
 */
//#define DIO0 7
//#define DIO0_PORT PORTB
//#define DIO0_PIN PINB
//#define DIO0_DDR DDRB
#endif

struct lora_t {
    unsigned char id[2];
    unsigned char key[2];
    unsigned char tx_message[16];
    unsigned char rx_message[16];
    volatile unsigned char power;
    volatile unsigned char radio_channel;
    volatile unsigned long carier_frequency;
} Lora;

/**
 * @brief Инициализирует обработчик сигналов светофора
 */
void lora_init();

/**
 * @brief Подготавливает данные для отправки
 * @param len длина отправляемого сообщения
 */
void lora_message_encode(unsigned char len);

/**
 * @brief Дешифрует сообщение полученное от модуля Specto-A
 * @param payload Указатель на массив с сообщнием
 * @param len Длина принятого сообщения
 */
void lora_message_decode(unsigned char len);

/**
 * @brief Отправляет данные
 */
void lora_message_send(unsigned char len, uint16_t timeout);

/**
 * @brief Настраивает модуль. Изменение номера радио канала, типов сигналов, 
 * мощности радиоканала
 * @param _radio_channel номер радиоканала. Допустимые значения: 0~9
 * канал. 0 - стрелка, 1 - красный)
 * @param _power мощность передатчика. Допустимые значения: 2~17
 */
void lora_configure(unsigned char _radio_channel, unsigned char _power);

/**
 * @brief Считывает принятое сообщение из FIFO буфера модуля Lora.
 * Сообщение помещается в Lora.rx_message
 * @return возвращает -1, не удалось считать сообщение. 
 * Возвращает 0, сообщение считано успешно
 */
int8_t lora_rx_callback();

/**
 * @brief Сравнивает id в полученном сообщении с id модуля Specto-A.
 * Восьмой разряд последнего байта должен быть равен 1.
 * @return 0 - если невалидное сообщение , 1 - если валидное сообщение
 */
int lora_rx_valid_message(unsigned char len);

/**
 * @brief Проверяет доступен ли модуль Lora
 * @return 
 */
int8_t lora_alive();

/**
 * @brief Перезагружает модуль Lora
 */
void lora_reboot();
#endif	/* LORA_H */

