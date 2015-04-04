# One-wire LED

## Purpose

This project is part of a larger team design project. This particular portion
is an RGB LED controlled by its own power wire using a variant of the 1-wire
protocol.

## Protocol

The standard 1-wire protocol uses only two lines: power and ground. Data is
transmitted to and from slave devices by a master device by toggling the power
line low for short periods of time. The slave devices maintain their power
during these short losses using a diode-capacitor rectifier circuit. However,
this protocol is not suitable for devices requiring more than a few hundred
microamps due to the fact that a large pullup resistor is used on the power
line and drawing too much current causes an unacceptable voltage drop.

This device uses a modified version of the protocol that sacrifices the
bi-directionality of the protocol for the ability to supply comparatively large
amounts of current to attached devices. This is accomplished by using a
P-channel MOSFET to switch the power off on the master side in short intervals.
No pull-up resistor is used and there is no corresponding open collector
transistor on the slave devices (thus removing the bi-directional capability).
So long as the capacitor on the slave side of the bus is large enough to
sustain their individual current draw, the bus can provide both data and power
to devices requiring several several 10s of milliamps of current to operate
property (such as an RGB led controller).

This protcol has been modified from the actual 1-wire specification to be
simpler to use with a 100KHz tick rate on the master in addition to necessary
modifications due to the loss of bidirectionality.

The protocol is as follows:
 * A reset is performed by holding the line low for 480uS. This device will
   listen for a continuously low input for the full 480uS without any additional
   edges. The master should allow the line to float for another 480uS. Normally,
   the presence pulse would be read during this time. However, there is no
   presence pulse in this system.
 * Following a reset, A falling edge must occur within 70uS. This marks the
   start of the LSB of the transmitted byte.
 * To write a 0, the master brings the line low for 60uS. The slave will sample
   between 20-30uS following the falling edge. Following this, the master will
   allow the line to float for 10uS before beginning the next bit.
 * To write a 1, the master brings the line low for 10uS and releases it. The
   slave will sample between 20-30uS following the falling edge. The master will
   allow the line to float for 60uS after the initial low pulse.
 * A transaction consists of the reset pulse following by 8 write pulses.
