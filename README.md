# MMX
Implementare a 6 operații aritmetice din setul de instrucțiuni MMX x86. Tehnologia MMX extinde arhitectura Intel pentru a îmbunătăți performanța multimedia, a comunicațiilor și altele aplicații. Utilizează o tehnică SIMD (single-instruction, multiple-data) pentru a exploata paralelismul algoritmilor. producând o performanță de aplicare de 1,5 până la de 2 ori mai rapidă decât aceleași aplicații pe același procesor fără MMX. Operatiile sunt realizate pe 64 de biti 
Tehnologia MMX este eficienta daca:  
- Datele au o structura de tip vector, matrice, sau o alta structura cu grad ridicat de regularitate 
- Aceeasi secventa de operatii se aplica in mod identic pe fiecare element al structurii
- Aceeasi secventa de prelucrare se executa de un numar foarte mare de ori (ex: pe un milion de pixeli ai unei imagini)
- Timpul de executie este critic

MMX introduce 4 tipuri noi de date: 
- Octeti impachetati (Packed byte): 8 octeti, 64 biti
- Cuvinte impachetate (Packed word): 4 cuvinte, 64 biti
- Dublu-cuvinte impachetate (Packed dword): 2 dcuvinte, 64 biti
- Cuadruplu-cuvant (Quadword): 1 qcuvant, 64 biti
                             
Operatiile ce urmează să fie realizate sunt: 
1.	Adunarea
2.	Scăderea
3.	AND
4.	OR
5.	XOR
6.	Verificarea daca două numere sunt egale

În cadrul instructiunilor de tip MMX există sufixe care specifică tipul de data care se folosește 
- B, W, D, sau Q – byte, word, dword, qword; daca apar 2 litere atunci sursa este de tipul primei litere iar destinatia de tipul celei de a doua litere

Adunarea și scăderea 
	
  Aceste două operații se realizează doar pe pa	chete de tip byte, word si dword ele nu se pot realiza pe pachetul de tip quadword(64 biti) 
	
Sintaxă 
	
	paddx destinatie sursa
	
	psubx destinatie sursa
	
	destinatie:= MMi
	
	sursa:=MMi | variabila
	
	x:= b | w | d

Tehnica de soluționare a depășirilor de capacitate (superioară sau inferioară) folosită este wraparound astfel nu se mai ține cont de carry iar rezultatul este trunchiat la cei mai puțini semnificativi biti 
	
  Exemplu: 
 
![qw](https://user-images.githubusercontent.com/70382324/150641610-a5d1370c-ad50-4558-8bca-144baaa2d86a.png)




Operațiile logice pand, por și pxor
	
  Aceste operații se realizează doar pe 64 de biti (quadword) și se executa bit cu bit 

Sintaxă 
	
	pand | por | pxor     destinatie, sursa
	
Exemplu:
![12](https://user-images.githubusercontent.com/70382324/150641655-8228da9c-3e77-4e1b-b82e-aa4dff2c6d5c.png)	 

Comparare
	
  Operația de comparare se realizează doar pe pachete de tip byte, word și dword ele nu se pot realiza pe pachetul de tip quadword(64 biti)

Sintaxă 

	pcmpeqx destinatie, sursa
	
	x:= b | w | d

pcmpeq compara pachetele intre ele și in caz că cele două valori nu sunt egale stochează în pachetul corespunzator din registrul destinație valoare 0 iar în caz contrar stocheaza valoarea maximă 

Exemplu:
 
![13](https://user-images.githubusercontent.com/70382324/150641657-c09351c9-650b-4379-af8a-d25ed4e03b59.png)
	

 Instrucțiunea 
![14](https://user-images.githubusercontent.com/70382324/150641812-6969bb53-041b-4220-8a07-179291abd656.png)
 
Este formată din 11 biti. Biti de la 10..9 sunt folosiți pentru a alege pachetul de date:
	
	- 00 – operație pe byte
	- 01-operație pe word
	- 02-operație pe dword
	- 03-operație pe quadword

Biti de la 8..6 sunt folosiți pentru ALUOP sau ALUCTRL:
	
	- 000- PADD
	- 001- PSUB
	- 010- PCMPEQ
	- 011- PAND
	- 100- POR
	- 101- PXOR
	
Biti de la 5..3 reprezintă registrul destinație iar biti de la 2..0 sunt folosiți pentru rezistul sursă, in total sunt 8 registrii astfel valorile pentru acestia sunt în intervalul 000-111. 
	
