/**
 * 1-Wire LED
 */
#include "leds.h"
#include "onewire.h"

#include <avr/pgmspace.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>

#define N_CHANNELS 16
#define OFF_TIME   0xFFFF

#define GET_CHAN(V)  (V & 0x0F)
#define GET_BLINK(V) (V & 0x10)

#define GET_RED(V)   ((V & 0xFF0000) >> 16)
#define GET_GREEN(V) ((V & 0x00FF00) >> 8)
#define GET_BLUE(V)  (V & 0x0000FF)

/**
 * Fuse data for this program to work properly on the ATTiny13A
 */
#ifdef __AVR_ATtiny13A__
FUSES = {
    .low = (FUSE_SPIEN & FUSE_SUT0 & FUSE_CKSEL0), //9.6MHz, no ckdiv8
    .high = (FUSE_BODLEVEL1) //brown out at 2.7V
};
#else
#error "No fuses defined for selected processor"
#endif

/**
 * Channel color values in 24-bit format
 */
static const uint32_t PROGMEM channel_colors[N_CHANNELS] = {
    0xff0000, //channel 1
    0xff9900,
    0xccff00,
    0x33ff00,
    0x00ff66,
    0x00ffff,
    0x0066ff,
    0x3300ff,
    0xcc00ff,
    0xff0099, //channel 10
    0xff0099, //overflow
    0xff0099, //overflow
    0xff0099, //overflow
    0xff0099, //overflow
    0xff0099, //overflow
    0xff0099 //overflow
};

int main(void)
{
    uint8_t val, chan;
    uint32_t color;
    uint16_t i;

    wdt_enable(WDTO_15MS);

    leds_init();
    onewire_init();

    //delay at the beginning to ensure we have a steady supply before turning on the LEDs
    for (i = 0; i < OFF_TIME; i++)
    {
        wdt_reset();
    }

    DDRB |= (1<<0);

    sei();

    while(1)
    {
        wdt_reset();
        leds_tick();

        if (onewire_has_new_byte())
        {
            val = onewire_read_byte();
            chan = GET_CHAN(val);
            color = pgm_read_dword(&channel_colors[chan]);
            leds_set_color(GET_RED(color), GET_GREEN(color), GET_BLUE(color));
            if (GET_BLINK(val))
            {
                leds_begin_off(OFF_TIME);
            }
        }
    }

    return 0;
}
