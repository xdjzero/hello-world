************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************

.param VSUPLY = 0.9

*************************************

.include "library-22nm.txt"   $ the library of circuit elements
.include "block_22nm.txt"     $ the delay element

*************************************

Vdd vdd 0 dc VSUPLY PULSE(0 VSUPLY 0n 25n 1n 1n 27n)
Vin in 0 dc VSUPLY
M1 vdd in 0 0 nmos L=L W=W


.MEAS TRAN Ron DERIV I(vdd) WHEN V(vdd)='0.2'
.MEAS TRAN rd DERIV I(vdd) WHEN V(vdd)='0.6'
*.MEAS TRAN Ion I(vds) WHEN V(vds)='0.9'

.DC VSUPLY 0 0.9 0.02
.TRAN .1n 25n

.TEMP 30
.END

