* MLC Array Test
.inc ../Array/2R_MLC_16_16_1bit.sp
.param V_DD=1.5
.param V_WRITE=1.5
.param V_HOLD=0.75
.param V_READ=0.5
.param V_MRS=0.5
.param V_REF1=0.083
.param V_REF2=0.25
.param V_REF3=0.42
.option post=2

* DUT
XMLC_2R_16_16_1bit din0_1 din0_0 addr0_0 addr0_1 addr0_2 addr0_3 addr0_4 addr0_5 addr0_6 addr0_7 csb0 web0 reb0 clk0 dout0_1 dout0_0 vdd gnd vwrite vread vhold vref1 vref2 vref3 vmrs MLC_2R_16_16_1bit

* Data-in: 2'b01
Vdin0 din0_0 gnd 'V_DD'
Vdin1 din0_1 gnd 0

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
VREF1 vref1 gnd 'V_REF1'
VREF2 vref2 gnd 'V_REF2'
VREF3 vref3 gnd 'V_REF3'
VMRS vmrs gnd 'V_MRS'

* Control signals: write mode; chip is selected
VCSB csb0 gnd 0
VREB reb0 gnd 'V_DD'
VWEB web0 gnd 0 PWL(0 0 70n 0 70.1n 'V_DD' 200n 'V_DD')

* Clock
VCLK clk0 gnd PULSE 0 'V_DD' 10ps 10ps 10ps 50ns 100ns

* Outputs
Rout0 dout0_0 gnd 1G
Rout0 dout0_1 gnd 1G

* Transient simulation
.tran 10p 200n
.end
