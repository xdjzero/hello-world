************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************

.param VDD = 0.9
.global vdd

*************************************

.include "library-22nm.txt"   $ the library of circuit elements
.include "block_22nm.txt"     $ the delay element

*************************************

x0 enable OUT n1 nand size0=2*W size1=2*W size2=W size3=W
x1 n1 n2 delaycell
x2 n2 n3 delaycell
x3 n3 n4 delaycell
x4 n4 n5 delaycell
x5 n5 n6 delaycell
x6 n6 n7 delaycell
x7 n7 n8 delaycell
x8 n8 OUT delaycell

v1 vdd 0 dc VDD

*************************************
* you will need to modify the following 
* lines to apply an input stimulus 
* and clock to the circuit
*************************************

Venable enable 0 DC VDD
.IC V(n1) = 0

.TRAN 1n 100n UIC

.MEAS TRAN delay_0 trig V(n1) td=1.2ns val='vdd/2' cross=1
+                  targ V(n2) td=1.2ns val='vdd/2' cross=1
.MEAS TRAN delay_1 trig V(n1) td=1.15ns val='vdd/2' cross=1
+                  targ V(n2) td=1.15ns val='vdd/2' cross=1

.ALTER case 2: VDD=0.7
.param VDD=0.7

.ALTER case 3: VDD=0.5
.param VDD=0.5

.ALTER case 4: VDD=0.3
.param VDD=0.3

.TEMP 30
.END

