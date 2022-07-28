#include <string.h>
#include "rfm95w.h"
#include "lora.h"
#include "avr/eeprom.h"

/**
 * @brief Переменные хранящиеся в EEPROM
 */
unsigned char ee_id0 = 0x02; ///< Нулевой байт ID
unsigned char ee_id1 = 0x03; ///< Первый байт ID
unsigned char ee_radio_channel = 4; ///< Номер радио канала 0~9
unsigned char ee_power = 5; ///< Мощность радио сигнала 2~17


/*******************************************************
 * Декларация приватных функций
 *******************************************************/
/** 
 * @brief установка ID модуля
 * @param id уникальный идентификатор Specto A
 */
void key_generate();

/********************************************************
 * Релизация приватных функций
 ********************************************************/
void key_generate() {
    unsigned char msb = 0;
    msb = Lora.id[0] >> 7;
    Lora.key[0] = (Lora.id[0] << 1) + msb;
    msb = Lora.id[1] >> 7;
    Lora.key[1] = (Lora.id[1] << 1) + msb;
}

/********************************************************
 * Реализация публичных функций
 ********************************************************/
void lora_init() {

    /** Настройка порта подключенного к DIO0 модуля LoRa*/
#if PCB == SHEALA_A
    DIO0_DDR &= ~_BV(DIO0);
    DIO0_PORT |= _BV(DIO0);
    EICRB |= _BV(ISC61) | _BV(ISC60); ///< Настраиваем прерывания по переднему фронту DIO0
    EIMSK |= _BV(INT6);

#elif PCB == SPECTO_A
    DIO0_DDR &= ~_BV(DIO0);
    DIO0_PORT |= _BV(DIO0);
    EICRB |= _BV(ISC61) | _BV(ISC60); ///< Настраиваем прерывания по переднему фронту DIO0
    EIMSK |= _BV(INT6);

    /**
     * @warning Кусок кода для Specto A v3.0
     */
    //    DIO0_DDR &= ~_BV(DIO0);
    //    DIO0_PORT &= ~_BV(DIO0);
    //    PCICR |= _BV(PCIE0); // Включаем прерывания pin change
    //    PCMSK0 |= _BV(DIO0); // Включаем преывания на ножке DIO0
#endif

    /**
     * Считывание настроек из EEPROM
     */
    Lora.id[0] = eeprom_read_byte(ee_id0);
    Lora.id[1] = eeprom_read_byte(ee_id1);

    if (Lora.id[0] == 0xFF && Lora.id[0] == 0xFF) {
	Lora.id[1] = 0;
	Lora.id[0] = 1;
    }

    key_generate(Lora.id);

    Lora.radio_channel = eeprom_read_byte(ee_radio_channel);
    if (Lora.radio_channel > 9) {
	Lora.radio_channel = 0;
    }

    Lora.power = eeprom_read_byte(ee_power);
    if (Lora.power > 17) {
	Lora.power = 17;
    } else if (Lora.power < 2) {
	Lora.power = 2;
    }

    Lora.carier_frequency = 863250000 + 500000 * Lora.radio_channel;

    rfm95w_begin(Lora.carier_frequency, Lora.power);
}

void lora_message_encode(unsigned char len) {
    unsigned char i = 0;
    // Кодирование XOR
    while (i < len - 1) {
	Lora.tx_message[i] = Lora.tx_message[i] ^ Lora.key[(i + 1) % 2];
	i++;
    }

    /* Избавление от нулей в сообщении */
    i = 0;
    Lora.tx_message[len - 1] = 0x80;
    while (i < len - 1) {
	if (Lora.tx_message[i] == 0) {
	    Lora.tx_message[i] = 1;
	    Lora.tx_message[len - 1] |= (1 << i);
	}
	i++;
    }
}

void lora_message_decode(unsigned char len) {
    /* Возвращение нулей в посылку */
    for (unsigned char i = 0; i < len - 1; i++) {
	if (Lora.rx_message[len - 1] & (1 << i)) {
	    Lora.rx_message[i] = 0;
	}
    }

    /* Декодирование XOR */
    for (unsigned char i = 0; i < len - 1; i++) {
	Lora.rx_message[i] = Lora.rx_message[i] ^ Lora.key[(i + 1) % 2];
    }
}

void lora_message_send(unsigned char len, uint16_t timeout) {
    rfm95w_packet_begin(1);
    rfm95w_packet_write(Lora.tx_message, len);
    rfm95w_packet_end();
    rfm95w_rx_continious(CONFIG_MSG_LEN);
}

int lora_rx_valid_message(unsigned char len) {
    if (Lora.rx_message[0] == Lora.id[0] &&
	    Lora.rx_message[1] == Lora.id[1] &&
	    ((Lora.rx_message[len - 1] & 0x80) == 0x80)) {
	return 1;
    } else {
	return 0;
    }
}

void lora_configure(unsigned char _radio_channel, unsigned char _power) {
    if (_radio_channel > 9) {
	Lora.radio_channel = 9;
    } else {
	Lora.radio_channel = _radio_channel;
    }

    if (_power > 17) {
	Lora.power = 17;
    } else if (_power < 2) {
	Lora.power = 2;
    } else {
	Lora.power = _power;
    }

    Lora.carier_frequency = 863250000 + 500000 * Lora.radio_channel;

    rfm95w_begin(Lora.carier_frequency, Lora.power);

    /**
     * Запись в EEPROM
     */
    eeprom_write_byte(ee_radio_channel, Lora.radio_channel);
    eeprom_write_byte(ee_power, Lora.power);
}

int8_t lora_alive() {
    if (rfm95w_get_version() == 0x12)
	return 1;

    return 0;
}

void lora_reboot() {
    rfm95w_begin(Lora.carier_frequency, Lora.power);
}

int8_t lora_rx_callback() {
    if (!rfm95w_rxdone_callback(&Lora.rx_message)) {
	lora_message_decode(CONFIG_MSG_LEN);
	rfm95w_rx_continious(CONFIG_MSG_LEN);
	return 0;
    } else {
	rfm95w_rx_continious(CONFIG_MSG_LEN);
	return -1;
    }
}