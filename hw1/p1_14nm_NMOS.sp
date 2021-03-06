************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************

.param VSUPLY = 0.9
.param Vclose = 0.1
.param Vopen  = 0.7

*************************************

.include "library-14nm.txt"   $ the library of circuit elements
.include "block_14nm.txt"     $ the delay element

*************************************
.param W=0.056u
.param NFIN=1

Vdd vdd 0 dc VSUPLY PULSE(0 VSUPLY 0n 25n 1n 1n 27n)
Vin in 0 dc VSUPLY
M1 vdd in 0 0 nfet L=L NFIN=NFIN

.MEAS TRAN Ron DERIV '-I(vdd)/W' WHEN V(vdd)=Vclose
.MEAS TRAN rd DERIV '-I(vdd)/W' WHEN V(vdd)=Vopen
.MEAS TRAN '-I(vdd)/W' WHEN V(vdd)=VSUPLY
.DC VSUPLY 0 0.9 0.02
.TRAN .1n 25n

.TEMP 30
.END

