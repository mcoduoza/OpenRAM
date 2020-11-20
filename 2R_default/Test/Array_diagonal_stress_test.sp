* Array Test
.inc ../Array/2R_default_16_16_1bit.sp
.param V_DD=1.5
.param V_WRITE=1.5
.param V_HOLD=0.75
.param V_READ=0.2
.param V_REF=0.1
.param ZERO=0.0
.option post=2

* DUT
Xdefault_2R_16_16_1bit din0_0 addr0_0 addr0_1 addr0_2 addr0_3 addr0_4 addr0_5 addr0_6 addr0_7 csb0 web0 reb0 clk0 dout0_0 vdd gnd vwrite vread vhold vref default_2R_16_16_1bit

* Data-in (0, 1, 0, 1, 0)
Vdin din0_0 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'V_DD' 150n 'V_DD' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'V_DD' 350n 'V_DD' 350.1n 'ZERO' 400n 'ZERO')

* Address (r0,c0): 00000000
* Address (r1,c1): 00010001
* Address (r2,c2): 00100010
* Address (r3,c3): 00110011
* Address (r4,c4): 01000100

Vaddr0 addr0_0 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'V_DD' 150n 'V_DD' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'V_DD' 350n 'V_DD' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'V_DD' 650n 'V_DD' 650.1n 'ZERO' 750n 'ZERO' 750.1n 'V_DD' 850n 'V_DD' 850.1n 'ZERO') 
Vaddr1 addr0_1 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'V_DD' 250n 'V_DD' 250.1n 'V_DD' 350n 'V_DD' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'V_DD' 750n 'V_DD' 750.1n 'V_DD' 850n 'V_DD' 850.1n 'ZERO')
Vaddr2 addr0_2 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'ZERO' 350n 'ZERO' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'V_DD' 550n 'V_DD' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'ZERO' 750n 'ZERO' 750.1n 'V_DD' 850n 'V_DD' 850.1n 'V_DD') 
Vaddr3 addr0_3 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'ZERO' 350n 'ZERO' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'ZERO' 750n 'ZERO' 750.1n 'ZERO' 850n 'V_DD' 850.1n 'ZERO')
Vaddr4 addr0_4 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'V_DD' 150n 'V_DD' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'V_DD' 350n 'V_DD' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'V_DD' 650n 'V_DD' 650.1n 'ZERO' 750n 'ZERO' 750.1n 'V_DD' 850n 'V_DD' 850.1n 'ZERO') 
Vaddr5 addr0_5 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'V_DD' 250n 'V_DD' 250.1n 'V_DD' 350n 'V_DD' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'V_DD' 750n 'V_DD' 750.1n 'V_DD' 850n 'V_DD' 850.1n 'ZERO')
Vaddr6 addr0_6 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'ZERO' 350n 'ZERO' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'V_DD' 550n 'V_DD' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'ZERO' 750n 'ZERO' 750.1n 'V_DD' 850n 'V_DD' 850.1n 'V_DD') 
Vaddr7 addr0_7 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'ZERO' 350n 'ZERO' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'ZERO' 750n 'ZERO' 750.1n 'ZERO' 850n 'V_DD' 850.1n 'ZERO')


*Vaddr4 addr0_4 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'V_DD' 150n 'V_DD' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'V_DD' 350n 'V_DD' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'V_DD' 550n 'V_DD' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'V_DD' 750n 'V_DD' 750.1n 'ZERO') 
*Vaddr5 addr0_5 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'V_DD' 250n 'V_DD' 250.1n 'V_DD' 350n 'V_DD' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'V_DD' 650n 'V_DD' 650.1n 'V_DD' 750n 'V_DD' 750.1n 'ZERO')
*Vaddr6 addr0_6 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'ZERO' 350n 'ZERO' 350.1n 'V_DD' 450n 'V_DD' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'ZERO' 750n 'ZERO' 750.1n 'V_DD') 
*Vaddr7 addr0_7 gnd PWL(0 'ZERO' 50n 'ZERO' 50.1n 'ZERO' 150n 'ZERO' 150.1n 'ZERO' 250n 'ZERO' 250.1n 'ZERO' 350n 'ZERO' 350.1n 'ZERO' 450n 'ZERO' 450.1n 'ZERO' 550n 'ZERO' 550.1n 'ZERO' 650n 'ZERO' 650.1n 'ZERO' 750n 'ZERO' 750.1n 'ZERO') 

* Power signals
VDD vdd gnd 'V_DD'
VWRITE vwrite gnd 'V_WRITE'
VHOLD vhold gnd 'V_HOLD'
VREAD vread gnd 'V_READ'
VREF vref gnd 'V_REF'

* Control signals: write mode; chip is selected
VCSB csb0 gnd 0
*VREB reb0 gnd PWL(0 'V_DD' 50n 'V_DD' 50.1n 0 60n 0 60.1n 'V_DD' 110n 'V_DD' 110.1n 0 350n 0 350.1n 'V_DD' 400n 'V_DD')
VREB reb0 gnd PWL(0 'V_DD' 450n 'V_DD' 450.1n 'ZERO' 500n 'ZERO')
*VWEB web0 gnd 0 PWL(0 0 50n 0 50.1n 'V_DD' 60n 'V_DD' 60.1n 0 110n 0 110.1n 'V_DD' 400n 'V_DD')
VWEB web0 gnd PWL(0 'ZERO' 450n 'ZERO' 450.1n 'V_DD' 500n 'V_DD')

VCLK clk0 gnd PULSE 0 'V_DD' 10ps 10ps 10ps 50ns 100ns
*VCLK clk0 gnd PWL(0 0 10ps 'V_DD' 49990ps 'V_DD' 50000ps 0 99990ps 0 100000ps 'V_DD' 1000ns 'V_DD')
* Output
Rout dout0_0 gnd 1G

* Transient simulation
.tran 10p 1000n
.end
