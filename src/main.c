/**
 * 1-Wire LED
 */
#include "leds.h"

int main(void)
{
    leds_init();

    while(1)
    {
        leds_tick();
    }
    
    return 0;
}
