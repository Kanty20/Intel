#include <iostream>
#include <cmath>
#include <iomanip>
#include <ac_fixed.h>
#include <bitset>

#define DBG_wejscie 1
#define DBG_coeff 1
#define DBG_wynik 1

//można też odczytywać bezpośrednio dane z pliku
//strona5,
//3 pkt     ogarnąć DBG, makra
/* 4 pkt
x_M = x[23:17], z najstarszych bitów
x_L obliczenia

*/ 


typedef ac_fixed<24, 1, false> fix123;  //unsigned, 1b całkowity

// y(x) = a*x^2 + b*x + c,  Δ < 5.25e-6
// |f(x)-y(x)|<= 5.25*10^-6
// u1.23
// zmienić z double na ac_fixed

// double funkcjaKwadratowa(double x, double a, double b, double c)
// {
//     return a * x * x + b * x + c;
// }

fix123 funkcjaKwadratowa(fix123 x, fix123 a, fix123 b, fix123 c)
{
    return a * x * x + b * x + c;
}

int main()
{
    // const double a = -0.735294; 
    // const double b = 1.267401;
    // const double c = -0.159155;
    fix123 a = -0.735294;
    fix123 b = 1.267401;
    fix123 c = -0.159155;


    double x;   //unsigned, 24 bity
    fix123 x_fix;

    std::cout << "Wpisz wartość x w przedziale [0, 2)): ";
    std::cin >> x;

    if(x < 0.0 || x >= 2.0){
        std::cerr << "Nie mieści się w przedziale [0, 2)!\n";
        return -1;
    }

    if (DBG_wejscie)
        std::cout << "Podano x = " << x << std::endl;

    // double y = funkcjaKwadratowa(x, a, b, c);
    // std::cout << std::fixed << std::setprecision(8);
    // std::cout << "y(x) = \n" << y << std::endl;

    unsigned int x2 = x_fix.slc<24>(0); //na całkowitą, żeby mieć na binarnie
    unsigned int M = (x2 >> 17) & 0x7F; //"0111111";
    unsigned int L = x2 & 0x1FFFF;  //"0111111";

    std::cout << "\n x2:" << x2 << std::endl;
    std::cout << "\n M: " << M << std::endl;
    std::cout << "\n L: " << L << std::endl;

    std::bitset<7> x2_bits(x2);
    std::bitset<7> M_bits(M);
    std::bitset<7> L_bits(L);

    std::cout << "\n Binarnie x2: " << x2_bits << std::endl;
    std::cout << "\n Binarnie M: " << M_bits << std::endl;
    std::cout << "\n Binarnie L: " << L_bits << std::endl;

    fix123 y = funkcjaKwadratowa(x, a, b, c);

    if (DBG_coeff)
        std::cout << "\n a =" << a << ",\n b =" << b << ",\n c = " << c << std::endl ; 

    if (DBG_wynik)
            std::cout << std::fixed << std::setprecision(23)<< "\n y= "<< y << std :: endl ;


    std::cout << std::fixed << std::setprecision(23);
    std::cout << "\n y(x) =" << y << std::endl;
    std::ofstream out("wynik.txt");
    out << std::fixed << std::setprecision(23)<<y<<std::endl;

    return 0;
}
