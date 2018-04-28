************************************
* Homework 3 Problem 1
* EE 382M-VLSI II
************************************

.options runlvl=6
.option post

*************************************

.param VDD = 0.9
.param lg = 18n
.param CAP = 100f
.param RES = 0

.global vdd
V1 vdd 0 VDD

*************************************
.include "14nm_NMOS_HI_K_HP.txt"
.include "14nm_PMOS_HI_K_HP.txt"
*************************************

***** inverter definition
.macro inv IN OUT pnfin=1 nnfin=1
M1 OUT IN vdd vdd pfet L=lg NFIN=pnfin
M2 OUT IN 0   0   nfet L=lg NFIN=nnfin
.eom
***** end of inverter definition

x1 a b inv pnfin=10 nnfin=10
x2 c d inv pnfin=10 nnfin=10
x3 e f inv pnfin=10 nnfin=10
x4 g h inv pnfin=10 nnfin=10
x5 i j inv pnfin=10 nnfin=10
x6 k l inv pnfin=10 nnfin=10

c1  b gnd CAP/3
c2  c gnd CAP/3
c3  f gnd CAP/6
c4  g gnd CAP/6
c5  j gnd CAP/3
c6  k gnd CAP/3
c7  b f   CAP/6
c8  c g   CAP/6
c9  f j   CAP/6
c10 g k   CAP/6

r1 b c RES
r2 f g RES
r3 j k RES

v1 e gnd vdd

v2 a gnd pwl (0 0 t1 0 't1 + 50p' vdd)
v3 i gnd pwl (0 0 t1 0 't1 + 50p' vdd)


.tran 1ps 8ns sweep t1 lin 11 1.89n 1.9n

*************************************
*************************************
.TEMP 30C
.op

.END

