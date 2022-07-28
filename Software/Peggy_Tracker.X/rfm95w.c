/*
 * rfm95w.c
 *
 *  Created on: Aug 8, 2019
 *      Author: Baiguanysh Sanat
 *  Библиотека для управления LoRa модуля RFM95W / SX1278 / HPD13
 *
 *  Для работы библиотеки необходим настроенный интерфейс SPI:
 *  	Mode: full-duplex Master
 *  	Hardware NSS: disable
 *  	Frame Format: Motorola
 *  	Data Size: 8 bits
 *  	First bit: MSB
 *  	Prescaler 4
 *  	Baud Rate: 2.0MBits/s
 *  	CPOL: Low
 *  	CPHA: Leading Edge
 *  	CRC: Disabled
 *  	NSS: Software
 *
 */

#include "rfm95w.h"
#include "lora.h"

// registers
#define REG_FIFO                	0x00
#define REG_OP_MODE 				0x01
#define REG_FRF_MSB             	0x06
#define REG_FRF_MID             	0x07
#define REG_FRF_LSB             	0x08
#define REG_PA_CONFIG            	0x09
#define REG_LNA                  	0x0c
#define REG_FIFO_ADDR_PTR        	0x0d
#define REG_FIFO_TX_BASE_ADDR    	0x0e
#define REG_FIFO_RX_BASE_ADDR    	0x0f
#define REG_FIFO_RX_CURRENT_ADDR 	0x10
#define REG_IRQ_FLAGS_MASK		0x11
#define REG_IRQ_FLAGS            	0x12
#define REG_RX_NB_BYTES          	0x13
#define REG_PKT_RSSI_VALUE       	0x1a
#define REG_PKT_SNR_VALUE        	0x1b
#define REG_MODEM_CONFIG_1       	0x1d
#define REG_MODEM_CONFIG_2       	0x1e
#define REG_PREAMBLE_MSB         	0x20
#define REG_PREAMBLE_LSB         	0x21
#define REG_PAYLOAD_LENGTH       	0x22
#define REG_MODEM_CONFIG_3       	0x26
#define REG_RSSI_WIDEBAND        	0x2c
#define REG_DETECTION_OPTIMIZE   	0x31
#define REG_DETECTION_THRESHOLD  	0x37
#define REG_SYNC_WORD            	0x39
#define REG_DIO_MAPPING_1        	0x40
#define REG_VERSION              	0x42

// modes
#define MODE_LONG_RANGE_MODE     	0x80
#define MODE_SLEEP               	0x00
#define MODE_STDBY               	0x01
#define MODE_FSTX					0x02
#define MODE_TX                  	0x03
#define MODE_FSRX					0x04
#define MODE_RX_CONTINUOUS       	0x05
#define MODE_RX_SINGLE           	0x06
#define MODE_CAD					0x07

// PA config
#define PA_BOOST                 	0x80
#define RFO                      	0x70

// IRQ masks
#define IRQ_RX_TIMEOUT_MASK			0x80
#define IRQ_RX_DONE_MASK			0x40
#define IRQ_CRC_CHECK_ERROR_MASK	0x20
#define IRQ_VALID_HEADER_MASK		0x10
#define IRQ_TX_DONE_MASK           	0x08
#define IRQ_CAD_DONE_MASK			0x04
#define IRQ_FHSS_CHCH_MASK			0x02
#define IRQ_CAD_DETECTED_MASK		0x01

#define MAX_PKT_LENGTH           	255


/****************************************************
 * @brief Объявления приватных функции
 ****************************************************/

/**
 * @brief Считывает значение регистра из модуля rfm95w
 * @param addr Адрес регистра для считывания
 * @return Значение регистра
 */
uint8_t register_read(uint8_t addr);

/**
 * @brief Записывает новое значение в регистр модуля rfm95w
 * @param address Адрес регистра для записи
 * @param value Значение для записи в регистр
 */
void register_write(uint8_t address, uint8_t value);

/**
 * @brief Переводит модуль в режим сна
 */
void mode_sleep();

/**
 * @brief Переводит модуль в режим ожидания
 */
void mode_standby();

/**
 * @brief Режим приёма/передачи без опционального заголовка
 */
void header_implicit();

/**
 * @brief Режим приёма/передачи с опциональным заголовком
 */
void header_explicit();

/**
 * @brief Установка несущей частоты в модуле rfm95w
 * @param frequency несущая частота радиосигнала
 */
void frequency_set(long frequency);

/**
 * @brief Установка мощности передачи радиосигнала в модуле rfm95w
 * @param level уровень сигнала. Если выбран усилитель RF0, то мощность 0~14dBm.
 * Если выбран усилитель PA_BOOST, то мощность может быть 2~17dBm.
 * @param outputPin Выбор усилителя PA_OUTPUT_RFO_PIN или PA_OUTPUT_PA_BOOST_PIN
 */
void tx_power_set(int level, int outputPin);

/**
 * @brief Проверяет наличие данных в приёмном буфере модуля rfm95w
 * @return Количество принятых байт в буфере модуля rfm95w
 */
int payload_available();

/**
 * @brief Считывает байт из приёмного буфера модуля
 * @return Байт из приёмного буфера
 */
int byte_read();

/**
 * @brief Установка ширины полосы сигнала
 * @param sbw Ширина полосы сигнала 7,8kHz~500kHz
 */
void bandwidth_set(long sbw);

/**
 * @brief Сбрасывает флаги прерываний в модуле rfm95w
 * @param irq Битовая маска флагового регистра. 1 - сбросить флаг, 
 * 0 - не трогать флаг
 * @return Состояние флагового регистра
 */
unsigned char irq_clear(unsigned char irqflg);

/*********************************************
 * @brief Реализация приватных функций
 *********************************************/
void mode_sleep() {
    register_write(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_SLEEP);
}

void mode_standby() {
    register_write(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_STDBY);
}

uint8_t register_read(uint8_t addr) {
    uint8_t txd = addr & 0x7f;
    uint8_t rxd[2] = {0};

    spi_nss_low();
    spi_TxRx_single(txd);
    txd = 0x00;
    rxd[1] = spi_TxRx_single(txd);
    spi_nss_high();

    return rxd[1];
}

void register_write(uint8_t addr, uint8_t val) {
    uint8_t txd = addr | 0x80;

    spi_nss_low();
    spi_TxRx_single(txd);
    spi_TxRx_single(val);
    spi_nss_high();
}

void frequency_set(long frequency) {
    frequency = frequency;
    uint64_t frf = ((uint64_t) frequency << 19) / 32000000;
    register_write(REG_FRF_MSB, (uint8_t) (frf >> 16));
    register_write(REG_FRF_MID, (uint8_t) (frf >> 8));
    register_write(REG_FRF_LSB, (uint8_t) (frf >> 0));
}

void bandwidth_set(long sbw) {
    int bw;
    if (sbw <= 7.8E3) {
	bw = 0;
    } else if (sbw <= 10.4E3) {
	bw = 1;
    } else if (sbw <= 15.6E3) {
	bw = 2;
    } else if (sbw <= 20.8E3) {
	bw = 3;
    } else if (sbw <= 31.25E3) {
	bw = 4;
    } else if (sbw <= 41.7E3) {
	bw = 5;
    } else if (sbw <= 62.5E3) {
	bw = 6;
    } else if (sbw <= 125E3) {
	bw = 7;
    } else if (sbw <= 250E3) {
	bw = 8;
    } else /*if (sbw <= 250E3)*/ {
	bw = 9;
    }
    register_write(REG_MODEM_CONFIG_1, (register_read(REG_MODEM_CONFIG_1) & 0x0f) | (bw << 4));
}

void tx_power_set(int level, int outputPin) {
    if (PA_OUTPUT_RFO_PIN == outputPin) {
	// RF0
	if (level < 0) {
	    level = 0;
	} else if (level > 14) {
	    level = 14;
	}
	register_write(REG_PA_CONFIG, RFO | (level + 1));
    } else {
	// PA BOOST
	if (level < 2) {
	    level = 2;
	} else if (level > 17) {
	    level = 17;
	}
	register_write(REG_PA_CONFIG, PA_BOOST | (level - 2));
    }
}

void header_implicit() {
    RFM95W.header_mode = 1;
    register_write(REG_MODEM_CONFIG_1, register_read(REG_MODEM_CONFIG_1) | 0x01);
}

void header_explicit() {
    RFM95W.header_mode = 0;
    register_write(REG_MODEM_CONFIG_1, register_read(REG_MODEM_CONFIG_1) & 0xfe);
}

int payload_available() {
    return (register_read(REG_RX_NB_BYTES) - RFM95W.packet_index);
}

int byte_read() {
    RFM95W.packet_index++;
    return register_read(REG_FIFO);
}

unsigned char irq_clear(unsigned char irqflg) {
    register_write(REG_IRQ_FLAGS, irqflg);
    return register_read(REG_IRQ_FLAGS);
}

/******************************************
 * @brief Реализация глобальных функций
 ******************************************/
int rfm95w_packet_parse(int size) {
    int pktLen = 0;
    int irqFlg = register_read(REG_IRQ_FLAGS);

    if (size > 0) {
	header_implicit();
	register_write(REG_PAYLOAD_LENGTH, size & 0xff);
    } else {
	header_explicit();
    }

    register_write(REG_IRQ_FLAGS, irqFlg);

    if ((irqFlg & IRQ_RX_DONE_MASK)
	    && (irqFlg & IRQ_CRC_CHECK_ERROR_MASK) == 0) {
	RFM95W.packet_index = 0;
	if (RFM95W.header_mode) {
	    pktLen = register_read(REG_PAYLOAD_LENGTH);
	} else {
	    pktLen = register_read(REG_RX_NB_BYTES);
	}
	register_write(REG_FIFO_ADDR_PTR, register_read(REG_FIFO_RX_CURRENT_ADDR));
	mode_standby();
    } else if (register_read(REG_OP_MODE)
	    != (MODE_LONG_RANGE_MODE | MODE_RX_SINGLE)) {
	register_write(REG_FIFO_ADDR_PTR, 0);
	register_write(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_RX_SINGLE);
    }
    return pktLen;
}

char rfm95w_begin(long frequency, unsigned char power) {
    spi_init();

    spi_rst_low();
    _delay_ms(100);
    spi_rst_high();
    _delay_ms(100);


    RFM95W.packet_index = 0;

    spi_nss_high();

    uint8_t version = register_read(REG_VERSION);
    if (version != 0x12) {
	return -1;
    }
    mode_sleep();
    frequency_set(frequency);
    bandwidth_set(BANDWIDTH); // установка ширины полосы

    register_write(REG_FIFO_TX_BASE_ADDR, 0); // настройка базовых адресов для FIFO буферов приема и передачи
    register_write(REG_FIFO_RX_BASE_ADDR, 0);
    
    register_write(REG_MODEM_CONFIG_2, register_read(REG_MODEM_CONFIG_2) | (1 << 2)); // Включение CRC

    register_write(REG_LNA, register_read(REG_LNA) | 0x03); // Включение Low Noise Amplifier Boost (усиление приемника)
    register_write(REG_MODEM_CONFIG_3, 0x04); // Включение авто подстройки КУ приемника
    tx_power_set(power, PA_BOOST); // Выходная мощность 
    mode_standby(); // Переход в режим ожидания Stand-by

    return 0;
}

char rfm95w_packet_begin(char hm) {
    // put in standby mode
    mode_standby();
    if (hm) {
	header_implicit();
    } else {
	header_explicit();
    }
    // reset FIFO address and payload length
    register_write(REG_FIFO_ADDR_PTR, 0);
    register_write(REG_PAYLOAD_LENGTH, 0);
    return 0;
}

int8_t rfm95w_packet_end() {
    // put in TX mode
    register_write(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_TX);
    // wait for TX done
    while (!(register_read(REG_IRQ_FLAGS) & IRQ_TX_DONE_MASK))
	;
    // clear IRQ's
    register_write(REG_IRQ_FLAGS, IRQ_TX_DONE_MASK);
    return RFM95W_OK;
}

char rfm95w_packet_write(unsigned char *buffer, unsigned char size) {
    int currentLength = register_read(REG_PAYLOAD_LENGTH);
    // Проверить объём данных
    if ((currentLength + size) > MAX_PKT_LENGTH) {
	size = MAX_PKT_LENGTH - currentLength;
    }
    // Записать данные
    for (unsigned char i = 0; i < size; i++) {
	register_write(REG_FIFO, buffer[i]);
    }
    // Обновить количество данных для передачи
    register_write(REG_PAYLOAD_LENGTH, currentLength + size);
    return size;
}

void rfm95w_rx_continious(unsigned char size) {
    //    mode_standby();
    //    RFM95W.packet_index = 0;
    RFM95W.message_length = size;
    if (size > 0) {
	header_implicit();
	register_write(REG_PAYLOAD_LENGTH, size & 0xff);
    } else {
	header_explicit();
    }
    irq_clear(0xff);
    register_write(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_RX_CONTINUOUS);
}

uint8_t rfm95w_packet_read() {
    if (!payload_available()) return -1;
    RFM95W.packet_index++;
    return register_read(REG_FIFO);
}

char rfm95w_rxdone_callback(unsigned char * buf) {
    unsigned char irqflg = register_read(REG_IRQ_FLAGS);
    irq_clear(0xff);
    mode_standby();
    if ((irqflg & IRQ_RX_DONE_MASK) && ((irqflg & IRQ_CRC_CHECK_ERROR_MASK) == 0)) { // нет ошибок CRC
	RFM95W.packet_index = 0;
	uint8_t packetLength = register_read(REG_RX_NB_BYTES);
	register_write(REG_FIFO_ADDR_PTR, register_read(REG_FIFO_RX_CURRENT_ADDR));
	if (packetLength == RFM95W.message_length) {
	    uint8_t i = 0;
	    while (payload_available()) {
		buf[i++] = byte_read();
	    }
	    return 0;
	} else {
	    return -2;
	}
    } else {
	return -1;
    }
}

int8_t rfm95w_get_version() {
    return register_read(REG_VERSION);
}

