* 2R test
.inc ../building_blocks/2R.sp
.inc ../PMOS_VTG.inc
.inc ../NMOS_VTG.inc
.param V_WRITE=1.5
.param V_READ=0.2
.param V_GATE1=1.5
.param V_GATE2=1.5
.param V_GATE3=0


*Vwrite voltage source (from off-chip)
Vwrite vwr gnd 'V_WRITE'

*Vwrite voltage source (from off-chip)
Vread vread gnd 'V_READ'

*Top driving transistor
*MT1 wl_t vgate1 vwr vwr PMOS_VTG W=1800n L=50n

*Bottom driving transistor
*MT2 wl_b vgate2 vwr vwr PMOS_VTG W=1800n L=50n


*Top driving transistor
MT1 wl_t vgate1 vread gnd NMOS_VTG W=1800n L=50n

*Bottom driving transistor
MT2 wl_b vgate2 gnd gnd NMOS_VTG W=1800n L=50n

*BL driving transistor
*MT3 bl vgate3 vwr vwr PMOS_VTG W=1800n L=50n

*Cell under test
X2R_cell bl wl_t wl_b cell_2r 

*Control signals
Vgate1 vgate1 gnd 'V_GATE1'
Vgate2 vgate2 gnd 'V_GATE2'
*Vgate3 vgate3 gnd 'V_GATE3'

* Bitline out
Rout bl gnd 1G

.tran 10p 10n
.option post=2 runlvl=5 accurate method=gear vntol=1n
.end
