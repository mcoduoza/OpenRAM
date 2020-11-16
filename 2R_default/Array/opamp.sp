*Spice model for an op-amp
*TODO Need to update widths so they are minimum size (90 n)
.inc ../PMOS_VTG.inc
.inc ../NMOS_VTG.inc

.SUBCKT opamp VP VN VOUT VDD VSS
* INPUT : VP 
* INPUT : VN 
* OUTPUT: VOUT 
* POWER : VDD 
* GROUND: VSS 
M1 1 VN 2 VDD PMOS_VTG m=1 w=0.05u l=0.05u
M2 3 VP 2 VDD PMOS_VTG m=1 w=0.05u l=0.05u
M3 1 1 VSS VSS NMOS_VTG m=1 w=0.1u l=0.05u
M4 3 1 VSS VSS NMOS_VTG m=1 w=0.1u l=0.05u
M5 VOUT 3 VSS VSS NMOS_VTG m=1 w=0.05u l=0.05u
M6 VOUT 4 VDD VDD PMOS_VTG m=1 w=0.05u l=0.05u
M7 2 4 VDD VDD PMOS_VTG m=1 w=0.05u l=0.05u
M8 4 4 VDD VDD PMOS_VTG m=1 w=0.05u l=0.05u
M9 4 VDD VSS VSS NMOS_VTG m=1 w=0.05u l=0.05u
.ENDS opamp
