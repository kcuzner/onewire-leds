/**
 * LED controller
 */
#include "leds.h"

#define LEDS_MASK_RED   (1<<LEDS_PIN_RED)
#define LEDS_MASK_GREEN (1<<LEDS_PIN_GREEN)
#define LEDS_MASK_BLUE  (1<<LEDS_PIN_BLUE)

static uint8_t red_value = 0;
static uint8_t green_value = 0;
static uint8_t blue_value = 0;

void leds_init(void)
{
    LEDS_DDR |= LEDS_MASK_RED | LEDS_MASK_GREEN | LEDS_MASK_BLUE;
}

void leds_set_color(uint8_t red, uint8_t green, uint8_t blue)
{
    red_value = red;
    green_value = green;
    blue_value = blue;
}

void leds_tick(void)
{
    static uint8_t count = 0;

    uint8_t mask = 0;

    if (count == 0)
    {
        //turn on all LEDs
        LEDS_PORT |= LEDS_MASK_RED | LEDS_MASK_GREEN | LEDS_MASK_BLUE;
    }
    else
    {
        //decide which leds get turned off this cycle
        if (count == red_value)
            mask |= LEDS_MASK_RED;
        if (count == green_value)
            mask |= LEDS_MASK_GREEN;
        if (count == blue_value)
            mask |= LEDS_MASK_BLUE;

        //turn off any leds in the mask
        if (mask)
            LEDS_PORT &= ~mask;
    }

    count++;
}
