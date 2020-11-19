* Array Test
.inc ../Array/2R_default_16_16_1bit.sp
.param V_DD=1.5
.param V_WRITE=1.5
.param V_HOLD=0.75
.param V_READ=0.5
.param V_REF=0.25
.option post=2

* DUT
Xdefault_2R_16_16_1bit din0_0 addr0_0 addr0_1 addr0_2 addr0_3 addr0_4 addr0_5 addr0_6 addr0_7 csb0 web0 reb0 clk0 dout0_0 vdd gnd vwrite vread vhold vref default_2R_16_16_1bit

* Data-in
Vdin din0_0 gnd 0

* Address: 00000000
Vaddr0 addr0_0 gnd 0
Vaddr1 addr0_1 gnd 0
Vaddr2 addr0_2 gnd 0
Vaddr3 addr0_3 gnd 0
Vaddr4 addr0_4 gnd 0
Vaddr5 addr0_5 gnd 0
Vaddr6 addr0_6 gnd 0
Vaddr7 addr0_7 gnd 0

* Power signals
VDD vdd gnd 'V_DD'
VWRITE vwrite gnd 'V_WRITE'
VHOLD vhold gnd 'V_HOLD'
VREAD vread gnd 'V_READ'
VREF vref gnd 'V_REF'

* Control signals: write mode; chip is selected
VCSB csb0 gnd 0
VREB reb0 gnd PWL(0 'V_DD' 16n 'V_DD' 17n 0 35n 0 36n 'V_DD' 60n 'V_DD')
VWEB web0 gnd 0 PWL(0 0 16n 0 17n 'V_DD' 60n 'V_DD')

VCLK clk0 gnd PULSE 0 'V_DD' 10ps 10ps 10ps 15ns 30ns
*VCLK clk0 gnd PWL(0 0 10ps 'V_DD' 49990ps 'V_DD' 50000ps 0 99990ps 0 100000ps 'V_DD' 1000ns 'V_DD')
* Output
Rout dout0_0 gnd 1G

* Transient simulation
.tran 10p 60n
.end
