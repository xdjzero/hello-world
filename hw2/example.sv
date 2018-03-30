* DFF_top Bisection Search for Setup Time
*
* PWL Stimulus
*
v28 data  gnd PWL
+ 0s        5v 
+ 1n        5v 
+ 2n        0v 
+ Td = "DelayTime"					$ Offsets Data from time 0 by DelayTime
v27 clock gnd PWL
+ 0s        0v 
+ 3n        0v 
+ 4n        5v 
*
* Specify DelayTime as the search parameter and provide 
* the lower and upper limits.
*
.PARAM DelayTime= Opt1 ( 0.0n, 0.0n, 5.0n )
*
* Transient simulation with Bisection Optimization
*
.TRAN 1n 8n Sweep				Optimize = Opt1
+ 				Result   = MaxVout 	$ Look at measure
+ 				Model    = OptMod
*
* This measure finds the transition if it exists
*
.MEASURE Tran MaxVout Max v(D_Output) Goal = `v(Vdd)'
*
* This measure calculates the setup time value
*
.MEASURE Tran SetupTime					Trig v(Data)  Val = `v(Vdd)/2' Fall = 1
+ 					Targ v(Clock) Val = `v(Vdd)/2' Rise = 1
*
* Optimization Model
*
.MODEL OptMod Opt 
+ Method = Bisection
.OPTIONS Post Brief NoMod
*************************************
* AvanLink to Cadence Composer by Avant!
* Hspice Netlist
* May 31 15:24:09 1994
*************************************
.MODEL nmos nmos LEVEL=2
.MODEL pmos pmos LEVEL=2
.Global vdd gnd 
.SUBCKT XGATE  control in n_control out 
m0 in n_control out vdd pmos l=1.2u w=3.4u
m1 in control out gnd nmos l=1.2u w=3.4u
.ends
.SUBCKT INV  in out  wp=9.6u wn=4u l=1.2u
mb2 out in gnd gnd nmos l=l w=wn
mb1 out in vdd vdd pmos l=l w=wp
.ends
.SUBCKT DFF  c d nc nq 
Xi64  nc net46 c net36 XGATE
Xi66  nc net38 c net39 XGATE
Xi65  c nq nc net36 XGATE
Xi62  c d nc net39 XGATE
Xi60  net722 nq INV
Xi61  net46 net38 INV
Xi59  net36 net722 INV
Xi58  net39 net46 INV
c20 net36 gnd c=17.09f
c15 net39 gnd c=15.51f
c12 net46 gnd c=25.78f
c4 nq gnd c=25.28f
c3 net722 gnd c=19.48f
c16 net38 gnd c=16.48f
.ENDS
*-------------------------------------------------------------
* Main Circuit Netlist:
*-------------------------------------------------------------
v14 vdd gnd dc=5
c10 vdd gnd c=35.96f
c15 d_output gnd c=21.52f
c12 dff_nq gnd c=11.73f
c11 net31 gnd c=42.01f
c14 net27 gnd c=34.49f
c13 net25 gnd c=41.73f
c8 clock gnd c=5.94f
c7 data gnd c=7.93f
Xi3  net25 net31 net27 dff_nq DFF l=1u wn=3.8u wp=10u
Xi6  data net31 INV
Xi5  net25 net27 INV
Xi4  clock net25 INV
Xi2  dff_nq d_output INV wp=26.4u wn=10.6u
.END
