# IRPTeam-5

DESIGN AND IMPLEMENTATION OF TIMER

 **  Difference Between RTC and Timer


->RTC
* A real time clock or rtc is a digital clock with a primary function to keep accurate track of time even when a power supply is turned off or a device is placed in a low power mode.


* RTC's are comprised of a controller,oscillator and an embedded quartz crustal resonator.

-> Timer

* Timer performs its operation only when it is enabled and when there is power supply.


* Timer consists of prescaler,counter,registers,comparator and trigger generator.


**  Timer Components

1)Prescaler

Prescaler is used to divide the clock, it is an electronic counting circuit that reduces a high frequency electrical signal to a lower frequency by integer division. The prescaler takes the basic timer clock frequency (which may be the CPU clock frequency) and divides it by some value before feeding it to the timer, according to how the prescaler is configured.Here we are taking 30MHz clock  input and to comapare the input to the value given by the user, we are scaling this to 1Hz. For this we are using two prescalers.It is used to slow down the clock.

PCLK (30 MHz) is the main input to the Prescaler
newclk_k(1 Hz) is the output of 2 prescalers and that is given as the input to the counter.

2)Counter
A counter has an initial value of 0 at the time of reset. It's value keeps on incrementing by 1 at each clock cycle.Here for every 1 sec the counter value increments until it is reset. output of counter is stored in register named as 'out'.newclk_k (1 Hz frequency clock) is the input to the counter.

3)Comparator
It takes timer_in(user input) and counter output 'out' as inputs and compares them every second. When the count values matches the input given, trigger (trig)is made
high.


** APB Protocol
Advanced Pheripheral Bus
The Advanced Peripheral Bus (APB) is part of the Advanced Microcontroller Bus Architecture (AMBA) protocol family. It defines a low-cost interface that is optimized for minimal power consumption and reduced interface complexity.WE are interfacing the timer with APB.


Files

top1_tb.v - It is our main testbench file.

top.v - It is out top file where interfacing of all the modules is done.

prescaler1.v - It is a clock divider file which converts 100 MHz(inbuilt fpga frequency) to 30 MHz.

prescaler.v - It is a clock divider file which converts 30Mhz to 1 Hz.

counter1.v - Counter which generates count for every second.

comparator.v - Compares timer_in and the count value and generates the trig when both the values matches.


