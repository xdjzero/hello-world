************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************
.param myvds  = 0.05
.param VSUPLY = 0.05
.param Vlin   = 0.7
.param Vsat   = 0.1

*************************************

.include "library-22nm.txt"   $ the library of circuit elements
.include "block_22nm.txt"     $ the delay element

*************************************
.param W=0.056u
Vdd vdd 0 VSUPLY
Vgs vdd g 0
Vds vdd d myvds
M1 d g vdd vdd pmos L=L W=W

.MEAS DC Gm DERIV 'I(vd)/W' WHEN V(vd)=Vlin
.DC SWEEP Vgs 0 0.9 0.1

.alter case 2 : Vds=0.9
.param myvds=0.9

.TEMP 30
.END

