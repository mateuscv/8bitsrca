*   RIPPLE CARRY ADDER DE 8-BITS
* TRABALHO II DE SISTEMAS DIGITAIS 
* MATEUS CAPPELLARI VIEIRA - 116514

* INCLUSÃO DOS SUBCIRCUITOS (Full adder):

.include 8bitrcasubckts.sp

* DESCRIÇÃO DO CIRCUITO

Vvdd fonte gnd 0.9V
Xfulladder1 0     a1 b1 cout1 soma1 fonte gnd FA
Xfulladder2 cout1 a2 b2 cout2 soma2 fonte gnd FA
Xfulladder3 cout2 a3 b3 cout3 soma3 fonte gnd FA
Xfulladder4 cout3 a4 b4 cout4 soma4 fonte gnd FA
Xfulladder5 cout4 a5 b5 cout5 soma5 fonte gnd FA
Xfulladder6 cout5 a6 b6 cout6 soma6 fonte gnd FA
Xfulladder7 cout6 a7 b7 cout7 soma7 fonte gnd FA
Xfulladder8 cout7 a8 b8 cout8 soma8 fonte gnd FA

Va1 a1 0 0.9
Vb1 b1 0 PULSE (0 0.9 0 0 0 2n 4n)
Va2 a2 0 PULSE (0 0.9 0 0 0 4n 8n)
Vb2 b2 0 PULSE (0 0.9 0 0 0 8n 16n)

.tran 0.7p 6n