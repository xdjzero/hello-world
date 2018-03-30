************************************
* Homework 1 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************

.global vdd
.param  VDD=0.8
*************************************

.include "flop_library_22nm.txt"   $ the library of circuit elements

*************************************

v28 din  0 PWL
+ 0s        5v 
+ 1n        5v 
+ 2n        0v 
+ Td = "DelayTime"					$ Offsets din from time 0 by DelayTime
v27 clk 0 PWL
+ 0s        0v 
+ 3n        0v 
+ 4n        5v 

v2  vdd  0 dc=VDD

.PARAM DelayTime= Opt1 ( 0.0n, 0.0n, 5.0n )

.TRAN 1n 8n Sweep				Optimize = Opt1
+ 				Result   = MaxVout 	$ Look at measure
+ 				Model    = OptMod

.MEASURE Tran MaxVout Max v(dout) Goal = `v(Vdd)'

.MEASURE Tran SetupTime					Trig v(din)  Val = `v(Vdd)/2' Fall = 1
+ 					Targ v(clk) Val = `v(Vdd)/2' Rise = 1

.MODEL OptMod Opt 
+ Method = Bisection
.OPTIONS Post Brief NoMod


x0 din clk out dff_a
x1 out dout inv Wp=1500n Wn=1200n
x2 out load Wn=6000n

*************************************
* you will need to modify the following 
* lines to apply an input stimulus 
* and clk to the circuit
*************************************

.ALTER case 2: VDD=0.7
.param VDD=0.7

.TEMP 25
.END

