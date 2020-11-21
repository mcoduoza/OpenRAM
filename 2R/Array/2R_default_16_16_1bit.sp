**************************************************
* 2R Architecture
* Words: 256
* Data bits: 1
* Banks: 1
* Column mux: 16:1
**************************************************
.inc opamp.sp
.inc ../building_blocks/2R.sp
.hdl ../building_blocks/comparator.va

.subckt dff D Q clk vdd gnd
*
MM21 Q a_66_6# gnd gnd NMOS_VTG L=5e-08 W=5e-07
MM19 a_76_6# a_2_6# a_66_6# gnd NMOS_VTG L=5e-08 W=2.5e-07
MM20 gnd Q a_76_6# gnd NMOS_VTG L=5e-08 W=2.5e-07
MM18 a_66_6# clk a_61_6# gnd NMOS_VTG L=5e-08 W=2.5e-07
MM17 a_61_6# a_34_4# gnd gnd NMOS_VTG L=5e-08 W=2.5e-07
MM10 gnd clk a_2_6# gnd NMOS_VTG L=5e-08 W=5e-07
MM16 a_34_4# a_22_6# gnd gnd NMOS_VTG L=5e-08 W=2.5e-07
MM15 gnd a_34_4# a_31_6# gnd NMOS_VTG L=5e-08 W=2.5e-07
MM14 a_31_6# clk a_22_6# gnd NMOS_VTG L=5e-08 W=2.5e-07
MM13 a_22_6# a_2_6# a_17_6# gnd NMOS_VTG L=5e-08 W=2.5e-07
MM12 a_17_6# D gnd gnd NMOS_VTG L=5e-08 W=2.5e-07
MM11 Q a_66_6# vdd vdd PMOS_VTG L=5e-08 W=1e-06
MM9 vdd Q a_76_84# vdd PMOS_VTG L=5e-08 W=2.5e-07
MM8 a_76_84# clk a_66_6# vdd PMOS_VTG L=5e-08 W=2.5e-07
MM7 a_66_6# a_2_6# a_61_74# vdd PMOS_VTG L=5e-08 W=5e-07
MM6 a_61_74# a_34_4# vdd vdd PMOS_VTG L=5e-08 W=5e-07
MM0 vdd clk a_2_6# vdd PMOS_VTG L=5e-08 W=1e-06
MM5 a_34_4# a_22_6# vdd vdd PMOS_VTG L=5e-08 W=5e-07
MM4 vdd a_34_4# a_31_74# vdd PMOS_VTG L=5e-08 W=5e-07
MM3 a_31_74# a_2_6# a_22_6# vdd PMOS_VTG L=5e-08 W=5e-07
MM2 a_22_6# clk a_17_74# vdd PMOS_VTG L=5e-08 W=5e-07
MM1 a_17_74# D vdd vdd PMOS_VTG L=5e-08 W=5e-07
* c_9 a_66_6# 0 0.271997f
* c_20 clk 0 0.350944f
* c_27 Q 0 0.202617f
* c_32 a_76_84# 0 0.0210573f
* c_38 a_76_6# 0 0.0204911f
* c_45 a_34_4# 0 0.172306f
* c_55 a_2_6# 0 0.283119f
* c_59 a_22_6# 0 0.157312f
* c_64 D 0 0.0816386f
* c_73 gnd 0 0.254131f
* c_81 vdd 0 0.23624f
*
*.include "dff.pex.netlist.dff.pxi"
*
.ends
*
*

.SUBCKT row_addr_dff din_0 din_1 din_2 din_3 dout_0 dout_1 dout_2 dout_3 clk vdd gnd
* INPUT : din_0 
* INPUT : din_1 
* INPUT : din_2 
* INPUT : din_3 
* OUTPUT: dout_0 
* OUTPUT: dout_1 
* OUTPUT: dout_2 
* OUTPUT: dout_3 
* INPUT : clk 
* POWER : vdd 
* GROUND: gnd 
* rows: 4 cols: 1
Xdff_r0_c0 din_0 dout_0 clk vdd gnd dff
Xdff_r1_c0 din_1 dout_1 clk vdd gnd dff
Xdff_r2_c0 din_2 dout_2 clk vdd gnd dff
Xdff_r3_c0 din_3 dout_3 clk vdd gnd dff
.ENDS row_addr_dff

.SUBCKT col_addr_dff din_0 din_1 din_2 din_3 dout_0 dout_1 dout_2 dout_3 clk vdd gnd
* INPUT : din_0 
* INPUT : din_1 
* INPUT : din_2 
* INPUT : din_3 
* OUTPUT: dout_0 
* OUTPUT: dout_1 
* OUTPUT: dout_2 
* OUTPUT: dout_3 
* INPUT : clk 
* POWER : vdd 
* GROUND: gnd 
* rows: 1 cols: 4
Xdff_r0_c0 din_0 dout_0 clk vdd gnd dff
Xdff_r0_c1 din_1 dout_1 clk vdd gnd dff
Xdff_r0_c2 din_2 dout_2 clk vdd gnd dff
Xdff_r0_c3 din_3 dout_3 clk vdd gnd dff
.ENDS col_addr_dff

.SUBCKT data_dff din_0 dout_0 clk vdd gnd
* INPUT : din_0 
* OUTPUT: dout_0 
* INPUT : clk 
* POWER : vdd 
* GROUND: gnd 
* rows: 1 cols: 1
Xdff_r0_c0 din_0 dout_0 clk vdd gnd dff
.ENDS data_dff

* spice ptx M{0} {1} nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p

* spice ptx M{0} {1} nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p

* spice ptx M{0} {1} pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p

.SUBCKT pnand2 A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand2_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand2_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand2_nmos1 Z B net1 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand2_nmos2 net1 A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pnand2

.SUBCKT pnand2_2 A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand2_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.45u l=0.05u 
Mpnand2_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.45u l=0.05u 
Mpnand2_nmos1 Z B net1 gnd nmos_vtg m=1 w=0.3u l=0.05u 
Mpnand2_nmos2 net1 A gnd gnd nmos_vtg m=1 w=0.3u l=0.05u 
.ENDS pnand2_2

.SUBCKT pnand2_3 A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand2_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.65u l=0.05u 
Mpnand2_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.65u l=0.05u 
Mpnand2_nmos1 Z B net1 gnd nmos_vtg m=1 w=0.44u l=0.05u 
Mpnand2_nmos2 net1 A gnd gnd nmos_vtg m=1 w=0.44u l=0.05u 
.ENDS pnand2_3

.SUBCKT pnand2_4 A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand2_pmos1 vdd A Z vdd pmos_vtg m=1 w=1.62u l=0.05u 
Mpnand2_pmos2 Z B vdd vdd pmos_vtg m=1 w=1.62u l=0.05u 
Mpnand2_nmos1 Z B net1 gnd nmos_vtg m=1 w=1.08u l=0.05u 
Mpnand2_nmos2 net1 A gnd gnd nmos_vtg m=1 w=1.08u l=0.05u 
.ENDS pnand2_4

.SUBCKT pnor2_2 A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnor2_pmos1 vdd A net1 vdd pmos_vtg m=1 w=2.16u l=0.05u 
Mpnor2_pmos2 net1 B Z vdd pmos_vtg m=1 w=2.16u l=0.05u 
Mpnor2_nmos1 Z A gnd gnd nmos_vtg m=1 w=0.36u l=0.05u 
Mpnor2_nmos2 Z B gnd gnd nmos_vtg m=1 w=0.36u l=0.05u 
.ENDS pnor2_2

* spice ptx M{0} {1} nmos_vtg m=1 w=0.09u l=0.05u pd=0.28u ps=0.28u as=0.01p ad=0.01p

* spice ptx M{0} {1} pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p

.SUBCKT pinv A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.09u l=0.05u pd=0.28u ps=0.28u as=0.01p ad=0.01p
.ENDS pinv

.SUBCKT and2_dec A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* size: 1
Xpand2_dec_nand A B zb_int vdd gnd pnand2
Xpand2_dec_inv zb_int Z vdd gnd pinv
.ENDS and2_dec

* spice ptx M{0} {1} nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p

.SUBCKT pnand3 A B C Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand3_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand3_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand3_pmos3 Z C vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand3_nmos1 Z C net1 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand3_nmos2 net1 B net2 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand3_nmos3 net2 A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pnand3

.SUBCKT and3_dec A B C Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* size: 1
Xpand3_dec_nand A B C zb_int vdd gnd pnand3
Xpand3_dec_inv zb_int Z vdd gnd pinv
.ENDS and3_dec

.SUBCKT hierarchical_predecode2x4 in_0 in_1 out_0 out_1 out_2 out_3 vdd gnd
* INPUT : in_0 
* INPUT : in_1 
* OUTPUT: out_0 
* OUTPUT: out_1 
* OUTPUT: out_2 
* OUTPUT: out_3 
* POWER : vdd 
* GROUND: gnd 
Xpre_inv_0 in_0 inbar_0 vdd gnd pinv
Xpre_inv_1 in_1 inbar_1 vdd gnd pinv
XXpre2x4_and_0 inbar_0 inbar_1 out_0 vdd gnd and2_dec
XXpre2x4_and_1 in_0 inbar_1 out_1 vdd gnd and2_dec
XXpre2x4_and_2 inbar_0 in_1 out_2 vdd gnd and2_dec
XXpre2x4_and_3 in_0 in_1 out_3 vdd gnd and2_dec
.ENDS hierarchical_predecode2x4

.SUBCKT hierarchical_predecode3x8 in_0 in_1 in_2 out_0 out_1 out_2 out_3 out_4 out_5 out_6 out_7 vdd gnd
* INPUT : in_0 
* INPUT : in_1 
* INPUT : in_2 
* OUTPUT: out_0 
* OUTPUT: out_1 
* OUTPUT: out_2 
* OUTPUT: out_3 
* OUTPUT: out_4 
* OUTPUT: out_5 
* OUTPUT: out_6 
* OUTPUT: out_7 
* POWER : vdd 
* GROUND: gnd 
Xpre_inv_0 in_0 inbar_0 vdd gnd pinv
Xpre_inv_1 in_1 inbar_1 vdd gnd pinv
Xpre_inv_2 in_2 inbar_2 vdd gnd pinv
XXpre3x8_and_0 inbar_0 inbar_1 inbar_2 out_0 vdd gnd and3_dec
XXpre3x8_and_1 in_0 inbar_1 inbar_2 out_1 vdd gnd and3_dec
XXpre3x8_and_2 inbar_0 in_1 inbar_2 out_2 vdd gnd and3_dec
XXpre3x8_and_3 in_0 in_1 inbar_2 out_3 vdd gnd and3_dec
XXpre3x8_and_4 inbar_0 inbar_1 in_2 out_4 vdd gnd and3_dec
XXpre3x8_and_5 in_0 inbar_1 in_2 out_5 vdd gnd and3_dec
XXpre3x8_and_6 inbar_0 in_1 in_2 out_6 vdd gnd and3_dec
XXpre3x8_and_7 in_0 in_1 in_2 out_7 vdd gnd and3_dec
.ENDS hierarchical_predecode3x8

.SUBCKT pnand4 A B C D Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* INPUT : D 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand4_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand4_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand4_pmos3 Z C vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand4_pmos4 Z D vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand4_nmos1 Z D net1 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand4_nmos2 net1 C net2 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand4_nmos3 net2 B net3 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand4_nmos4 net3 A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pnand4

.SUBCKT and4_dec A B C D Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* INPUT : D 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* size: 1
Xpand4_dec_nand A B C D zb_int vdd gnd pnand4
Xpand4_dec_inv zb_int Z vdd gnd pinv
.ENDS and4_dec

.SUBCKT hierarchical_predecode4x16 in_0 in_1 in_2 in_3 out_0 out_1 out_2 out_3 out_4 out_5 out_6 out_7 out_8 out_9 out_10 out_11 out_12 out_13 out_14 out_15 vdd gnd
* INPUT : in_0 
* INPUT : in_1 
* INPUT : in_2 
* INPUT : in_3 
* OUTPUT: out_0 
* OUTPUT: out_1 
* OUTPUT: out_2 
* OUTPUT: out_3 
* OUTPUT: out_4 
* OUTPUT: out_5 
* OUTPUT: out_6 
* OUTPUT: out_7 
* OUTPUT: out_8 
* OUTPUT: out_9 
* OUTPUT: out_10 
* OUTPUT: out_11 
* OUTPUT: out_12 
* OUTPUT: out_13 
* OUTPUT: out_14 
* OUTPUT: out_15 
* POWER : vdd 
* GROUND: gnd 
Xpre_inv_0 in_0 inbar_0 vdd gnd pinv
Xpre_inv_1 in_1 inbar_1 vdd gnd pinv
Xpre_inv_2 in_2 inbar_2 vdd gnd pinv
Xpre_inv_3 in_3 inbar_3 vdd gnd pinv
XXpre4x16_and_0 inbar_0 inbar_1 inbar_2 inbar_3 out_0 vdd gnd and4_dec
XXpre4x16_and_1 in_0 inbar_1 inbar_2 inbar_3 out_1 vdd gnd and4_dec
XXpre4x16_and_2 inbar_0 in_1 inbar_2 inbar_3 out_2 vdd gnd and4_dec
XXpre4x16_and_3 in_0 in_1 inbar_2 inbar_3 out_3 vdd gnd and4_dec
XXpre4x16_and_4 inbar_0 inbar_1 in_2 inbar_3 out_4 vdd gnd and4_dec
XXpre4x16_and_5 in_0 inbar_1 in_2 inbar_3 out_5 vdd gnd and4_dec
XXpre4x16_and_6 inbar_0 in_1 in_2 inbar_3 out_6 vdd gnd and4_dec
XXpre4x16_and_7 in_0 in_1 in_2 inbar_3 out_7 vdd gnd and4_dec
XXpre4x16_and_8 inbar_0 inbar_1 inbar_2 in_3 out_8 vdd gnd and4_dec
XXpre4x16_and_9 in_0 inbar_1 inbar_2 in_3 out_9 vdd gnd and4_dec
XXpre4x16_and_10 inbar_0 in_1 inbar_2 in_3 out_10 vdd gnd and4_dec
XXpre4x16_and_11 in_0 in_1 inbar_2 in_3 out_11 vdd gnd and4_dec
XXpre4x16_and_12 inbar_0 inbar_1 in_2 in_3 out_12 vdd gnd and4_dec
XXpre4x16_and_13 in_0 inbar_1 in_2 in_3 out_13 vdd gnd and4_dec
XXpre4x16_and_14 inbar_0 in_1 in_2 in_3 out_14 vdd gnd and4_dec
XXpre4x16_and_15 in_0 in_1 in_2 in_3 out_15 vdd gnd and4_dec
.ENDS hierarchical_predecode4x16

.SUBCKT hierarchical_decoder addr_0 addr_1 addr_2 addr_3 decode_0 decode_1 decode_2 decode_3 decode_4 decode_5 decode_6 decode_7 decode_8 decode_9 decode_10 decode_11 decode_12 decode_13 decode_14 decode_15 vdd gnd
* INPUT : addr_0 
* INPUT : addr_1 
* INPUT : addr_2 
* INPUT : addr_3 
* OUTPUT: decode_0 
* OUTPUT: decode_1 
* OUTPUT: decode_2 
* OUTPUT: decode_3 
* OUTPUT: decode_4 
* OUTPUT: decode_5 
* OUTPUT: decode_6 
* OUTPUT: decode_7 
* OUTPUT: decode_8 
* OUTPUT: decode_9 
* OUTPUT: decode_10 
* OUTPUT: decode_11 
* OUTPUT: decode_12 
* OUTPUT: decode_13 
* OUTPUT: decode_14 
* OUTPUT: decode_15 
* POWER : vdd 
* GROUND: gnd 
Xpre_0 addr_0 addr_1 out_0 out_1 out_2 out_3 vdd gnd hierarchical_predecode2x4
Xpre_1 addr_2 addr_3 out_4 out_5 out_6 out_7 vdd gnd hierarchical_predecode2x4
XDEC_AND_0 out_0 out_4 decode_0 vdd gnd and2_dec
XDEC_AND_4 out_0 out_5 decode_4 vdd gnd and2_dec
XDEC_AND_8 out_0 out_6 decode_8 vdd gnd and2_dec
XDEC_AND_12 out_0 out_7 decode_12 vdd gnd and2_dec
XDEC_AND_1 out_1 out_4 decode_1 vdd gnd and2_dec
XDEC_AND_5 out_1 out_5 decode_5 vdd gnd and2_dec
XDEC_AND_9 out_1 out_6 decode_9 vdd gnd and2_dec
XDEC_AND_13 out_1 out_7 decode_13 vdd gnd and2_dec
XDEC_AND_2 out_2 out_4 decode_2 vdd gnd and2_dec
XDEC_AND_6 out_2 out_5 decode_6 vdd gnd and2_dec
XDEC_AND_10 out_2 out_6 decode_10 vdd gnd and2_dec
XDEC_AND_14 out_2 out_7 decode_14 vdd gnd and2_dec
XDEC_AND_3 out_3 out_4 decode_3 vdd gnd and2_dec
XDEC_AND_7 out_3 out_5 decode_7 vdd gnd and2_dec
XDEC_AND_11 out_3 out_6 decode_11 vdd gnd and2_dec
XDEC_AND_15 out_3 out_7 decode_15 vdd gnd and2_dec
.ENDS hierarchical_decoder

* spice ptx M{0} {1} nmos_vtg m=1 w=0.36u l=0.05u pd=0.82u ps=0.82u as=0.04p ad=0.04p

* spice ptx M{0} {1} pmos_vtg m=1 w=1.08u l=0.05u pd=2.26u ps=2.26u as=0.14p ad=0.14p

.SUBCKT pinv_0 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=1.08u l=0.05u pd=2.26u ps=2.26u as=0.14p ad=0.14p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.36u l=0.05u pd=0.82u ps=0.82u as=0.04p ad=0.04p
.ENDS pinv_0

.SUBCKT wordline_active_indicator A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Xwld_nand A B zb_int vdd gnd pnand2
Xwl_driver zb_int Z vdd gnd pinv_4
.ENDS wordline_active_indicator

.SUBCKT wordline_active_indicator_array in_0 in_1 in_2 in_3 in_4 in_5 in_6 in_7 in_8 in_9 in_10 in_11 in_12 in_13 in_14 in_15 wl_active0 wl_active1 wl_active2 wl_active3 wl_active4 wl_active5 wl_active6 wl_active7 wl_active8 wl_active9 wl_active10 wl_active11 wl_active12 wl_active13 wl_active14 wl_active15 en vdd gnd
* INPUT : in_0 
* INPUT : in_1 
* INPUT : in_2 
* INPUT : in_3 
* INPUT : in_4 
* INPUT : in_5 
* INPUT : in_6 
* INPUT : in_7 
* INPUT : in_8 
* INPUT : in_9 
* INPUT : in_10 
* INPUT : in_11 
* INPUT : in_12 
* INPUT : in_13 
* INPUT : in_14 
* INPUT : in_15 
* OUTPUT: wl_active0 
* OUTPUT: wl_active1 
* OUTPUT: wl_active2 
* OUTPUT: wl_active3 
* OUTPUT: wl_active4 
* OUTPUT: wl_active5 
* OUTPUT: wl_active6 
* OUTPUT: wl_active7 
* OUTPUT: wl_active8 
* OUTPUT: wl_active9 
* OUTPUT: wl_active10 
* OUTPUT: wl_active11 
* OUTPUT: wl_active12 
* OUTPUT: wl_active13 
* OUTPUT: wl_active14 
* OUTPUT: wl_active15 
* INPUT : en 
* POWER : vdd 
* GROUND: gnd 
* rows: 16 cols: 16
Xwl_activedriver_and0 in_0 en wl_active0 vdd gnd wordline_active_indicator
Xwl_activedriver_and1 in_1 en wl_active1 vdd gnd wordline_active_indicator
Xwl_activedriver_and2 in_2 en wl_active2 vdd gnd wordline_active_indicator
Xwl_activedriver_and3 in_3 en wl_active3 vdd gnd wordline_active_indicator
Xwl_activedriver_and4 in_4 en wl_active4 vdd gnd wordline_active_indicator
Xwl_activedriver_and5 in_5 en wl_active5 vdd gnd wordline_active_indicator
Xwl_activedriver_and6 in_6 en wl_active6 vdd gnd wordline_active_indicator
Xwl_activedriver_and7 in_7 en wl_active7 vdd gnd wordline_active_indicator
Xwl_activedriver_and8 in_8 en wl_active8 vdd gnd wordline_active_indicator
Xwl_activedriver_and9 in_9 en wl_active9 vdd gnd wordline_active_indicator
Xwl_activedriver_and10 in_10 en wl_active10 vdd gnd wordline_active_indicator
Xwl_activedriver_and11 in_11 en wl_active11 vdd gnd wordline_active_indicator
Xwl_activedriver_and12 in_12 en wl_active12 vdd gnd wordline_active_indicator
Xwl_activedriver_and13 in_13 en wl_active13 vdd gnd wordline_active_indicator
Xwl_activedriver_and14 in_14 en wl_active14 vdd gnd wordline_active_indicator
Xwl_activedriver_and15 in_15 en wl_active15 vdd gnd wordline_active_indicator
.ENDS wordline_active_indicator_array

.SUBCKT pinv_1 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=1.08u l=0.05u pd=2.26u ps=2.26u as=0.14p ad=0.14p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.36u l=0.05u pd=0.82u ps=0.82u as=0.04p ad=0.04p
.ENDS pinv_1

.SUBCKT pbuf A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Xbuf_inv1 A zb_int vdd gnd pinv
Xbuf_inv2 zb_int Z vdd gnd pinv_1
.ENDS pbuf

.SUBCKT wordline_driver write_1_int write_0_int wl_active w_en r_en nop wlt wlb vdd gnd vwrite vread vhold 
* INPUT : write_1_int
* INPUT : write_0_int
* INPUT : wl_active
* INPUT : r_en
* INPUT : w_en
* INPUT : nop
* OUTPUT : wlt
* OUTPUT : wlb
* POWER : vdd 
* GROUND : gnd
* POWER : vwrite 
* POWER : vread
* POWER : vhold
Xinv_a wl_active wl_active_bar vdd gnd pinv
Xinv_b nop nop_bar vdd gnd pinv

Xnand2_a write_1_int wl_active drive_vwrite_bar vdd gnd pnand2_3
Xnand2_b w_en wl_active_bar vhold_gate_in vdd gnd pnand2
Xnand2_c nop_bar vhold_gate_in drive_vhold vdd gnd pnand2_2
Xinv_c drive_vhold drive_vhold_bar vdd gnd pinv_10
Xnand2_d r_en wl_active drive_top_vread_bar vdd gnd pnand2
Xinv_d drive_top_vread_bar drive_top_vread vdd gnd pinv
Xnand2_e write_0_int wl_active drive_top_0_bar vdd gnd pnand2
Xinv_e drive_top_0_bar drive_top_0 vdd gnd pinv
Xnand2_f drive_top_vread_bar drive_top_0_bar drive_bot_0 vdd gnd pnand2

mp_vwrite_top wlt drive_vwrite_bar vwrite vdd pmos_vtg w=4.0u l=0.05u
mp_vhold_top wlt drive_vhold_bar vhold vdd pmos_vtg w=4.0u l=0.05u
mn_vhold_top wlt drive_vhold vhold gnd nmos_vtg w=1.8u l=0.05u
mp_vread_top wlt drive_top_vread_bar vread vdd pmos_vtg w=4.0u l=0.05u
mn_vread_top wlt drive_top_vread vread gnd nmos_vtg w=1.8u l=0.05u
mn_v0_top wlt drive_top_0 gnd gnd nmos_vtg w=1.8u l=0.05u

mp_vwrite_bot wlb drive_vwrite_bar vwrite vdd pmos_vtg w=4.0u l=0.05u
mp_vhold_bot wlb drive_vhold_bar vhold vdd pmos_vtg w=4.0u l=0.05u
mn_vhold_bot wlb drive_vhold vhold gnd nmos_vtg w=1.8u l=0.05u
mn_v0_bot wlb drive_bot_0 gnd gnd nmos_vtg w=1.8u l=0.05u 
.ENDS wordline_driver

.SUBCKT wordline_driver_array write_1_int write_0_int w_en r_en nop wl_active0 wl_active1 wl_active2 wl_active3 wl_active4 wl_active5 wl_active6 wl_active7 wl_active8 wl_active9 wl_active10 wl_active11 wl_active12 wl_active13 wl_active14 wl_active15 wlt_0 wlt_1 wlt_2 wlt_3 wlt_4 wlt_5 wlt_6 wlt_7 wlt_8 wlt_9 wlt_10 wlt_11 wlt_12 wlt_13 wlt_14 wlt_15 wlb_0 wlb_1 wlb_2 wlb_3 wlb_4 wlb_5 wlb_6 wlb_7 wlb_8 wlb_9 wlb_10 wlb_11 wlb_12 wlb_13 wlb_14 wlb_15 vdd gnd vwrite vread vhold
* INPUT : write_1_int
* INPUT : write_0_int 
* INPUT : r_en
* INPUT : w_en
* INPUT : nop
* INPUT: wl_active0 
* INPUT: wl_active1 
* INPUT: wl_active2 
* INPUT: wl_active3 
* INPUT: wl_active4 
* INPUT: wl_active5 
* INPUT: wl_active6 
* INPUT: wl_active7 
* INPUT: wl_active8 
* INPUT: wl_active9 
* INPUT: wl_active10 
* INPUT: wl_active11 
* INPUT: wl_active12 
* INPUT: wl_active13 
* INPUT: wl_active14 
* INPUT: wl_active15 
* OUTPUT: wlt_0 
* OUTPUT: wlt_1 
* OUTPUT: wlt_2 
* OUTPUT: wlt_3 
* OUTPUT: wlt_4 
* OUTPUT: wlt_5 
* OUTPUT: wlt_6 
* OUTPUT: wlt_7 
* OUTPUT: wlt_8 
* OUTPUT: wlt_9 
* OUTPUT: wlt_10 
* OUTPUT: wlt_11 
* OUTPUT: wlt_12 
* OUTPUT: wlt_13 
* OUTPUT: wlt_14 
* OUTPUT: wlt_15 
* OUTPUT: wlb_0 
* OUTPUT: wlb_1 
* OUTPUT: wlb_2 
* OUTPUT: wlb_3 
* OUTPUT: wlb_4 
* OUTPUT: wlb_5 
* OUTPUT: wlb_6 
* OUTPUT: wlb_7 
* OUTPUT: wlb_8 
* OUTPUT: wlb_9 
* OUTPUT: wlb_10 
* OUTPUT: wlb_11 
* OUTPUT: wlb_12 
* OUTPUT: wlb_13 
* OUTPUT: wlb_14 
* OUTPUT: wlb_15 
* POWER : vdd 
* GROUND: gnd 
* POWER : vwrite 
* POWER : vread 
* POWER : vhold
Xwordline_driver0 write_1_int write_0_int wl_active0 w_en r_en nop wlt_0 wlb_0 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver1 write_1_int write_0_int wl_active1 w_en r_en nop wlt_1 wlb_1 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver2 write_1_int write_0_int wl_active2 w_en r_en nop wlt_2 wlb_2 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver3 write_1_int write_0_int wl_active3 w_en r_en nop wlt_3 wlb_3 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver4 write_1_int write_0_int wl_active4 w_en r_en nop wlt_4 wlb_4 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver5 write_1_int write_0_int wl_active5 w_en r_en nop wlt_5 wlb_5 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver6 write_1_int write_0_int wl_active6 w_en r_en nop wlt_6 wlb_6 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver7 write_1_int write_0_int wl_active7 w_en r_en nop wlt_7 wlb_7 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver8 write_1_int write_0_int wl_active8 w_en r_en nop wlt_8 wlb_8 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver9 write_1_int write_0_int wl_active9 w_en r_en nop wlt_9 wlb_9 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver10 write_1_int write_0_int wl_active10 w_en r_en nop wlt_10 wlb_10 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver11 write_1_int write_0_int wl_active11 w_en r_en nop wlt_11 wlb_11 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver12 write_1_int write_0_int wl_active12 w_en r_en nop wlt_12 wlb_12 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver13 write_1_int write_0_int wl_active13 w_en r_en nop wlt_13 wlb_13 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver14 write_1_int write_0_int wl_active14 w_en r_en nop wlt_14 wlb_14 vdd gnd vwrite vread vhold wordline_driver
Xwordline_driver15 write_1_int write_0_int wl_active15 w_en r_en nop wlt_15 wlb_15 vdd gnd vwrite vread vhold wordline_driver
.ENDS wordline_driver_array

.SUBCKT port_address addr_0 addr_1 addr_2 addr_3 wl_en write_1_int write_0_int w_en r_en nop wlt_0 wlt_1 wlt_2 wlt_3 wlt_4 wlt_5 wlt_6 wlt_7 wlt_8 wlt_9 wlt_10 wlt_11 wlt_12 wlt_13 wlt_14 wlt_15 wlb_0 wlb_1 wlb_2 wlb_3 wlb_4 wlb_5 wlb_6 wlb_7 wlb_8 wlb_9 wlb_10 wlb_11 wlb_12 wlb_13 wlb_14 wlb_15 vdd gnd vwrite vread vhold
* INPUT : addr_0 
* INPUT : addr_1 
* INPUT : addr_2 
* INPUT : addr_3 
* INPUT : wl_en
* INPUT : write_1_int
* INPUT : write_0_int 
* INPUT : w_en
* INPUT : r_en
* INPUT : nop
* OUTPUT: wlt_0 
* OUTPUT: wlt_1 
* OUTPUT: wlt_2 
* OUTPUT: wlt_3 
* OUTPUT: wlt_4 
* OUTPUT: wlt_5 
* OUTPUT: wlt_6 
* OUTPUT: wlt_7 
* OUTPUT: wlt_8 
* OUTPUT: wlt_9 
* OUTPUT: wlt_10 
* OUTPUT: wlt_11 
* OUTPUT: wlt_12 
* OUTPUT: wlt_13 
* OUTPUT: wlt_14 
* OUTPUT: wlt_15 
* OUTPUT: wlb_0 
* OUTPUT: wlb_1 
* OUTPUT: wlb_2 
* OUTPUT: wlb_3 
* OUTPUT: wlb_4 
* OUTPUT: wlb_5 
* OUTPUT: wlb_6 
* OUTPUT: wlb_7 
* OUTPUT: wlb_8 
* OUTPUT: wlb_9 
* OUTPUT: wlb_10 
* OUTPUT: wlb_11 
* OUTPUT: wlb_12 
* OUTPUT: wlb_13 
* OUTPUT: wlb_14 
* OUTPUT: wlb_15 
* POWER : vdd 
* GROUND: gnd 
* POWER : vwrite 
* POWER : vread 
* POWER : vhold
Xrow_decoder addr_0 addr_1 addr_2 addr_3 dec_out_0 dec_out_1 dec_out_2 dec_out_3 dec_out_4 dec_out_5 dec_out_6 dec_out_7 dec_out_8 dec_out_9 dec_out_10 dec_out_11 dec_out_12 dec_out_13 dec_out_14 dec_out_15 vdd gnd hierarchical_decoder
Xwordline_active_indicator_array dec_out_0 dec_out_1 dec_out_2 dec_out_3 dec_out_4 dec_out_5 dec_out_6 dec_out_7 dec_out_8 dec_out_9 dec_out_10 dec_out_11 dec_out_12 dec_out_13 dec_out_14 dec_out_15 wl_active0 wl_active1 wl_active2 wl_active3 wl_active4 wl_active5 wl_active6 wl_active7 wl_active8 wl_active9 wl_active10 wl_active11 wl_active12 wl_active13 wl_active14 wl_active15 wl_en vdd gnd wordline_active_indicator_array
Xwordline_driver_array write_1_int write_0_int w_en r_en nop wl_active0 wl_active1 wl_active2 wl_active3 wl_active4 wl_active5 wl_active6 wl_active7 wl_active8 wl_active9 wl_active10 wl_active11 wl_active12 wl_active13 wl_active14 wl_active15 wlt_0 wlt_1 wlt_2 wlt_3 wlt_4 wlt_5 wlt_6 wlt_7 wlt_8 wlt_9 wlt_10 wlt_11 wlt_12 wlt_13 wlt_14 wlt_15 wlb_0 wlb_1 wlb_2 wlb_3 wlb_4 wlb_5 wlb_6 wlb_7 wlb_8 wlb_9 wlb_10 wlb_11 wlb_12 wlb_13 wlb_14 wlb_15 vdd gnd vwrite vread vhold wordline_driver_array
.ENDS port_address

.SUBCKT bitcell_array bl_0_0 bl_0_1 bl_0_2 bl_0_3 bl_0_4 bl_0_5 bl_0_6 bl_0_7 bl_0_8 bl_0_9 bl_0_10 bl_0_11 bl_0_12 bl_0_13 bl_0_14 bl_0_15 wlt_0_0 wlt_0_1 wlt_0_2 wlt_0_3 wlt_0_4 wlt_0_5 wlt_0_6 wlt_0_7 wlt_0_8 wlt_0_9 wlt_0_10 wlt_0_11 wlt_0_12 wlt_0_13 wlt_0_14 wlt_0_15 wlb_0_0 wlb_0_1 wlb_0_2 wlb_0_3 wlb_0_4 wlb_0_5 wlb_0_6 wlb_0_7 wlb_0_8 wlb_0_9 wlb_0_10 wlb_0_11 wlb_0_12 wlb_0_13 wlb_0_14 wlb_0_15
* INOUT : bl_0_0 
* INOUT : bl_0_1 
* INOUT : bl_0_2 
* INOUT : bl_0_3 
* INOUT : bl_0_4 
* INOUT : bl_0_5 
* INOUT : bl_0_6 
* INOUT : bl_0_7 
* INOUT : bl_0_8 
* INOUT : bl_0_9 
* INOUT : bl_0_10 
* INOUT : bl_0_11 
* INOUT : bl_0_12 
* INOUT : bl_0_13 
* INOUT : bl_0_14 
* INOUT : bl_0_15 
* INPUT : wlt_0_0
* INPUT : wlt_0_1  
* INPUT : wlt_0_2 
* INPUT : wlt_0_3 
* INPUT : wlt_0_4 
* INPUT : wlt_0_5
* INPUT : wlt_0_6 
* INPUT : wlt_0_7 
* INPUT : wlt_0_8 
* INPUT : wlt_0_9 
* INPUT : wlt_0_10 
* INPUT : wlt_0_11 
* INPUT : wlt_0_12 
* INPUT : wlt_0_13 
* INPUT : wlt_0_14
* INPUT : wlt_0_15
* INPUT : wlb_0_0 
* INPUT : wlb_0_1 
* INPUT : wlb_0_2 
* INPUT : wlb_0_3 
* INPUT : wlb_0_4 
* INPUT : wlb_0_5 
* INPUT : wlb_0_6 
* INPUT : wlb_0_7 
* INPUT : wlb_0_8 
* INPUT : wlb_0_9 
* INPUT : wlb_0_10 
* INPUT : wlb_0_11 
* INPUT : wlb_0_12 
* INPUT : wlb_0_13 
* INPUT : wlb_0_14 
* INPUT : wlb_0_15 
* rows: 16 cols: 16
Xbit_r0_c0 bl_0_0 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c0 bl_0_0 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c0 bl_0_0 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c0 bl_0_0 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c0 bl_0_0 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c0 bl_0_0 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c0 bl_0_0 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c0 bl_0_0 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c0 bl_0_0 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c0 bl_0_0 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c0 bl_0_0 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c0 bl_0_0 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c0 bl_0_0 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c0 bl_0_0 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c0 bl_0_0 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c0 bl_0_0 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c1 bl_0_1 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c1 bl_0_1 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c1 bl_0_1 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c1 bl_0_1 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c1 bl_0_1 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c1 bl_0_1 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c1 bl_0_1 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c1 bl_0_1 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c1 bl_0_1 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c1 bl_0_1 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c1 bl_0_1 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c1 bl_0_1 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c1 bl_0_1 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c1 bl_0_1 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c1 bl_0_1 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c1 bl_0_1 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c2 bl_0_2 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c2 bl_0_2 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c2 bl_0_2 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c2 bl_0_2 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c2 bl_0_2 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c2 bl_0_2 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c2 bl_0_2 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c2 bl_0_2 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c2 bl_0_2 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c2 bl_0_2 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c2 bl_0_2 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c2 bl_0_2 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c2 bl_0_2 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c2 bl_0_2 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c2 bl_0_2 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c2 bl_0_2 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c3 bl_0_3 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c3 bl_0_3 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c3 bl_0_3 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c3 bl_0_3 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c3 bl_0_3 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c3 bl_0_3 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c3 bl_0_3 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c3 bl_0_3 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c3 bl_0_3 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c3 bl_0_3 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c3 bl_0_3 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c3 bl_0_3 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c3 bl_0_3 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c3 bl_0_3 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c3 bl_0_3 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c3 bl_0_3 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c4 bl_0_4 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c4 bl_0_4 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c4 bl_0_4 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c4 bl_0_4 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c4 bl_0_4 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c4 bl_0_4 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c4 bl_0_4 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c4 bl_0_4 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c4 bl_0_4 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c4 bl_0_4 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c4 bl_0_4 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c4 bl_0_4 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c4 bl_0_4 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c4 bl_0_4 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c4 bl_0_4 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c4 bl_0_4 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c5 bl_0_5 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c5 bl_0_5 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c5 bl_0_5 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c5 bl_0_5 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c5 bl_0_5 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c5 bl_0_5 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c5 bl_0_5 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c5 bl_0_5 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c5 bl_0_5 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c5 bl_0_5 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c5 bl_0_5 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c5 bl_0_5 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c5 bl_0_5 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c5 bl_0_5 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c5 bl_0_5 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c5 bl_0_5 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c6 bl_0_6 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c6 bl_0_6 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c6 bl_0_6 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c6 bl_0_6 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c6 bl_0_6 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c6 bl_0_6 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c6 bl_0_6 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c6 bl_0_6 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c6 bl_0_6 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c6 bl_0_6 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c6 bl_0_6 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c6 bl_0_6 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c6 bl_0_6 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c6 bl_0_6 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c6 bl_0_6 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c6 bl_0_6 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c7 bl_0_7 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c7 bl_0_7 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c7 bl_0_7 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c7 bl_0_7 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c7 bl_0_7 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c7 bl_0_7 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c7 bl_0_7 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c7 bl_0_7 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c7 bl_0_7 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c7 bl_0_7 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c7 bl_0_7 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c7 bl_0_7 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c7 bl_0_7 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c7 bl_0_7 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c7 bl_0_7 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c7 bl_0_7 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c8 bl_0_8 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c8 bl_0_8 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c8 bl_0_8 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c8 bl_0_8 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c8 bl_0_8 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c8 bl_0_8 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c8 bl_0_8 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c8 bl_0_8 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c8 bl_0_8 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c8 bl_0_8 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c8 bl_0_8 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c8 bl_0_8 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c8 bl_0_8 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c8 bl_0_8 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c8 bl_0_8 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c8 bl_0_8 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c9 bl_0_9 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c9 bl_0_9 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c9 bl_0_9 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c9 bl_0_9 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c9 bl_0_9 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c9 bl_0_9 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c9 bl_0_9 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c9 bl_0_9 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c9 bl_0_9 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c9 bl_0_9 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c9 bl_0_9 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c9 bl_0_9 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c9 bl_0_9 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c9 bl_0_9 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c9 bl_0_9 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c9 bl_0_9 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c10 bl_0_10 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c10 bl_0_10 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c10 bl_0_10 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c10 bl_0_10 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c10 bl_0_10 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c10 bl_0_10 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c10 bl_0_10 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c10 bl_0_10 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c10 bl_0_10 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c10 bl_0_10 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c10 bl_0_10 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c10 bl_0_10 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c10 bl_0_10 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c10 bl_0_10 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c10 bl_0_10 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c10 bl_0_10 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c11 bl_0_11 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c11 bl_0_11 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c11 bl_0_11 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c11 bl_0_11 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c11 bl_0_11 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c11 bl_0_11 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c11 bl_0_11 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c11 bl_0_11 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c11 bl_0_11 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c11 bl_0_11 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c11 bl_0_11 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c11 bl_0_11 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c11 bl_0_11 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c11 bl_0_11 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c11 bl_0_11 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c11 bl_0_11 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c12 bl_0_12 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c12 bl_0_12 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c12 bl_0_12 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c12 bl_0_12 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c12 bl_0_12 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c12 bl_0_12 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c12 bl_0_12 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c12 bl_0_12 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c12 bl_0_12 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c12 bl_0_12 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c12 bl_0_12 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c12 bl_0_12 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c12 bl_0_12 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c12 bl_0_12 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c12 bl_0_12 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c12 bl_0_12 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c13 bl_0_13 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c13 bl_0_13 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c13 bl_0_13 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c13 bl_0_13 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c13 bl_0_13 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c13 bl_0_13 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c13 bl_0_13 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c13 bl_0_13 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c13 bl_0_13 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c13 bl_0_13 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c13 bl_0_13 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c13 bl_0_13 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c13 bl_0_13 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c13 bl_0_13 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c13 bl_0_13 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c13 bl_0_13 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c14 bl_0_14 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c14 bl_0_14 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c14 bl_0_14 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c14 bl_0_14 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c14 bl_0_14 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c14 bl_0_14 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c14 bl_0_14 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c14 bl_0_14 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c14 bl_0_14 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c14 bl_0_14 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c14 bl_0_14 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c14 bl_0_14 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c14 bl_0_14 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c14 bl_0_14 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c14 bl_0_14 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c14 bl_0_14 wlt_0_15 wlb_0_15 cell_2r
Xbit_r0_c15 bl_0_15 wlt_0_0 wlb_0_0 cell_2r
Xbit_r1_c15 bl_0_15 wlt_0_1 wlb_0_1 cell_2r
Xbit_r2_c15 bl_0_15 wlt_0_2 wlb_0_2 cell_2r
Xbit_r3_c15 bl_0_15 wlt_0_3 wlb_0_3 cell_2r
Xbit_r4_c15 bl_0_15 wlt_0_4 wlb_0_4 cell_2r
Xbit_r5_c15 bl_0_15 wlt_0_5 wlb_0_5 cell_2r
Xbit_r6_c15 bl_0_15 wlt_0_6 wlb_0_6 cell_2r
Xbit_r7_c15 bl_0_15 wlt_0_7 wlb_0_7 cell_2r
Xbit_r8_c15 bl_0_15 wlt_0_8 wlb_0_8 cell_2r
Xbit_r9_c15 bl_0_15 wlt_0_9 wlb_0_9 cell_2r
Xbit_r10_c15 bl_0_15 wlt_0_10 wlb_0_10 cell_2r
Xbit_r11_c15 bl_0_15 wlt_0_11 wlb_0_11 cell_2r
Xbit_r12_c15 bl_0_15 wlt_0_12 wlb_0_12 cell_2r
Xbit_r13_c15 bl_0_15 wlt_0_13 wlb_0_13 cell_2r
Xbit_r14_c15 bl_0_15 wlt_0_14 wlb_0_14 cell_2r
Xbit_r15_c15 bl_0_15 wlt_0_15 wlb_0_15 cell_2r
.ENDS bitcell_array

* spice ptx M{0} {1} nmos_vtg m=1 w=0.72u l=0.05u pd=1.54u ps=1.54u as=0.09p ad=0.09p

.SUBCKT column_transmission_gate bl bl_out sel vdd gnd
* INPUT : bl 
* INPUT : sel 
* OUTPUT : bl_out 
* POWER : vdd 
* GROUND : gnd 
Xsel_inv sel sel_bar vdd gnd pinv_1 
Mp bl sel_bar bl_out vdd pmos_vtg m=1 w=2.16u l=0.05u
Mn bl sel bl_out gnd nmos_vtg m=1 w=0.72u l=0.05u 
.ENDS column_transmission_gate

.SUBCKT column_mux bl_0 bl_1 bl_2 bl_3 bl_4 bl_5 bl_6 bl_7 bl_8 bl_9 bl_10 bl_11 bl_12 bl_13 bl_14 bl_15 sel_0 sel_1 sel_2 sel_3 sel_4 sel_5 sel_6 sel_7 sel_8 sel_9 sel_10 sel_11 sel_12 sel_13 sel_14 sel_15 bl_out_0 vdd gnd
* INPUT : bl_0 
* INPUT : bl_1 
* INPUT : bl_2 
* INPUT : bl_3 
* INPUT : bl_4 
* INPUT : bl_5 
* INPUT : bl_6 
* INPUT : bl_7 
* INPUT : bl_8 
* INPUT : bl_9 
* INPUT : bl_10 
* INPUT : bl_11 
* INPUT : bl_12 
* INPUT : bl_13 
* INPUT : bl_14 
* INPUT : bl_15 
* INPUT : sel_0 
* INPUT : sel_1 
* INPUT : sel_2 
* INPUT : sel_3 
* INPUT : sel_4 
* INPUT : sel_5 
* INPUT : sel_6 
* INPUT : sel_7 
* INPUT : sel_8 
* INPUT : sel_9 
* INPUT : sel_10 
* INPUT : sel_11 
* INPUT : sel_12 
* INPUT : sel_13 
* INPUT : sel_14 
* INPUT : sel_15 
* OUTPUT : bl_out_0 
* POWER : vdd
* GROUND : gnd 
* cols: 16 word_size: 1 
XXMUX0 bl_0 bl_out_0 sel_0 vdd gnd column_transmission_gate
XXMUX1 bl_1 bl_out_0 sel_1 vdd gnd column_transmission_gate
XXMUX2 bl_2 bl_out_0 sel_2 vdd gnd column_transmission_gate
XXMUX3 bl_3 bl_out_0 sel_3 vdd gnd column_transmission_gate
XXMUX4 bl_4 bl_out_0 sel_4 vdd gnd column_transmission_gate
XXMUX5 bl_5 bl_out_0 sel_5 vdd gnd column_transmission_gate
XXMUX6 bl_6 bl_out_0 sel_6 vdd gnd column_transmission_gate
XXMUX7 bl_7 bl_out_0 sel_7 vdd gnd column_transmission_gate
XXMUX8 bl_8 bl_out_0 sel_8 vdd gnd column_transmission_gate
XXMUX9 bl_9 bl_out_0 sel_9 vdd gnd column_transmission_gate
XXMUX10 bl_10 bl_out_0 sel_10 vdd gnd column_transmission_gate
XXMUX11 bl_11 bl_out_0 sel_11 vdd gnd column_transmission_gate
XXMUX12 bl_12 bl_out_0 sel_12 vdd gnd column_transmission_gate
XXMUX13 bl_13 bl_out_0 sel_13 vdd gnd column_transmission_gate
XXMUX14 bl_14 bl_out_0 sel_14 vdd gnd column_transmission_gate
XXMUX15 bl_15 bl_out_0 sel_15 vdd gnd column_transmission_gate
.ENDS column_mux

.SUBCKT bitline_driver write_1_int write_0_int w_en nop col_active bl vdd gnd vwrite vhold 
* INPUT : write_1_int
* INPUT : write_0_int
* INPUT : col_active
* OUTPUT: bl
* POWER : vdd 
* GROUND: gnd 
* POWER : vwrite 
* POWER : vhold
Xpinv_buf1 col_active col_active_bar vdd gnd pinv
Xpinv_buf2 col_active_bar col_active_buf vdd gnd pinv
Xinv_a nop nop_bar vdd gnd pinv

Xnand2_a write_0_int col_active_buf drive_vwrite_bar vdd gnd pnand2_2
Xnand2_b w_en col_active_bar vhold_gate_in vdd gnd pnand2
Xnand2_c nop_bar vhold_gate_in drive_vhold vdd gnd pnand2
Xinv_b drive_vhold drive_vhold_bar vdd gnd pinv
Xnand2_d write_1_int col_active_buf drive_0_bar vdd gnd pnand2
Xinv_c drive_0_bar drive_0 vdd gnd pinv

mp_vwrite_top bl drive_vwrite_bar vwrite vdd pmos_vtg w=4.0u l=0.05u
mp_vhold bl drive_vhold_bar vhold vdd pmos_vtg w=4.0u l=0.05u
mn_vhold bl drive_vhold vhold gnd nmos_vtg w=1.8u l=0.05u
mn_v0_top bl drive_0 gnd gnd nmos_vtg w=1.8u l=0.05u
.ENDS bitline_driver


.SUBCKT bitline_driver_array write_1_int write_0_int w_en nop sel_0 sel_1 sel_2 sel_3 sel_4 sel_5 sel_6 sel_7 sel_8 sel_9 sel_10 sel_11 sel_12 sel_13 sel_14 sel_15 bl_0 bl_1 bl_2 bl_3 bl_4 bl_5 bl_6 bl_7 bl_8 bl_9 bl_10 bl_11 bl_12 bl_13 bl_14 bl_15 vdd gnd vwrite vhold 
* INPUT : write_1_int
* INPUT : write_0_int
* INPUT : w_en
* INPUT : nop
* INPUT : sel_0 
* INPUT : sel_1 
* INPUT : sel_2 
* INPUT : sel_3 
* INPUT : sel_4 
* INPUT : sel_5 
* INPUT : sel_6 
* INPUT : sel_7 
* INPUT : sel_8 
* INPUT : sel_9 
* INPUT : sel_10 
* INPUT : sel_11 
* INPUT : sel_12 
* INPUT : sel_13 
* INPUT : sel_14 
* INPUT : sel_15
* OUTPUT : bl_0 
* OUTPUT : bl_1 
* OUTPUT : bl_2 
* OUTPUT : bl_3 
* OUTPUT : bl_4 
* OUTPUT : bl_5 
* OUTPUT : bl_6 
* OUTPUT : bl_7 
* OUTPUT : bl_8 
* OUTPUT : bl_9 
* OUTPUT : bl_10 
* OUTPUT : bl_11 
* OUTPUT : bl_12 
* OUTPUT : bl_13 
* OUTPUT : bl_14 
* OUTPUT : bl_15  
* POWER : vdd 
* GROUND: gnd 
* POWER : vwrite 
* POWER : vhold
Xbitline_driver0 write_1_int write_0_int w_en nop sel_0 bl_0 vdd gnd vwrite vhold bitline_driver
Xbitline_driver1 write_1_int write_0_int w_en nop sel_1 bl_1 vdd gnd vwrite vhold bitline_driver
Xbitline_driver2 write_1_int write_0_int w_en nop sel_2 bl_2 vdd gnd vwrite vhold bitline_driver
Xbitline_driver3 write_1_int write_0_int w_en nop sel_3 bl_3 vdd gnd vwrite vhold bitline_driver
Xbitline_driver4 write_1_int write_0_int w_en nop sel_4 bl_4 vdd gnd vwrite vhold bitline_driver
Xbitline_driver5 write_1_int write_0_int w_en nop sel_5 bl_5 vdd gnd vwrite vhold bitline_driver
Xbitline_driver6 write_1_int write_0_int w_en nop sel_6 bl_6 vdd gnd vwrite vhold bitline_driver
Xbitline_driver7 write_1_int write_0_int w_en nop sel_7 bl_7 vdd gnd vwrite vhold bitline_driver
Xbitline_driver8 write_1_int write_0_int w_en nop sel_8 bl_8 vdd gnd vwrite vhold bitline_driver
Xbitline_driver9 write_1_int write_0_int w_en nop sel_9 bl_9 vdd gnd vwrite vhold bitline_driver
Xbitline_driver10 write_1_int write_0_int w_en nop sel_10 bl_10 vdd gnd vwrite vhold bitline_driver
Xbitline_driver11 write_1_int write_0_int w_en nop sel_11 bl_11 vdd gnd vwrite vhold bitline_driver
Xbitline_driver12 write_1_int write_0_int w_en nop sel_12 bl_12 vdd gnd vwrite vhold bitline_driver
Xbitline_driver13 write_1_int write_0_int w_en nop sel_13 bl_13 vdd gnd vwrite vhold bitline_driver
Xbitline_driver14 write_1_int write_0_int w_en nop sel_14 bl_14 vdd gnd vwrite vhold bitline_driver
Xbitline_driver15 write_1_int write_0_int w_en nop sel_15 bl_15 vdd gnd vwrite vhold bitline_driver
.ENDS bitline_driver_array 

.SUBCKT column_mux_enable_array r_en sel_0 sel_1 sel_2 sel_3 sel_4 sel_5 sel_6 sel_7 sel_8 sel_9 sel_10 sel_11 sel_12 sel_13 sel_14 sel_15 sel_read_0 sel_read_1 sel_read_2 sel_read_3 sel_read_4 sel_read_5 sel_read_6 sel_read_7 sel_read_8 sel_read_9 sel_read_10 sel_read_11 sel_read_12 sel_read_13 sel_read_14 sel_read_15 vdd gnd
* INPUT : r_en
* INPUT : sel_0 
* INPUT : sel_1 
* INPUT : sel_2 
* INPUT : sel_3 
* INPUT : sel_4 
* INPUT : sel_5 
* INPUT : sel_6 
* INPUT : sel_7 
* INPUT : sel_8 
* INPUT : sel_9 
* INPUT : sel_10 
* INPUT : sel_11 
* INPUT : sel_12 
* INPUT : sel_13 
* INPUT : sel_14 
* INPUT : sel_15
* OUTPUT : sel_read_0 
* OUTPUT : sel_read_1 
* OUTPUT : sel_read_2 
* OUTPUT : sel_read_3 
* OUTPUT : sel_read_4 
* OUTPUT : sel_read_5 
* OUTPUT : sel_read_6 
* OUTPUT : sel_read_7 
* OUTPUT : sel_read_8 
* OUTPUT : sel_read_9 
* OUTPUT : sel_read_10 
* OUTPUT : sel_read_11 
* OUTPUT : sel_read_12 
* OUTPUT : sel_read_13 
* OUTPUT : sel_read_14 
* OUTPUT : sel_read_15
* POWER : vdd 
* GROUND: gnd
Xcol_read_activedriver_and0 sel_0 r_en sel_read_0 vdd gnd and2_dec
Xcol_read_activedriver_and1 sel_1 r_en sel_read_1 vdd gnd and2_dec
Xcol_read_activedriver_and2 sel_2 r_en sel_read_2 vdd gnd and2_dec
Xcol_read_activedriver_and3 sel_3 r_en sel_read_3 vdd gnd and2_dec
Xcol_read_activedriver_and4 sel_4 r_en sel_read_4 vdd gnd and2_dec
Xcol_read_activedriver_and5 sel_5 r_en sel_read_5 vdd gnd and2_dec
Xcol_read_activedriver_and6 sel_6 r_en sel_read_6 vdd gnd and2_dec
Xcol_read_activedriver_and7 sel_7 r_en sel_read_7 vdd gnd and2_dec
Xcol_read_activedriver_and8 sel_8 r_en sel_read_8 vdd gnd and2_dec
Xcol_read_activedriver_and9 sel_9 r_en sel_read_9 vdd gnd and2_dec
Xcol_read_activedriver_and10 sel_10 r_en sel_read_10 vdd gnd and2_dec
Xcol_read_activedriver_and11 sel_11 r_en sel_read_11 vdd gnd and2_dec
Xcol_read_activedriver_and12 sel_12 r_en sel_read_12 vdd gnd and2_dec
Xcol_read_activedriver_and13 sel_13 r_en sel_read_13 vdd gnd and2_dec
Xcol_read_activedriver_and14 sel_14 r_en sel_read_14 vdd gnd and2_dec
Xcol_read_activedriver_and15 sel_15 r_en sel_read_15 vdd gnd and2_dec
.ENDS column_mux_enable_array

.SUBCKT column_interface write_1_int write_0_int r_en w_en nop bl_0 bl_1 bl_2 bl_3 bl_4 bl_5 bl_6 bl_7 bl_8 bl_9 bl_10 bl_11 bl_12 bl_13 bl_14 bl_15 dout_0 sel_0 sel_1 sel_2 sel_3 sel_4 sel_5 sel_6 sel_7 sel_8 sel_9 sel_10 sel_11 sel_12 sel_13 sel_14 sel_15 vdd gnd vwrite vhold vref
* INPUT : write_1_int
* INPUT : write_1_int
* INPUT : r_en
* INPUT : w_en
* INPUT : nop
* INPUT : bl_0 
* INPUT : bl_1 
* INPUT : bl_2 
* INPUT : bl_3 
* INPUT : bl_4 
* INPUT : bl_5 
* INPUT : bl_6 
* INPUT : bl_7 
* INPUT : bl_8 
* INPUT : bl_9 
* INPUT : bl_10 
* INPUT : bl_11 
* INPUT : bl_12 
* INPUT : bl_13 
* INPUT : bl_14 
* INPUT : bl_15  
* OUTPUT: dout_0 
* INPUT : sel_0 
* INPUT : sel_1 
* INPUT : sel_2 
* INPUT : sel_3 
* INPUT : sel_4 
* INPUT : sel_5 
* INPUT : sel_6 
* INPUT : sel_7 
* INPUT : sel_8 
* INPUT : sel_9 
* INPUT : sel_10 
* INPUT : sel_11 
* INPUT : sel_12 
* INPUT : sel_13 
* INPUT : sel_14 
* INPUT : sel_15 
* POWER : vdd 
* POWER : vwrite
* POWER : vhold
* POWER : vref
* GROUND: gnd 
*Xopamp bl_out_0 vref dout_0 vdd gnd opamp
Xcomparator bl_out_0 vref dout_0 comparator
Xbitline_driver_array0 write_1_int write_0_int w_en nop sel_0 sel_1 sel_2 sel_3 sel_4 sel_5 sel_6 sel_7 sel_8 sel_9 sel_10 sel_11 sel_12 sel_13 sel_14 sel_15 bl_0 bl_1 bl_2 bl_3 bl_4 bl_5 bl_6 bl_7 bl_8 bl_9 bl_10 bl_11 bl_12 bl_13 bl_14 bl_15 vdd gnd vwrite vhold bitline_driver_array
Xcolumn_mux_enable_array0 r_en sel_0 sel_1 sel_2 sel_3 sel_4 sel_5 sel_6 sel_7 sel_8 sel_9 sel_10 sel_11 sel_12 sel_13 sel_14 sel_15 sel_read_0 sel_read_1 sel_read_2 sel_read_3 sel_read_4 sel_read_5 sel_read_6 sel_read_7 sel_read_8 sel_read_9 sel_read_10 sel_read_11 sel_read_12 sel_read_13 sel_read_14 sel_read_15 vdd gnd column_mux_enable_array
Xcolumn_mux0 bl_0 bl_1 bl_2 bl_3 bl_4 bl_5 bl_6 bl_7 bl_8 bl_9 bl_10 bl_11 bl_12 bl_13 bl_14 bl_15 sel_read_0 sel_read_1 sel_read_2 sel_read_3 sel_read_4 sel_read_5 sel_read_6 sel_read_7 sel_read_8 sel_read_9 sel_read_10 sel_read_11 sel_read_12 sel_read_13 sel_read_14 sel_read_15 bl_out_0 vdd gnd column_mux
.ENDS column_interface

.SUBCKT pnand4_0 A B C D Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* INPUT : D 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand4_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand4_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand4_pmos3 Z C vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand4_pmos4 Z D vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand4_nmos1 Z D net1 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand4_nmos2 net1 C net2 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand4_nmos3 net2 B net3 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand4_nmos4 net3 A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pnand4_0

.SUBCKT pinv_2 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.09u l=0.05u pd=0.28u ps=0.28u as=0.01p ad=0.01p
.ENDS pinv_2

.SUBCKT pdriver A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* sizes: [1]
Xbuf_inv1 A Z vdd gnd pinv_2
.ENDS pdriver

.SUBCKT pand4 A B C D Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* INPUT : D 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Xpand4_nand A B C D zb_int vdd gnd pnand4_0
Xpand4_inv zb_int Z vdd gnd pdriver
.ENDS pand4

.SUBCKT pinv_3 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.09u l=0.05u pd=0.28u ps=0.28u as=0.01p ad=0.01p
.ENDS pinv_3

.SUBCKT hierarchical_predecode4x16_0 in_0 in_1 in_2 in_3 out_0 out_1 out_2 out_3 out_4 out_5 out_6 out_7 out_8 out_9 out_10 out_11 out_12 out_13 out_14 out_15 vdd gnd
* INPUT : in_0 
* INPUT : in_1 
* INPUT : in_2 
* INPUT : in_3 
* OUTPUT: out_0 
* OUTPUT: out_1 
* OUTPUT: out_2 
* OUTPUT: out_3 
* OUTPUT: out_4 
* OUTPUT: out_5 
* OUTPUT: out_6 
* OUTPUT: out_7 
* OUTPUT: out_8 
* OUTPUT: out_9 
* OUTPUT: out_10 
* OUTPUT: out_11 
* OUTPUT: out_12 
* OUTPUT: out_13 
* OUTPUT: out_14 
* OUTPUT: out_15 
* POWER : vdd 
* GROUND: gnd 
Xpre_inv_0 in_0 inbar_0 vdd gnd pinv_3
Xpre_inv_1 in_1 inbar_1 vdd gnd pinv_3
Xpre_inv_2 in_2 inbar_2 vdd gnd pinv_3
Xpre_inv_3 in_3 inbar_3 vdd gnd pinv_3
XXpre4x16_and_0 inbar_0 inbar_1 inbar_2 inbar_3 out_0 vdd gnd pand4
XXpre4x16_and_1 in_0 inbar_1 inbar_2 inbar_3 out_1 vdd gnd pand4
XXpre4x16_and_2 inbar_0 in_1 inbar_2 inbar_3 out_2 vdd gnd pand4
XXpre4x16_and_3 in_0 in_1 inbar_2 inbar_3 out_3 vdd gnd pand4
XXpre4x16_and_4 inbar_0 inbar_1 in_2 inbar_3 out_4 vdd gnd pand4
XXpre4x16_and_5 in_0 inbar_1 in_2 inbar_3 out_5 vdd gnd pand4
XXpre4x16_and_6 inbar_0 in_1 in_2 inbar_3 out_6 vdd gnd pand4
XXpre4x16_and_7 in_0 in_1 in_2 inbar_3 out_7 vdd gnd pand4
XXpre4x16_and_8 inbar_0 inbar_1 inbar_2 in_3 out_8 vdd gnd pand4
XXpre4x16_and_9 in_0 inbar_1 inbar_2 in_3 out_9 vdd gnd pand4
XXpre4x16_and_10 inbar_0 in_1 inbar_2 in_3 out_10 vdd gnd pand4
XXpre4x16_and_11 in_0 in_1 inbar_2 in_3 out_11 vdd gnd pand4
XXpre4x16_and_12 inbar_0 inbar_1 in_2 in_3 out_12 vdd gnd pand4
XXpre4x16_and_13 in_0 inbar_1 in_2 in_3 out_13 vdd gnd pand4
XXpre4x16_and_14 inbar_0 in_1 in_2 in_3 out_14 vdd gnd pand4
XXpre4x16_and_15 in_0 in_1 in_2 in_3 out_15 vdd gnd pand4
.ENDS hierarchical_predecode4x16_0

.SUBCKT bank dout0_0 din0_0 addr0_0 addr0_1 addr0_2 addr0_3 addr0_4 addr0_5 addr0_6 addr0_7 w_en0 r_en0 wl_en0 nop vdd gnd vwrite vread vhold vref
* OUTPUT: dout0_0  
* INPUT : din0_0 
* INPUT : addr0_0 
* INPUT : addr0_1 
* INPUT : addr0_2 
* INPUT : addr0_3 
* INPUT : addr0_4 
* INPUT : addr0_5 
* INPUT : addr0_6 
* INPUT : addr0_7 
* INPUT : w_en0 
* INPUT : r_en0 
* INPUT : wl_en0 
* INPUT : nop
* POWER : vdd 
* GROUND: gnd 
* POWER : vwrite 
* POWER : vread
* POWER : vhold
* POWER : vref
Xdin_and_write din0_0 w_en0 write_1_int_a vdd gnd pand2
Xdin_and_write_buf write_1_int_a write_1_int vdd gnd pdriver_1
Xdin_inv din0_0 din0_0_bar vdd gnd pinv
Xdin_bar_and_write din0_0_bar w_en0 write_0_int_a vdd gnd pand2
Xdin_bar_and_write_buf write_0_int_a write_0_int vdd gnd pdriver_1

Xbitcell_array bl_0_0 bl_0_1 bl_0_2 bl_0_3 bl_0_4 bl_0_5 bl_0_6 bl_0_7 bl_0_8 bl_0_9 bl_0_10 bl_0_11 bl_0_12 bl_0_13 bl_0_14 bl_0_15 wlt_0_0 wlt_0_1 wlt_0_2 wlt_0_3 wlt_0_4 wlt_0_5 wlt_0_6 wlt_0_7 wlt_0_8 wlt_0_9 wlt_0_10 wlt_0_11 wlt_0_12 wlt_0_13 wlt_0_14 wlt_0_15 wlb_0_0 wlb_0_1 wlb_0_2 wlb_0_3 wlb_0_4 wlb_0_5 wlb_0_6 wlb_0_7 wlb_0_8 wlb_0_9 wlb_0_10 wlb_0_11 wlb_0_12 wlb_0_13 wlb_0_14 wlb_0_15 bitcell_array
Xcolumn_interface0 write_1_int write_0_int r_en0 w_en0 nop bl_0_0 bl_0_1 bl_0_2 bl_0_3 bl_0_4 bl_0_5 bl_0_6 bl_0_7 bl_0_8 bl_0_9 bl_0_10 bl_0_11 bl_0_12 bl_0_13 bl_0_14 bl_0_15 dout0_0 sel0_0 sel0_1 sel0_2 sel0_3 sel0_4 sel0_5 sel0_6 sel0_7 sel0_8 sel0_9 sel0_10 sel0_11 sel0_12 sel0_13 sel0_14 sel0_15 vdd gnd vwrite vhold vref column_interface
Xport_address0 addr0_4 addr0_5 addr0_6 addr0_7 wl_en0 write_1_int write_0_int w_en0 r_en0 nop wlt_0_0 wlt_0_1 wlt_0_2 wlt_0_3 wlt_0_4 wlt_0_5 wlt_0_6 wlt_0_7 wlt_0_8 wlt_0_9 wlt_0_10 wlt_0_11 wlt_0_12 wlt_0_13 wlt_0_14 wlt_0_15 wlb_0_0 wlb_0_1 wlb_0_2 wlb_0_3 wlb_0_4 wlb_0_5 wlb_0_6 wlb_0_7 wlb_0_8 wlb_0_9 wlb_0_10 wlb_0_11 wlb_0_12 wlb_0_13 wlb_0_14 wlb_0_15 vdd gnd vwrite vread vhold port_address
Xcol_address_decoder0 addr0_0 addr0_1 addr0_2 addr0_3 sel0_0 sel0_1 sel0_2 sel0_3 sel0_4 sel0_5 sel0_6 sel0_7 sel0_8 sel0_9 sel0_10 sel0_11 sel0_12 sel0_13 sel0_14 sel0_15 vdd gnd hierarchical_predecode4x16_0
.ENDS bank

* spice ptx M{0} {1} nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p

* spice ptx M{0} {1} pmos_vtg m=1 w=0.54u l=0.05u pd=1.18u ps=1.18u as=0.07p ad=0.07p

.SUBCKT pinv_4 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.54u l=0.05u pd=1.18u ps=1.18u as=0.07p ad=0.07p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pinv_4

.SUBCKT pinv_5 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=1.08u l=0.05u pd=2.26u ps=2.26u as=0.14p ad=0.14p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.36u l=0.05u pd=0.82u ps=0.82u as=0.04p ad=0.04p
.ENDS pinv_5

.SUBCKT dff_buf_0 D Q Qb clk vdd gnd
* INPUT : D 
* OUTPUT: Q 
* OUTPUT: Qb 
* INPUT : clk 
* POWER : vdd 
* GROUND: gnd 
* inv1: 2 inv2: 4
Xdff_buf_dff D qint clk vdd gnd dff
Xdff_buf_inv1 qint Qb vdd gnd pinv_4
Xdff_buf_inv2 Qb Q vdd gnd pinv_5
.ENDS dff_buf_0

.SUBCKT dff_buf_array din_0 din_1 din_2 dout_0 dout_bar_0 dout_1 dout_bar_1 dout_2 dout_bar_2 clk vdd gnd
* INPUT : din_0 
* INPUT : din_1 
* OUTPUT: dout_0 
* OUTPUT: dout_bar_0 
* OUTPUT: dout_1 
* OUTPUT: dout_bar_1 
* INPUT : clk 
* POWER : vdd 
* GROUND: gnd 
* inv1: 2 inv2: 4
Xdff_r0_c0 din_0 dout_0 dout_bar_0 clk vdd gnd dff_buf_0
Xdff_r1_c0 din_1 dout_1 dout_bar_1 clk vdd gnd dff_buf_0
Xdff_r2_c0 din_2 dout_2 dout_bar_2 clk vdd gnd dff_buf_0
.ENDS dff_buf_array

.SUBCKT pnand2_0 A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand2_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand2_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand2_nmos1 Z B net1 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand2_nmos2 net1 A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pnand2_0

* spice ptx M{0} {1} nmos_vtg m=1 w=1.08u l=0.05u pd=2.26u ps=2.26u as=0.14p ad=0.14p

* spice ptx M{0} {1} pmos_vtg m=1 w=3.2399999999999998u l=0.05u pd=6.58u ps=6.58u as=0.40p ad=0.40p

.SUBCKT pinv_6 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=3.2399999999999998u l=0.05u pd=6.58u ps=6.58u as=0.40p ad=0.40p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=1.08u l=0.05u pd=2.26u ps=2.26u as=0.14p ad=0.14p
.ENDS pinv_6

.SUBCKT pdriver_0 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* sizes: [12]
Xbuf_inv1 A Z vdd gnd pinv_6
.ENDS pdriver_0

.SUBCKT pand2 A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Xpand2_nand A B zb_int vdd gnd pnand2_0
Xpand2_inv zb_int Z vdd gnd pdriver_0
.ENDS pand2

.SUBCKT pinv_7 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=1.08u l=0.05u pd=2.26u ps=2.26u as=0.14p ad=0.14p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.36u l=0.05u pd=0.82u ps=0.82u as=0.04p ad=0.04p
.ENDS pinv_7

* spice ptx M{0} {1} nmos_vtg m=1 w=1.44u l=0.05u pd=2.98u ps=2.98u as=0.18p ad=0.18p

* spice ptx M{0} {1} pmos_vtg m=1 w=4.32u l=0.05u pd=8.74u ps=8.74u as=0.54p ad=0.54p

.SUBCKT pinv_8 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=4.32u l=0.05u pd=8.74u ps=8.74u as=0.54p ad=0.54p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=1.44u l=0.05u pd=2.98u ps=2.98u as=0.18p ad=0.18p
.ENDS pinv_8

.SUBCKT pbuf_0 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Xbuf_inv1 A zb_int vdd gnd pinv_7
Xbuf_inv2 zb_int Z vdd gnd pinv_8
.ENDS pbuf_0

.SUBCKT pinv_9 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.09u l=0.05u pd=0.28u ps=0.28u as=0.01p ad=0.01p
.ENDS pinv_9

* spice ptx M{0} {1} nmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p

* spice ptx M{0} {1} pmos_vtg m=1 w=0.8099999999999999u l=0.05u pd=1.72u ps=1.72u as=0.10p ad=0.10p

.SUBCKT pinv_10 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.8099999999999999u l=0.05u pd=1.72u ps=1.72u as=0.10p ad=0.10p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
.ENDS pinv_10

* spice ptx M{0} {1} nmos_vtg m=1 w=0.8099999999999999u l=0.05u pd=1.72u ps=1.72u as=0.10p ad=0.10p

* spice ptx M{0} {1} pmos_vtg m=1 w=2.4299999999999997u l=0.05u pd=4.96u ps=4.96u as=0.30p ad=0.30p

.SUBCKT pinv_11 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=2.4299999999999997u l=0.05u pd=4.96u ps=4.96u as=0.30p ad=0.30p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.8099999999999999u l=0.05u pd=1.72u ps=1.72u as=0.10p ad=0.10p
.ENDS pinv_11

* spice ptx M{0} {1} nmos_vtg m=1 w=2.4299999999999997u l=0.05u pd=4.96u ps=4.96u as=0.30p ad=0.30p

* spice ptx M{0} {1} pmos_vtg m=1 w=7.29u l=0.05u pd=14.68u ps=14.68u as=0.91p ad=0.91p

.SUBCKT pinv_12 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=7.29u l=0.05u pd=14.68u ps=14.68u as=0.91p ad=0.91p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=2.4299999999999997u l=0.05u pd=4.96u ps=4.96u as=0.30p ad=0.30p
.ENDS pinv_12

.SUBCKT pdriver_1 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* sizes: [1, 3, 9, 27]
Xbuf_inv1 A Zb1_int vdd gnd pinv_9
Xbuf_inv2 Zb1_int Zb2_int vdd gnd pinv_10
Xbuf_inv3 Zb2_int Zb3_int vdd gnd pinv_11
Xbuf_inv4 Zb3_int Z vdd gnd pinv_12
.ENDS pdriver_1

.SUBCKT pinv_13 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.09u l=0.05u pd=0.28u ps=0.28u as=0.01p ad=0.01p
.ENDS pinv_13

.SUBCKT pinv_14 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.54u l=0.05u pd=1.18u ps=1.18u as=0.07p ad=0.07p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pinv_14

* spice ptx M{0} {1} nmos_vtg m=1 w=0.44999999999999996u l=0.05u pd=1.00u ps=1.00u as=0.06p ad=0.06p

* spice ptx M{0} {1} pmos_vtg m=1 w=1.3499999999999999u l=0.05u pd=2.80u ps=2.80u as=0.17p ad=0.17p

.SUBCKT pinv_15 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=1.3499999999999999u l=0.05u pd=2.80u ps=2.80u as=0.17p ad=0.17p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.44999999999999996u l=0.05u pd=1.00u ps=1.00u as=0.06p ad=0.06p
.ENDS pinv_15

.SUBCKT pdriver_2 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* sizes: [1, 1, 2, 5]
Xbuf_inv1 A Zb1_int vdd gnd pinv_9
Xbuf_inv2 Zb1_int Zb2_int vdd gnd pinv_13
Xbuf_inv3 Zb2_int Zb3_int vdd gnd pinv_14
Xbuf_inv4 Zb3_int Z vdd gnd pinv_15
.ENDS pdriver_2

.SUBCKT pnand3_0 A B C Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand3_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand3_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand3_pmos3 Z C vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand3_nmos1 Z C net1 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand3_nmos2 net1 B net2 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand3_nmos3 net2 A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pnand3_0

.SUBCKT pinv_16 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=2.4299999999999997u l=0.05u pd=4.96u ps=4.96u as=0.30p ad=0.30p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.8099999999999999u l=0.05u pd=1.72u ps=1.72u as=0.10p ad=0.10p
.ENDS pinv_16

.SUBCKT pinv_20 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=1.62u l=0.05u
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.54u l=0.05u
.ENDS pinv_20

.SUBCKT pinv_21 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.405u
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.135u
.ENDS pinv_21

.SUBCKT pdriver_3 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* sizes: [9]
Xbuf_inv1 A Z vdd gnd pinv_16
.ENDS pdriver_3

.SUBCKT pand3 A B C Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Xpand3_nand A B C zb_int vdd gnd pnand3_0
Xpand3_inv zb_int Z vdd gnd pdriver_3
.ENDS pand3

.SUBCKT pdriver_4 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
* sizes: [1]
Xbuf_inv1 A Z vdd gnd pinv_9
.ENDS pdriver_4

.SUBCKT pand3_0 A B C Z vdd gnd
* INPUT : A 
* INPUT : B 
* INPUT : C 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Xpand3_nand A B C zb_int vdd gnd pnand3_0
Xpand3_inv zb_int Z vdd gnd pdriver_4
.ENDS pand3_0

.SUBCKT pinv_17 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.09u l=0.05u pd=0.28u ps=0.28u as=0.01p ad=0.01p
.ENDS pinv_17

.SUBCKT pnand2_1 A B Z vdd gnd
* INPUT : A 
* INPUT : B 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpnand2_pmos1 vdd A Z vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand2_pmos2 Z B vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpnand2_nmos1 Z B net1 gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
Mpnand2_nmos2 net1 A gnd gnd nmos_vtg m=1 w=0.18u l=0.05u pd=0.46u ps=0.46u as=0.02p ad=0.02p
.ENDS pnand2_1

.SUBCKT pinv_18 A Z vdd gnd
* INPUT : A 
* OUTPUT: Z 
* POWER : vdd 
* GROUND: gnd 
Mpinv_pmos Z A vdd vdd pmos_vtg m=1 w=0.27u l=0.05u pd=0.64u ps=0.64u as=0.03p ad=0.03p
Mpinv_nmos Z A gnd gnd nmos_vtg m=1 w=0.09u l=0.05u pd=0.28u ps=0.28u as=0.01p ad=0.01p
.ENDS pinv_18

.SUBCKT delay_chain in out vdd gnd
* INPUT : in 
* OUTPUT: out 
* POWER : vdd 
* GROUND: gnd 
* fanouts: [4, 4, 4, 4, 4, 4, 4, 4, 4]
Xdinv0 in dout_1 vdd gnd pinv_18
Xdload_0_0 dout_1 n_0_0 vdd gnd pinv_18
Xdload_0_1 dout_1 n_0_1 vdd gnd pinv_18
Xdload_0_2 dout_1 n_0_2 vdd gnd pinv_18
Xdload_0_3 dout_1 n_0_3 vdd gnd pinv_18
Xdinv1 dout_1 dout_2 vdd gnd pinv_18
Xdload_1_0 dout_2 n_1_0 vdd gnd pinv_18
Xdload_1_1 dout_2 n_1_1 vdd gnd pinv_18
Xdload_1_2 dout_2 n_1_2 vdd gnd pinv_18
Xdload_1_3 dout_2 n_1_3 vdd gnd pinv_18
Xdinv2 dout_2 dout_3 vdd gnd pinv_18
Xdload_2_0 dout_3 n_2_0 vdd gnd pinv_18
Xdload_2_1 dout_3 n_2_1 vdd gnd pinv_18
Xdload_2_2 dout_3 n_2_2 vdd gnd pinv_18
Xdload_2_3 dout_3 n_2_3 vdd gnd pinv_18
Xdinv3 dout_3 dout_4 vdd gnd pinv_18
Xdload_3_0 dout_4 n_3_0 vdd gnd pinv_18
Xdload_3_1 dout_4 n_3_1 vdd gnd pinv_18
Xdload_3_2 dout_4 n_3_2 vdd gnd pinv_18
Xdload_3_3 dout_4 n_3_3 vdd gnd pinv_18
Xdinv4 dout_4 dout_5 vdd gnd pinv_18
Xdload_4_0 dout_5 n_4_0 vdd gnd pinv_18
Xdload_4_1 dout_5 n_4_1 vdd gnd pinv_18
Xdload_4_2 dout_5 n_4_2 vdd gnd pinv_18
Xdload_4_3 dout_5 n_4_3 vdd gnd pinv_18
Xdinv5 dout_5 dout_6 vdd gnd pinv_18
Xdload_5_0 dout_6 n_5_0 vdd gnd pinv_18
Xdload_5_1 dout_6 n_5_1 vdd gnd pinv_18
Xdload_5_2 dout_6 n_5_2 vdd gnd pinv_18
Xdload_5_3 dout_6 n_5_3 vdd gnd pinv_18
Xdinv6 dout_6 dout_7 vdd gnd pinv_18
Xdload_6_0 dout_7 n_6_0 vdd gnd pinv_18
Xdload_6_1 dout_7 n_6_1 vdd gnd pinv_18
Xdload_6_2 dout_7 n_6_2 vdd gnd pinv_18
Xdload_6_3 dout_7 n_6_3 vdd gnd pinv_18
Xdinv7 dout_7 dout_8 vdd gnd pinv_18
Xdload_7_0 dout_8 n_7_0 vdd gnd pinv_18
Xdload_7_1 dout_8 n_7_1 vdd gnd pinv_18
Xdload_7_2 dout_8 n_7_2 vdd gnd pinv_18
Xdload_7_3 dout_8 n_7_3 vdd gnd pinv_18
Xdinv8 dout_8 out vdd gnd pinv_18
Xdload_8_0 out n_8_0 vdd gnd pinv_18
Xdload_8_1 out n_8_1 vdd gnd pinv_18
Xdload_8_2 out n_8_2 vdd gnd pinv_18
Xdload_8_3 out n_8_3 vdd gnd pinv_18
.ENDS delay_chain

.SUBCKT control_logic_rw csb web reb clk w_en r_en wl_en clk_buf nop vdd gnd
* INPUT : csb 
* INPUT : web 
* INPUT : reb 
* INPUT : clk 
* OUTPUT: w_en 
* OUTPUT: r_en
* OUTPUT: wl_en 
* OUTPUT: clk_buf
* OUTPUT: nop 
* POWER : vdd 
* GROUND: gnd 
* word_size 1
Xclkbuf clk clk_buf vdd gnd pdriver_1
Xctrl_dffs csb web reb cs_bar cs we_bar we re_bar re clk_buf vdd gnd dff_buf_array
Xand2_gated_clk_buf clk_buf cs gated_clk_buf vdd gnd pand2
*Xbuf_wl_en gated_clk_buf wl_en vdd gnd pdriver_2
Xbuf_wl_en vdd wl_en vdd gnd pdriver_2
Xbuf_r_en re r_en vdd gnd pdriver_1 
Xbuf_w_en we w_en vdd gnd pdriver_1 
Xnop re we nop_int vdd gnd pnor2_2
Xnop_driver nop_int nop vdd gnd pdriver_1
.ENDS control_logic_rw

.SUBCKT default_2R_16_16_1bit din0_0 addr0_0 addr0_1 addr0_2 addr0_3 addr0_4 addr0_5 addr0_6 addr0_7 csb0 web0 reb0 clk0 dout0_0 vdd gnd vwrite vread vhold vref
* INPUT : din0[0] 
* INPUT : addr0[0] 
* INPUT : addr0[1] 
* INPUT : addr0[2] 
* INPUT : addr0[3] 
* INPUT : addr0[4] 
* INPUT : addr0[5] 
* INPUT : addr0[6] 
* INPUT : addr0[7] 
* INPUT : csb0 
* INPUT : web0 
* INPUT : reb0 
* INPUT : clk0 
* OUTPUT: dout0[0] 
* POWER : vdd 
* GROUND: gnd 
* POWER : vwrite 
* POWER : vread
* POWER : vhold
Xbank0 dout0_0 bank_din0_0 a0_0 a0_1 a0_2 a0_3 a0_4 a0_5 a0_6 a0_7 w_en0 r_en0 wl_en0 nop vdd gnd vwrite vread vhold vref bank
Xcontrol0 csb0 web0 reb0 clk0 w_en0 r_en0 wl_en0 clk_buf0 nop vdd gnd control_logic_rw
Xrow_address0 addr0_4 addr0_5 addr0_6 addr0_7 a0_4 a0_5 a0_6 a0_7 clk_buf0 vdd gnd row_addr_dff
Xcol_address0 addr0_0 addr0_1 addr0_2 addr0_3 a0_0 a0_1 a0_2 a0_3 clk_buf0 vdd gnd col_addr_dff
Xdata_dff0 din0_0 bank_din0_0 clk_buf0 vdd gnd data_dff
.ENDS default_2R_16_16_1bit
