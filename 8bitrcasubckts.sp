* DESCRIÇÃO DOS SUBCIRCUITOS (Portas lógicas)

.include 32nm_HP.pm

* Inversor:

.SUBCKT INV in out supply ground
M1 out	in	supply	supply	pmos l=32n w=128n
M2 out	in	ground	ground	nmos l=32n w=64n
.ends INV

* XOR de 2 bits:

.SUBCKT XOR2 in1 in2 out supply ground
Xinv1 in1 in1_n supply ground INV
Xinv2 in2 in2_n supply ground INV
MP1 nodo1	in1_n supply	supply	pmos l=32n w=256n
MP2 out		in2 	nodo1		supply	pmos l=32n w=256n
MP3 nodo2	in1 	supply	supply	pmos l=32n w=256n
MP4 out		in2_n nodo2		supply	pmos l=32n w=256n
MN1 out		in2_n	nodo3		ground	nmos l=32n w=128n
MN2 nodo3	in1_n	ground	ground	nmos l=32n w=128n
MN3 out		in2	nodo4		ground	nmos l=32n w=128n
MN4 nodo4	in1	ground	ground	nmos l=32n w=128n
.ends XOR2

* NAND de 2 bits (necessária para a AND):

.SUBCKT NAND2 in1 in2 out supply ground
MP1 out		in1 supply	supply	pmos l=32n w=64n
MP2 out		in2 supply	supply	pmos l=32n w=64n
MN1 out		in1 nodo1	ground	nmos l=32n w=128n
MN2 nodo1	in2 ground	ground	nmos l=32n w=128n
.ends NAND2

* AND de 2 bits:

.SUBCKT AND2 in1 in2 out supply ground
Xnand1 in1 in2 nodo1 supply ground NAND2
Xinv1 nodo1 out supply ground INV
.ends AND2

* NOR de 2 bits (necessária para a OR):

.SUBCKT NOR2 in1 in2 out supply ground
MP1 nodo1	in1 supply	supply	pmos l=32n w=256n
MP2 out		in2 nodo1	supply	pmos l=32n w=256n
MN1 out		in1 ground	ground	nmos l=32n w=64n
MN2 out		in2 ground	ground	nmos l=32n w=64n
.ends NOR2

* OR de 2 bits:

.SUBCKT OR2 in1 in2 out supply ground
Xnor1 in1 in2 nodo1 supply ground NOR2
Xinv1 nodo1 out supply ground INV
.ends OR2

* Full adder

.SUBCKT FA cin in1 in2 cout soma supply ground
Xxor1 in1             in2       in1xorin2       supply ground XOR2
Xxor2 in1xorin2       cin       soma            supply ground XOR2
Xand1 in1xorin2       cin       in1xorin2andcin supply ground AND2
Xand2 in1             in2       in1andin2       supply ground AND2
Xor1  in1xorin2andcin in1andin2 cout            supply ground OR2
.ends FA
