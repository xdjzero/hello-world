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
*PMOS
.PROB TRAN 'I(x1.X1.M1)'

*NMOS
.PROB TRAN 'I(x1.X1.M2)'

.TRAN 1n 2n UIC
.END

