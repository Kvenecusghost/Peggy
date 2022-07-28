/*
 * rfm95w.h
 *
 *  Created on: Aug 8, 2019
 *      Author: Baiguanysh Sanat
 */

#ifndef RFM95W_INC_RFM95W_H_
#define RFM95W_INC_RFM95W_H_

#ifdef __cplusplus
 extern "C" {
#endif

#define PA_OUTPUT_RFO_PIN       0
#define PA_OUTPUT_PA_BOOST_PIN  1

#include "stm32f1xx_hal.h"

typedef struct LoRa {
	uint32_t id;
	uint32_t msgcnt;
	SPI_HandleTypeDef *spi;
	uint8_t localAddress[2];
	GPIO_TypeDef *nss_port;
	uint16_t nss_pin;
	GPIO_TypeDef *rst_port;
	uint16_t rst_pin;
	GPIO_TypeDef *dio0_port;
	uint16_t dio0_pin;
	uint32_t frequency;
	uint32_t bandwidth;
	uint8_t msg[20];
	uint32_t msgLen;
	uint8_t pktIdx;
	uint8_t implicitHeaderMode;
} LoRa_t;

struct LoRa lora;

int loraInit(
		SPI_HandleTypeDef *hspi,
		GPIO_TypeDef * nss_port, uint16_t nss_pin,
		GPIO_TypeDef * rst_port, uint16_t rst_pin,
		GPIO_TypeDef * dio0_port, uint16_t dio0_pin,
		uint32_t frequency, uint32_t bandwidth
		);

int8_t loraBegin();
int8_t loraRxContinious(uint8_t size);
int8_t loraPktParse(int size);
int8_t loraRxCallback ();
int8_t loraPktWr(const uint8_t *buffer, size_t size);
int8_t loraPktEnd();

void regWr(uint8_t address, uint8_t value);
uint8_t regRd(uint8_t address);

#ifdef __cplusplus
 }
#endif

#endif /* RFM95W_INC_RFM95W_H_ */
