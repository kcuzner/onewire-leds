/**
 * LED controller
 */
#ifndef _LEDS_H_
#define _LEDS_H_

#include <stdint.h>
#include <avr/io.h>

#define LEDS_PORT      PORTB
#define LEDS_DDR       DDRB
#define LEDS_PIN_RED   2
#define LEDS_PIN_GREEN 3
#define LEDS_PIN_BLUE  4

/**
 * Initializes the LED module
 */
void leds_init(void);

/**
 * Sets the current LED color
 */
void leds_set_color(uint8_t red, uint8_t green, uint8_t blue);

/**
 * Tick function for the LEDs
 */
void leds_tick(void);

#endif //_LEDS_H_
