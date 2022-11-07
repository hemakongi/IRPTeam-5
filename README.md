# IRPTeam-5

DESIGN AND IMPLEMENTATION OF TIMER

 ** Difference Between RTC and Timer


->RTC
* A real time clock or rtc is a digital clock with a primary function to keep accurate track of time even when a power supply is turned off or a device is placed in a low power mode.


* RTC's are comprised of a controller,oscillator and an embedded quartz crustal resonator.

-> Timer

* Timer performs its operation only when it is enabled and when there is power supply.


* Timer consists of prescaler,counter,registers,comparator and trigger generator.

** Timer Components

1)Prescaler

Prescaler is used to divide the clock, it is an electronic counting circuit that reduces a high frequency electrical signal to a lower frequency by integer division. The prescaler takes the basic timer clock frequency (which may be the CPU clock frequency) and divides it by some value before feeding it to the timer, according to how the prescaler is configured.Here we are taking 30MHz clock  input and to comapare the input to the value given by the user, we are scaling this to 1Hz. For this we are using two prescalers.
