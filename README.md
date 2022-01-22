# MMX
Implementare a 6 operații aritmetice din setul de instrucțiuni MMX x86. Tehnologia MMX extinde arhitectura Intel pentru a îmbunătăți performanța multimedia, a comunicațiilor și altele aplicații. Utilizează o tehnică SIMD (single-instruction, multiple-data) pentru a exploata paralelismul algoritmilor. producând o performanță de aplicare de 1,5 până la de 2 ori mai rapidă decât aceleași aplicații pe același procesor fără MMX. Operatiile sunt realizate pe 64 de biti 
Tehnologia MMX este eficienta daca:  
-Datele au o structura de tip vector, matrice, sau o alta structura cu grad ridicat de regularitate 
-Aceeasi secventa de operatii se aplica in mod identic pe fiecare element al structurii
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
paddx <destinatie>, <sursa>
psubx <destinatie>, <sursa>
<destinatie>:= MMi
<sursa>:=MMi | <variabila>
x:= b | w | d
	Tehnica de soluționare a depășirilor de capacitate (superioară sau inferioară) folosită este wraparound astfel nu se mai ține cont de carry iar rezultatul este trunchiat la cei mai puțini semnificativi biti 
	
  Exemplu:
 





Operațiile logice pand, por și pxor
	Aceste operații se realizează doar pe 64 de biti (quadword) și se executa bit cu bit 
	Sintaxă 
pand | por | pxor     <destinatie>, <sursa>
	
  Exemplu:
	 

Comparare
	Operația de comparare se realizează doar pe pachete de tip byte, word și dword ele nu se pot realiza pe pachetul de tip quadword(64 biti)
Sintaxă 
pcmpeqx <destinatie>, <sursa>
x:= b | w | d
pcmpeq compara pachetele intre ele și in caz că cele două valori nu sunt egale stochează în pachetul corespunzator din registrul destinație valoare 0 iar în caz contrar stocheaza valoarea maximă 

Exemplu:
 

