/**
 * Modified 1-Wire Protocol
 */
#include "onewire.h"

#include <avr/interrupt.h>

#define ONEWIRE_PIN_MASK (1<<ONEWIRE_PIN)
#define ONEWIRE_PIN_VALUE (ONEWIRE_INPUT & ONEWIRE_PIN_MASK)

//timer 0 is used for our timing. The presecaler is set at CLK/64 so that
//we get a period of 6 2/3uS per tick given a 9.6MHz clock.
//480uS: 72 ticks
//70uS: 11 ticks
//4 ticks is our sample time after a falling edge, landing at about 26uS
// - NOTE: This is equivalent to 256 clock cycles, giving us ample
//   computation time
#define ONEWIRE_RESET_TICKS 68
#define ONEWIRE_READ_TICKS  4

// state machine states
// TODO: Make sure that a reset during a read or immediately following another reset is registered as a reset
typedef enum { ST_IDLE, ST_BEGIN_RESET, ST_RESET, ST_READ, ST_DONE } state_t;

static volatile uint8_t byte_flag = 0;
static volatile uint8_t finished_byte = 0;
static volatile uint8_t current_byte = 0;
static volatile uint8_t next_bit = 0;

static volatile state_t state = ST_IDLE;


void onewire_init(void)
{
    //we want an input on our pin
    ONEWIRE_DDR &= ~ONEWIRE_PIN_MASK;

    //interrupt on rising edges of INT0
    MCUCR &= 0xFC; //clear bottom two bits
    MCUCR |= (1<<ISC01) | (1<<ISC00); //ISC01 = 1, ISC00 = 1 => interrupt on rising edge
    GIMSK |= (1<<INT0);

    TCCR0A = 0; //normal operation
    TCCR0B = (1<<CS01) | (1<<CS00); //clock source is clk/64
    TIMSK0 = (1<<OCIE0B) | (1<<OCIE0A) | (1<<TOIE0); //enable all interrupts for the timer

    //since the timer is reset to 0 on a falling edge, we can use the following:
    //interrupt A: Time to sample!
    //interrupt B: A reset has just occurred if the line is still low, otherwise its been too long since the last falling edge
    //overflow: It's been too long since the last falling edge
    OCR0A = ONEWIRE_READ_TICKS;
    OCR0B = ONEWIRE_RESET_TICKS;
}

uint8_t onewire_has_new_byte(void)
{
    return byte_flag;
}

uint8_t onewire_read_byte(void)
{
    byte_flag = 0;
    return finished_byte;
}

//falling edge
ISR(INT0_vect)
{
    if (ONEWIRE_PIN_VALUE)
    {
        //every falling edge resets the timer
        TCNT0 = 0;

        PORTB |= (1<<0);

        switch(state)
        {
        case ST_IDLE:
            state = ST_BEGIN_RESET;
            break;
        case ST_RESET:
            //we are now reading a byte
            state = ST_READ;
            break;
        case ST_DONE:
            //we are now idle
            state = ST_IDLE;
            break;
        default:
            break;
        }
    }
}

//compare A: 26uS since last falling edge
ISR(TIM0_COMPA_vect)
{
    switch(state)
    {
    case ST_READ:
        //it is time to sample
        current_byte >>= 1;
        if (!ONEWIRE_PIN_VALUE) //inverted values for our ground-based bus (0 = 1)
            current_byte |= 0x80; //LSB first
        next_bit++;
        if (next_bit > 7)
        {
            //we are done reading. We wait for the next reset
            state = ST_DONE;
            //we have a byte!
            finished_byte = current_byte;
            byte_flag = 1;
        }
        break;
    default:
        break;
    }
}

//compare B: 480uS since last falling edge or since last timer overflow
ISR(TIM0_COMPB_vect)
{
    switch(state)
    {
    case ST_BEGIN_RESET:
        if (ONEWIRE_PIN_VALUE)
        {
            PORTB &= ~(1<<0);
            //still high? we have a reset
            state = ST_RESET;
            current_byte = 0;
            next_bit = 0;
        }
        else
        {
            state = ST_IDLE;
        }
        break;
    default:
        //it's been too long since the last falling edge
        state = ST_IDLE;
        break;
    }
}

ISR(TIM0_OVF_vect)
{
    switch(state)
    {
    case ST_RESET:
        //we don't mind overflowing the timer here
        break;
    default:
        //It's been too long since the last falling edge
        state = ST_IDLE;
        break;
    }
}
