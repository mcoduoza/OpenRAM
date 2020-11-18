* Include RRAM 
.hdl rram.va

.SUBCKT cell_1R top bot  

* RRAM cell and initial condition 
XR_T top bot gap_t RRAM I0=1e-4 Vel0=100
.ic V(gap_t)=0.3
.ENDS cell_1R

