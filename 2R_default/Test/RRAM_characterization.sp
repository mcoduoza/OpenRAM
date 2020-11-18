* Basic RRAM Characterization 
.inc ../building_blocks/1R.sp
.param V_WRITE=1.5
.param V_READ=0.5

*Vwrite voltage source (from off-chip)
Vwrite vwr gnd 'V_WRITE'

*Vwrite voltage source (from off-chip)
Vread vread gnd 'V_READ'

*Cell under test
XRRAM vread gnd cell_1R 

.tran 10p 10n
.option post=2 runlvl=5 accurate method=gear vntol=1n
.end
