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
 *  	CPHA: 1 Edge
 *  	CRC: Disabled
 *  	NSS: Software
 *
 * Параметры режима передачи данных:
 * 	режим передачи: continuous
 *
 */

#include "rfm95w.h"

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
#define REG_IRQ_FLAGS_MASK			0x11
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

/*
 * Прототипы приватных функций библиотеки
 */


void freqSet(long frequency);
void txPowerSet(int level, int outputPin);
void signalBandwidthSet(long sbw);
int8_t codingRateSet4(uint8_t denominator);
int8_t spreadingFactorSet(uint8_t sf);
void csHigh();
void csLow();
void rstHigh();
void rstLow();
void implicitHeaderMode();
void explicitHeaderMode();
int payloadAvailable();
int readPayload();
uint8_t clearIrq(uint8_t irq);
void modeSleep();
int8_t preambleSet(unsigned long length);

/*
 *
 *
 * Локальные функции
 *
 *
 */
void csHigh() {
	HAL_GPIO_WritePin(lora.nss_port, lora.nss_pin, GPIO_PIN_SET);
}

void csLow() {
	HAL_GPIO_WritePin(lora.nss_port, lora.nss_pin, GPIO_PIN_RESET);
}

void rstHigh() {
	HAL_GPIO_WritePin(lora.rst_port, lora.rst_pin, GPIO_PIN_SET);
}

void rstLow() {
	HAL_GPIO_WritePin(lora.rst_port, lora.rst_pin, GPIO_PIN_RESET);
}

void modeSleep() {
	regWr(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_SLEEP);
}

void modeStandby() {
	regWr(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_STDBY);
}

uint8_t regRd(uint8_t addr) {
	uint8_t txd = addr & 0x7f;
	uint8_t rxd[2] = { 0 };

	csLow();
	HAL_SPI_TransmitReceive((SPI_HandleTypeDef*) lora.spi, &txd, &rxd[0],
			sizeof(rxd[0]), 0x1000);
	txd = 0x00;
	HAL_SPI_TransmitReceive((SPI_HandleTypeDef*) lora.spi, &txd, &rxd[1],
			sizeof(rxd[1]), 0x1000);
	csHigh();

	return rxd[1];
}

void regWr(uint8_t addr, uint8_t val) {
	uint8_t txd = addr | 0x80;

	csLow();
	HAL_SPI_Transmit((SPI_HandleTypeDef*) lora.spi, &txd, sizeof(txd), 0x1000);
	HAL_SPI_Transmit((SPI_HandleTypeDef*) lora.spi, &val, sizeof(txd), 0x1000);
	csHigh();
}

void freqSet(long frequency) {
	uint64_t frf = ((uint64_t) frequency << 19) / 32000000;
	regWr(REG_FRF_MSB, (uint8_t) (frf >> 16));
	regWr(REG_FRF_MID, (uint8_t) (frf >> 8));
	regWr(REG_FRF_LSB, (uint8_t) (frf >> 0));
}

void txPowerSet(int level, int outputPin) {
	if (PA_OUTPUT_RFO_PIN == outputPin) {
// RF0
		if (level < 0) {
			level = 0;
		} else if (level > 14) {
			level = 14;
		}
		regWr(REG_PA_CONFIG, RFO | (level + 1));
	} else {
// PA BOOST
		if (level < 2) {
			level = 2;
		} else if (level > 17) {
			level = 17;
		}
		regWr(REG_PA_CONFIG, PA_BOOST | (level - 2));
	}
}

int8_t codingRateSet4(uint8_t denominator) {
	if (denominator < 5) {
		denominator = 5;
	} else if (denominator > 8) {
		denominator = 8;
	}
	int cr = denominator - 4;
	regWr(REG_MODEM_CONFIG_1, (regRd(REG_MODEM_CONFIG_1) & 0xf1) | (cr << 1));
	return 0;
}

int8_t spreadingFactorSet(uint8_t sf) {
	if (sf < 6) {
		sf = 6;
	} else if (sf > 12) {
		sf = 12;
	}
	if (sf == 6) {
		regWr(REG_DETECTION_OPTIMIZE, 0xc5);
		regWr(REG_DETECTION_THRESHOLD, 0x0c);
	} else {
		regWr(REG_DETECTION_OPTIMIZE, 0xc3);
		regWr(REG_DETECTION_THRESHOLD, 0x0a);
	}
	regWr(REG_MODEM_CONFIG_2,
			(regRd(REG_MODEM_CONFIG_2) & 0x0f) | ((sf << 4) & 0xf0));
	return 0;
}

int8_t preambleSet(unsigned long length) {
	regWr(REG_PREAMBLE_MSB, (uint8_t) (length >> 8));
	regWr(REG_PREAMBLE_LSB, (uint8_t) (length >> 0));
	return 0;
}

void signalBandwidthSet(long sbw) {
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
	} else /*if (sbw <= 250E3)*/{
		bw = 9;
	}
	regWr(REG_MODEM_CONFIG_1, (regRd(REG_MODEM_CONFIG_1) & 0x0f) | (bw << 4));
}

uint8_t clearIrq(uint8_t irq) {
	regWr(REG_IRQ_FLAGS, irq);
	return regRd(REG_IRQ_FLAGS);
}

void implicitHeaderMode() {
	lora.implicitHeaderMode = 1;
	regWr(REG_MODEM_CONFIG_1, regRd(REG_MODEM_CONFIG_1) | 0x01);
}
void explicitHeaderMode() {
	lora.implicitHeaderMode = 0;
	regWr(REG_MODEM_CONFIG_1, regRd(REG_MODEM_CONFIG_1) & 0xfe);
}

int payloadAvailable() {
	return (regRd(REG_RX_NB_BYTES) - lora.pktIdx);
}

int readPayload() {
	if (!payloadAvailable()) {
		return -1;
	}
	lora.pktIdx++;
	return regRd(REG_FIFO);
}

/*
 *
 *
 * Public Functions
 *
 *
 *
 */

int loraInit(SPI_HandleTypeDef *hspi, GPIO_TypeDef *nss_port, uint16_t nss_pin,
		GPIO_TypeDef *rst_port, uint16_t rst_pin, GPIO_TypeDef *dio0_port,
		uint16_t dio0_pin, uint32_t frequency, uint32_t bandwidth) {
	lora.spi = hspi;
	lora.msgcnt = 0;
	lora.nss_port = nss_port;
	lora.nss_pin = nss_pin;
	lora.rst_port = rst_port;
	lora.rst_pin = rst_pin;
	lora.dio0_port = dio0_port;
	lora.dio0_pin = dio0_pin;
	lora.frequency = frequency;
	lora.bandwidth = bandwidth;

	rstLow();
	HAL_Delay(10);
	rstHigh();
	HAL_Delay(10);
	return loraBegin(lora.frequency, lora.bandwidth);
}

int8_t loraBegin() {
	lora.pktIdx = 0;

	csHigh();

	uint8_t version = regRd(REG_VERSION);
	if (version != 0x12) {
		return -1;
	}

	modeSleep();

	freqSet(lora.frequency);	// настройка центральной несущей частоты
//	preambleSet(64);
//	spreadingFactorSet(7);
	signalBandwidthSet(lora.bandwidth); // установка ширины полосы
//	codingRateSet4(8);

	// настройка базовых адресов для FIFO буферов приема и передачи
	regWr(REG_FIFO_TX_BASE_ADDR, 0);
	regWr(REG_FIFO_RX_BASE_ADDR, 0);

	regWr(REG_LNA, regRd(REG_LNA) | 0x03); // Включение Low Noise Amplifier Boost (усиление приемника)
	regWr(REG_MODEM_CONFIG_3, 0x04); // Включение авто подстройки КУ приемника
	txPowerSet(17, PA_BOOST); // Мощность передатчика 17 dBm


	modeStandby(); // Переход в режим ожидания Stand-by

	return 0;
}

/*!
 Начинает работу модуля в режиме непрерывного приёма. В данном режиме при получении
 сообщения в модуле запускается прерывание RX_DONE но не происходит переход в режим STAND_BY.
 Кроме того игнорируется прерывание RX_TIMEOUT. Для отслеживания прерывания RX_DONE можно
 воспользоваться ножкой DIO0 модуля.
 \param [out] возвращает 0, если модуль успешно инициализирован в режиме непрерывного приёма
 \param [in] size длина ожидаемой полезной нагрузки
 */
int8_t loraRxContinious(uint8_t size) {
	modeStandby();
	lora.pktIdx = 0;
	lora.msgLen = size;
	if (size > 0) {
		implicitHeaderMode();
		regWr(REG_PAYLOAD_LENGTH, size & 0xff);
	} else {
		explicitHeaderMode();
	}
	clearIrq(0xff);
	regWr(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_RX_CONTINUOUS);
	return 0;
}

/*!
 Начинает работу модуля в режиме единичной посылки. В данном режиме при получении
 сообщения генерируется прерывание RX_DONE и модуль переходит в режим STAND_BY.
 Кроме того переход в режим STAND_BY может произойти по прерыванияю RX_TIMEOUT.
 Для отслеживания прерывания RX_DONE можно воспользоваться ножкой DIO0 модуля.
 \param [out] возвращает 0, если модуль успешно инициализирован в режим единичного сообщения
 */
int loraRxSingle() {
	lora.pktIdx = 0;
	modeStandby(); // переход в standby режим
	regWr(REG_FIFO_ADDR_PTR, REG_FIFO_RX_BASE_ADDR); // Устанавливаем указатель в начало буфера приема
	clearIrq(0xff);
	regWr(REG_OP_MODE, MODE_LONG_RANGE_MODE & MODE_RX_SINGLE); // Переходим в режим RX_SINGLE
	return 0;
}

/*!
 Подготавливает модуль к режиму передачи
 \param [out] возвращает 0, если модуль успешно подготовлен к режиму передачи
 \param [in] implicitHeader 1 - если передача без опционального заголовка, 0 если передача с опциональным заголовком
 */
int8_t loraPktBegin(int implicitHeader) {
	modeStandby();
	if (implicitHeader) {
		implicitHeaderMode();
	} else {
		explicitHeaderMode();
	}
	// сброс адресов FIFO и длины посылки
	regWr(REG_FIFO_ADDR_PTR, 0);
	regWr(REG_PAYLOAD_LENGTH, 0);
	return 0;
}

/*!
 Передача данных из буфера передачи FIFO_TX по радиоканалу
 param [out] возвращает 0, если данные успешно отправлены
 */
int8_t loraPktEnd() {
	regWr(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_TX); // В режим передачи
	while ((regRd(REG_IRQ_FLAGS) & IRQ_TX_DONE_MASK) == 0)
		;	// Ожидаем пока не закончится передача
	clearIrq(IRQ_TX_DONE_MASK); // Сброс прерываний
	return 0;
}

/*!
 Запись данных в буфер для последующей передачи по радиоканалу
 param [out] возвращает количество переданных байт
 param [in] buffer массив данных в памяти МК
 param [in] size количество байт для передачи
 */
int8_t loraPktWr(const uint8_t *buffer, size_t size) {
	int currentLength = regRd(REG_PAYLOAD_LENGTH);
	// check size
	if ((currentLength + size) > MAX_PKT_LENGTH) {
		size = MAX_PKT_LENGTH - currentLength;
	}
	// write data
	for (size_t i = 0; i < size; i++) {
		regWr(REG_FIFO, buffer[i]);
	}
	// update length
	regWr(REG_PAYLOAD_LENGTH, currentLength + size);
	return size;
}

/*!
 Обработчик прерывания RX_DONE. Вызывается обработчиком прерывания GPIO
 \param [out] возвращает 0 если приём успешен, -1 если произошла ошибка CRC, -2 если длина сообщения не совпадает с ожидаемой
 */
int8_t loraRxCallback() {
	uint8_t irq = regRd(REG_IRQ_FLAGS);
	clearIrq(0xff);
	modeStandby();
	if ((irq & IRQ_RX_DONE_MASK) && ((irq & IRQ_CRC_CHECK_ERROR_MASK) == 0)) { // нет ошибок CRC
		uint8_t packetLength = regRd(REG_RX_NB_BYTES);
		regWr(REG_FIFO_ADDR_PTR, regRd(REG_FIFO_RX_CURRENT_ADDR));
		if (packetLength == lora.msgLen) {
			uint8_t i = 0;
			while (payloadAvailable()) {
				lora.msg[i++] = readPayload();
			}
			return 0;
		} else {
			return -2;
		}
	} else {
		return -1;
	}
}
