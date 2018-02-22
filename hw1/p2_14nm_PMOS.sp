************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************
.param myvds  = 0.05
.param VSUPLY = 0.9
.param Vclose = 0.7
.param Vopen  = 0.1

*************************************

.include "library-14nm.txt"   $ the library of circuit elements
.include "block_14nm.txt"     $ the delay element

*************************************
.param W=0.056u
.param NFIN=1
Vdd vdd 0 VSUPLY
Vgs vdd g 0
Vds vdd d myvds
M1 d g vdd vdd pfet L=L NFIN=NFIN

.MEAS DC Gm DERIV '-I(Vds)/W' WHEN V(g)=0.7
.PRINT DC Gm=GMO(M1)
.DC SWEEP Vgs 0 0.9 0.01

.alter case 2 : Vds=0.9
.param myvds=0.9

.TEMP 30
.END

