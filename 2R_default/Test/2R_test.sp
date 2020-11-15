* Array test
.inc ../building_blocks/2R.sp
.param V_WRITE=1.0

X2R_cell wl_t wl_b bl 

Vwl_t wl_t gnd 'V_WRITE'
Vwl_b wl_b gnd 'V_WRITE'
V_bl bl gnd 0
*Vwl_en0 wl_en0 gnd PWL(0 0 20n 0 30n 1.8 130n 1.8 140n 1.8 240n 1.8 250n 1.8 350n 1.8 360n 1.8 460n 1.8 470n 0)

.tran 10p 500n
.option post=2 runlvl=5 accurate method=gear vntol=1n
.end