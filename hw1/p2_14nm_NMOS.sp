************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************

.param VSUPLY = 0.05
.param Vlin   = 0.05
.param Vopen  = 0.9

*************************************

.include "library-14nm.txt"   $ the library of circuit elements
.include "block_14nm.txt"     $ the delay element

*************************************
.param W=0.056u
.param NFIN=1

Vgs g 0 0
Vds d 0 VSUPLY
M1 d g 0 0 nfet L=L NFIN=NFIN

.PRINT DC Gm=GMO(M1)
.MEAS DC GM DERIV '-I(Vds)/W' WHEN V(g)=Vlin
*.MEAS DC rd DERIV '-I(vdd)/W' WHEN V(vdd)=Vopen
*.MEAS DC '-I(vdd)/W' WHEN V(vdd)=VSUPLY
.DC SWEEP Vgs 0 0.9 0.01

.alter case 2: Vds=0.9
.param VSUPLY=0.9

.TEMP 30
.END

