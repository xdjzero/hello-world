************************************
* Homework 2 
* EE 382M-VLSI II
************************************

.option runlvl=6
.option post

*************************************

.global vdd
.param vdd = 0.8 
.param tr = 50p
.param t1 = 2.89n

*************************************
.include "22nm_NMOS_HI_K_HP.txt"
.include "22nm_PMOS_HI_K_HP.txt"
.include "flop_library_22nm.txt"   $ the library of circuit elements

*************************************

x0 din clk out dff_a
v1 clk 0 pulse ( 0 vdd 1n tr tr 1n 2n)
v0 din 0 pwl (0 0 t1 0 't1 + 50p' vdd )
vdd vdd 0 vdd

.tran 1ps 8ns sweep t1 lin 11 2.897n 2.88n

.TEMP 25
.end

