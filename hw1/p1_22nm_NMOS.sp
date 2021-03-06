************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************

.param VSUPLY = 0.9
.param Vlin   = 0.1
.param Vsat   = 0.7

*************************************

.include "library-22nm.txt"   $ the library of circuit elements
.include "block_22nm.txt"     $ the delay element

*************************************

.param W=0.056u

Vdd vdd 0 dc VSUPLY PULSE(0 VSUPLY 0n 25n 1n 1n 27n)
Vin in 0 dc VSUPLY
M1 vdd in 0 0 nmos L=L W=W

.MEAS TRAN Ron DERIV '-I(vdd)/W' WHEN V(vdd)=Vlin
.MEAS TRAN rd DERIV '-I(vdd)/W' WHEN V(vdd)=Vsat
.MEAS TRAN '-I(vdd)/W' WHEN V(vdd)=0.9
.DC VSUPLY 0 0.9 0.02
.TRAN .1n 25n

.TEMP 30
.END

