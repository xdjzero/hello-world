************************************
* Homework 1 
* EE 382M-VLSI II
*problem1 14nm nmos
************************************

.option runlvl=6
.option post

*************************************

.param VDD = 0.9
.global vdd

*************************************

.include "library-14nm.txt"   $ the library of circuit elements
.include "block_14nm.txt"     $ the delay element

*************************************
*define voltage source
Vin in 0 dc VDD 1
Vdd vdd 0 dc VDD 1

*nmos model
M1 vdd delay_out vdd vdd pfet L=L NFIN=3*NFIN



.END

