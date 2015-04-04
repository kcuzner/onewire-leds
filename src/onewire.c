/**
 * Modified 1-Wire Protocol
 */
#include "onewire.h"

#define ONEWIRE_PIN_MASK (1<<ONEWIRE_PIN)

static uint8_t byte_flag = 0;
static uint8_t current_byte = 0;

void onewire_init(void)
{
    //we want an input on our pin
    ONEWIRE_DDR &= ~ONEWIRE_PIN_MASK;
}

uint8_t onewire_has_new_byte(void)
{
    return byte_flag;
}

uint8_t onewire_read_byte(void)
{
    byte_flag = 0;
    return current_byte;
}
