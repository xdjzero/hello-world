************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************

.param VSUPLY = 0.9
.param Vlin   = 0.7
.param Vsat   = 0.1

*************************************

.include "library-14nm.txt"   $ the library of circuit elements
.include "block_14nm.txt"     $ the delay element

*************************************
.param W=0.056u
.param NFIN=1

Vdd vdd 0 dc VSUPLY
Vd  vd 0 dc 0 PULSE(0 VSUPLY 0n 25n 1n 1n 27n)
Vin in 0 dc 0
M1  vd in vdd vdd pfet L=L NFIN=NFIN

.MEAS TRAN Ron DERIV 'I(vd)/W' WHEN V(vd)=Vlin
.MEAS TRAN rd DERIV 'I(vd)/W' WHEN V(vd)=Vsat
.MEAS TRAN 'I(vd)' WHEN V(vd)=0
.DC VSUPLY 0 0.9 0.02
.TRAN .1n 25n

.TEMP 30
.END

