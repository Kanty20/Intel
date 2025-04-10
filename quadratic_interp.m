clc; clear;

%{
 f(x) = sin(2x -pi/4) dla x = [0,2] używając quadratic interpolator
 zadanie do intela
 str. 8
 oprócz kwantyzacji, zaokrąglenie wyjścia mnożnika wprowadza błąd
%}

f = @(x) sin(2*x - pi/4);   % @- dla jednego argumentu x
x_start = 0;
x_end = 2;
m = 4; %liczba bitów, N=2^m
N = 2^m;    
dx = (x_end - x_start) / N; %szerokość przedziału 
q8 = 8;     %dokładność do 8 miejsca bitowego, 2^-8
q10 = 10;   %lepsza dokładność, 2^-10
q12 = 12;   %eksperyment
n = 8;

coeffs = zeros(N, 3); % a0,a1,a2, obliczanie wsooółczynnika

for k = 0:N-1
    poczatek_przedzialu = x_start + k * dx;
    
    c0 = f(poczatek_przedzialu + (sqrt(3)/2 + 1) * 2^(-m - 1));  %chebyschev
    c1 = f(poczatek_przedzialu + 2^(-m - 1));
    c2 = f(poczatek_przedzialu + (1 - sqrt(3)/2) * 2^(-m - 1)); %to samo co y0
    
    %quadric interpolator coefficients
    a0 = (1/3) * (c0 * (2 - sqrt(3)) - c1 + c2 * (sqrt(3) + 2));
    a1 = (1/6) * (c0 * (sqrt(3) - 4) * 2^(m+2) + c1 * 2^(m+4) - c2 * (sqrt(3) + 4) * 2^(m+2));
    a2 = (1/3) * (c0 - 2 * c1 + c2) * 2^(2*m + 3);  
    
    coeffs(k+1, :) = [a0, a1, a2];    %macierz współczynników
end

%spr błąd aprox
wektor = linspace(x_start, x_end, 10000);   %jak dam wiecej punktów to nic się nie zmienia
funkcja = f(wektor);
f_aprox = zeros(size(wektor));    %przygotowanie wektora do uzupełnienia wynikami, pusty bo ma być tej samej długości

for i = 1:length(wektor)
    x = wektor(i);
    k = min(floor((x - x_start)/dx) + 1, N);
    a = coeffs(k, :);
    f_aprox(i) = a(1) + a(2)*x + a(3)*x^2;
end

figure;
plot(wektor, funkcja, 'b', 'LineWidth' ,2); hold on;
plot(wektor, f_aprox, 'r--', "Linewidth", 2);
legend('Orginalna funkcja', 'Przybliżenia kwadratowe');
xlabel('x'); ylabel('f(x)');
title('f(x) = sin(2x - \pi/4)');
grid on;

%{
 Ee0= błąd kwantyzacji a0;
 Ee1= błąd kwantyzacji a1*x
 |Ee0| <= 2^(-n_f0-1)
 |Ee1| <= 2^(-n_f1-1)*2^-m
 n0= n_f0+1 = q+3
 n1= n_f1+1  =q-m+3
%}

n0 = q8 + 3;
n1 = q8 - m +3;
km1 = n - m - 1;