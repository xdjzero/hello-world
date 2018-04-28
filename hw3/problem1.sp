************************************
* Homework 3 Problem 1
* EE 382M-VLSI II
************************************

.options runlvl=6
.option post

*************************************

.param VDD = 0.9
.param lg = 18n
.param CAP = 100f
.param RES = 0

.global vdd
V1 vdd 0 VDD

*************************************
.include "14nm_NMOS_HI_K_HP.txt"
.include "14nm_PMOS_HI_K_HP.txt"
*************************************

***** inverter definition
.macro inv IN OUT pnfin=1 nnfin=1
M1 OUT IN vdd vdd pfet L=lg NFIN=pnfin
M2 OUT IN 0   0   nfet L=lg NFIN=nnfin
.eom
***** end of inverter definition


*************************************
*************************************
.TEMP 30C
.op

.END

