#include "traffic_light.h"
#include "string.h"
#include "avr/eeprom.h"

/**
 * @brief Переменные хранящиеся в EEPROM
 */
unsigned char ee_signals_type = 0x00; ///< Типы сигналов. 0 - стрелка, 1 - красный
unsigned char ee_arrows_delay = 0x01; ///< Быстродействие стрелки 0~255
//eeprom unsigned char ee_signals_type = 0x3F; ///< Типы сигналов. 0 - стрелка, 1 - красный
//eeprom unsigned char ee_arrows_delay = 5; ///< Быстродействие стрелки 0~255

/**
 * @todo Задать порог детектирования горящего сигнала
 */
unsigned char threshold = 95;

#if PCB == SHEALA_A
#define SIG0 1
#define SIG0_PORT PORTD
#define SIG0_PIN PIND
#define SIG0_DDR DDRD
#define SIG1 0
#define SIG1_PORT PORTD
#define SIG1_PIN PIND
#define SIG1_DDR DDRD
#define SIG2 5
#define SIG2_PORT PORTB
#define SIG2_PIN PINB
#define SIG2_DDR DDRB
#define SIG3 6
#define SIG3_PORT PORTB
#define SIG3_PIN PINB
#define SIG3_DDR DDRB
#define SIG4 6
#define SIG4_PORT PORTD
#define SIG4_PIN PIND
#define SIG4_DDR DDRD
#define SIG5 7
#define SIG5_PORT PORTC
#define SIG5_PIN PINC
#define SIG5_DDR DDRC
#define SIG6 6
#define SIG6_PORT PORTF
#define SIG6_PIN PINF
#define SIG6_DDR DDRF
#define SIG7 7
#define SIG7_PORT PORTF
#define SIG7_PIN PINF
#define SIG7_DDR DDRF
#elif PCB == SPECTO_A
#define SIG0 0
#define SIG0_PORT PORTD
#define SIG0_PIN PIND
#define SIG0_DDR DDRD
#define SIG1 1
#define SIG1_PORT PORTD
#define SIG1_PIN PIND
#define SIG1_DDR DDRD
#define SIG2 2
#define SIG2_PORT PORTD
#define SIG2_PIN PIND
#define SIG2_DDR DDRD
#define SIG3 3
#define SIG3_PORT PORTD
#define SIG3_PIN PIND
#define SIG3_DDR DDRD
#define SIG4 4
#define SIG4_PORT PORTB
#define SIG4_PIN PINB
#define SIG4_DDR DDRB
#define SIG5 5
#define SIG5_PORT PORTB
#define SIG5_PIN PINB
#define SIG5_DDR DDRB
#define SIG6 6
#define SIG6_PORT PORTB
#define SIG6_PIN PINB
#define SIG6_DDR DDRB
#define SIG7 7
#define SIG7_PORT PORTB
#define SIG7_PIN PINB
#define SIG7_DDR DDRB
#endif

void traffic_light_init() {
    /** Включить сигнальные порты на вход */
    SIG0_DDR &= ~_BV(SIG0);
    SIG1_DDR &= ~_BV(SIG1);
    SIG2_DDR &= ~_BV(SIG2);
    SIG3_DDR &= ~_BV(SIG3);
    SIG4_DDR &= ~_BV(SIG4);
    SIG5_DDR &= ~_BV(SIG5);
    SIG6_DDR &= ~_BV(SIG6);
    SIG7_DDR &= ~_BV(SIG7);

    /** Включение подтяжки на сигнальных портах*/
    SIG0_PORT |= _BV(SIG0);
    SIG1_PORT |= _BV(SIG1);
    SIG2_PORT |= _BV(SIG2);
    SIG3_PORT |= _BV(SIG3);
    SIG4_PORT |= _BV(SIG4);
    SIG5_PORT |= _BV(SIG5);
    SIG6_PORT |= _BV(SIG6);
    SIG7_PORT |= _BV(SIG7);

    memset(Traffic_light.ack_array, 0, 8);
    memset(Traffic_light.data_array, 0, 8);
    memset(Traffic_light.arrows_array, 0, 8);
    Traffic_light.data_new = 0;
    
    

    Traffic_light.signals_type = eeprom_read_byte(ee_signals_type);

    Traffic_light.arrows_delay = eeprom_read_byte(ee_arrows_delay);
    if (Traffic_light.arrows_delay > 15) {
	Traffic_light.arrows_delay = 6;
    }
}

void traffic_light_read() {
#if PCB == SHEALA_A
    if (!(SIG0_PIN & _BV(SIG0)))
	Traffic_light.ack_array[0]++;
    if (!(SIG1_PIN & _BV(SIG1)))
	Traffic_light.ack_array[1]++;
    if (!(SIG2_PIN & _BV(SIG2)))
	Traffic_light.ack_array[2]++;
    if (!(SIG3_PIN & _BV(SIG3)))
	Traffic_light.ack_array[3]++;
    if (!(SIG4_PIN & _BV(SIG4)))
	Traffic_light.ack_array[4]++;
    if (!(SIG5_PIN & _BV(SIG5)))
	Traffic_light.ack_array[5]++;
    if (!(SIG6_PIN & _BV(SIG6)))
	Traffic_light.ack_array[6]++;
    if (!(SIG7_PIN & _BV(SIG7)))
	Traffic_light.ack_array[7]++;
#elif PCB == SPECTO_A
    if (SIG0_PIN & _BV(SIG0))
	Traffic_light.ack_array[0]++;
    if (SIG1_PIN & _BV(SIG1))
	Traffic_light.ack_array[1]++;
    if (SIG2_PIN & _BV(SIG2))
	Traffic_light.ack_array[2]++;
    if (SIG3_PIN & _BV(SIG3))
	Traffic_light.ack_array[3]++;
    if (SIG4_PIN & _BV(SIG4))
	Traffic_light.ack_array[4]++;
    if (SIG5_PIN & _BV(SIG5))
	Traffic_light.ack_array[5]++;
    if (SIG6_PIN & _BV(SIG6))
	Traffic_light.ack_array[6]++;
    if (SIG7_PIN & _BV(SIG7))
	Traffic_light.ack_array[7]++;
#endif
}

void traffic_light_process() {
    unsigned char i = 0;
    while (i < 8) {
	if (Traffic_light.signals_type & (1 << i)) { ///< Обработка красного сигнала
	    if (Traffic_light.data_array[i] > threshold) { ///< Горит красный сигнал
		Traffic_light.data_new |= 1 << i;
	    } else { ///< Красный сигнал не горит
		Traffic_light.data_new &= ~(1 << i);
	    }
	} else { ///< Обработка стрелки
	    if (Traffic_light.data_array[i] > threshold) { ///< Стрелка горела последние 150мс
		Traffic_light.data_new |= 1 << i;
		Traffic_light.arrows_array[i] = 0;
	    } else { ///< Стрелка не горела последние 150мс                
		Traffic_light.arrows_array[i]++;
		if (Traffic_light.arrows_array[i] >= Traffic_light.arrows_delay) { ///< Моргание завершилось. 
		    /// Стрелка не горела более 600мс
		    Traffic_light.data_new &= ~(1 << i);
		    Traffic_light.arrows_array[i] = 0;
		}
	    }
	}
	i++;
    }
}

void traffic_light_configure(unsigned char _signals_type,
	unsigned char _arrows_delay) {

    if (_arrows_delay > 15)
	Traffic_light.arrows_delay = 6;
    else
	Traffic_light.arrows_delay = _arrows_delay;
    eeprom_write_byte(ee_arrows_delay, Traffic_light.arrows_delay);

    Traffic_light.signals_type = _signals_type;
    eeprom_write_byte(ee_signals_type, Traffic_light.signals_type);
}