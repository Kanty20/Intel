## Intel

I attached two of five tasks and if you don't mind, I will try to make another one.


#Zadanie 2
5pkt.
Uważam, że algorytm jest dopasowany do do implementacji hardware, ponieważ
- mam tablicę LUT ze współczynnikami a, b, c bez wymaganych do tego ekstra obliczeń,
- drobnym minusem może być moja dokonana optymalizacja na współczynniku a- jest to 26 bitów, co będzie wymagało nakładu zasobów, ale jest to potrzebne aby wyniki były jak najbardziej dokładne, pozostałe współczynniki mają odpowiednią ilość bitów i nie zabiorą dużej ilości zaspobów,
- mało bitów = mniej potrzebnych zasobów,
- pojawiaja się operację + i * co będzie nietrudne do zaimplementowania,
- w "approxFixed" w uadra.cpp nie ma pętli, a jest to docelowy algorytm więc nie będzie kłopotów z przeniesieniem na fpga. Nie są to pętle tylko warunki

  ![image](https://github.com/user-attachments/assets/b4b80146-b63f-4c85-918c-937bc8f7f6ad)
#2pkt.
Powyżej jest fotografia przykładowego rozwiązania otrzymanego z QuadraTb
y_dbl -> mój wynik (y_model[x])
y_ref -> wynik wzorcowy (f_ref(x))
y_err -> porównanie |y_dbl - y_ref| 
Sprawdzono uzyskane wyniki i mieściły się ode w założonych y_err <5.25e-6.
