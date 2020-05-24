// Blog.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>			
#include <string>
#include <windows.h>
#include <winbase.h>
#include <cstdlib>
#include <limits>
#include<mysql.h>
#include <sstream>
#include<stdio.h>
#include <string>

using namespace std;

int zalogowany_ID;


///////////////////////////////////////////////MOJE FUNKCJE OD OBSLUGI SQL////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////FUNKCJE/////////////////////////////////////////////////////////////////////


void katalog(bool log)
{
	char nr=0;
	while (nr != 'z')
	{
		cout << "\tMENU" << endl;
		cout << "-----------------------------" << endl;
		cout << "1. Wyswietl kategorie " << endl;
		cout << "2. Wyswietl profil" << endl;
		if (log == 1)
		{
			cout << "3. Wybrane dla ciebie" << endl;
			cout << "4. Wyswietl swoje dane" << endl;
			cout << "5. Edytuj swoj profil" << endl;
			cout << "6. Wyswietl swoje komentarze" << endl;
			cout << "7. Wyswietl swoje posty" << endl;
			cout << "8. Dodaj post" << endl;
			cout << "9. Wyloguj" << endl;
		}
		cout << "z. Zakoncz" << endl;
		cout << "-----------------------------" << endl;
		cout << "Wybor: ";
		cin >> nr;
		system("cls");

		switch (nr)
		{
		case 1:			//wyswietl kategorie
		{
			int w = 0;
			while (w != 5)
			{
				int post_ID;
				post_ID = wyswietl_kategorie();
				cout << "\tMENU" << endl;
				cout << "-----------------------------" << endl;
				cout << "1. Lubie to! " << endl;
				cout << "2. Nie lubie tego" << endl;
				cout << "3. Wyswietl komentarze" << endl;
				cout << "4. Przegladaj dalej " << endl;
				cout << "5. Powrot " << endl;
				cout << "-----------------------------" << endl;
				cout << "Wybor: ";
				cin >> w;

				if (w == 1)								//like
					polubienie(post_ID);

				if (w == 2)								//dislike
					nielubienie(post_ID);

				if (w == 3)								//komentarze
				{
					int w1 = 0;
					while (w1 != 1)
					{
						wyswietl_komentarze(post_ID, 1);
						cout << endl << endl << "1. Zakoncz przegladanie " << endl;
						cout << "2. Dodaj komentarz " << endl;
						cout << "Wybor: ";
						cin >> w1;
						system("cls");
						if (w1 == 2)
							dodaj_komentarz();
					}
				}
				}//4 = powrot wyzej (wyswietlenie kategorii)
				break;
			}

		case 2:			//wyszukaj post
		{
			int w = 0;
			while (w != 1)
			{
				string imie, nazwisko;
				cout << "Wpisz imie: ";
				cin >> imie;
				cout << "Wpisz nazwisko: ";
				cin >> nazwisko;

				int ID, odp;
				ID = znajdz_profil(imie, nazwisko);
				wyswietl_profil(ID);
				cout << endl << endl << "Czy chcesz wyswietlic posty uzytkownika " << imie << " " << nazwisko << " ?" << endl;
				cout << "1. Tak" << endl;
				cout << "2. Nie" << endl;
				cin >> odp;
				if (odp == 1)
				{
					int k;
					wyswietl_posty(ID);
					cout << endl << endl << "1. Zakoncz przegladanie";
					cin >> k;
				}
				cout << "1. Zakoncz wyszukiwanie";
				cout << "2. Wyszukaj jeszcze raz";
				cin >> w;
			}


			Sleep(500);
			break;
		}

		case 3:			//wybrane dla ciebie
		{
			int w = 0;
			while (w != 1)
			{
				wybrane_dla_ciebie(zalogowany_ID);
				cout << endl << endl << "1. Zakoncz przegladanie";
				cin >> w;
			}

			break;
		}

		case 4:			//wyswietl swoje dane
		{
			int w = 0;
			while (w != 1)
			{
				wyswietl_dane(zalogowany_ID);
				cout << endl << endl << "1. Zakoncz przegladanie";
				cin >> w;
			}
			break;
		}

		case 5:			//edytuj swoj profil
		{
			int w = 0;
			while (w != 1)
			{
				wyswietl_profil(zalogowany_ID);
				Sleep(1000);
				edytuj_profil(zalogowany_ID);
				cout << endl << endl << "1. Zakoncz edytowanie";
				cin >> w;
			}
			break;
		}

		case 6:			//wyswietl swoje komentarze
		{
			int w = 0;
			while (w != 1)
			{
				wyswietl_komentarze(zalogowany_ID, 2);
				cout << endl << endl << "1. Zakoncz przegladanie";
				cin >> w;
			}
			break;
		}

		case 7:			//wyswietl swoje posty
		{
			int w = 0;
			while (w != 1)
			{
				wyswietl_posty(zalogowany_ID);
				cout << endl << endl << "1. Zakoncz przegladanie";
				cin >> w;
			}
			break;
		}

		case 8:			//dodaj post
		{
			int w = 0;
			while (w != 1)
			{
				dodaj_post(zalogowany_ID);
				cout << endl << endl << "1. Zakoncz ";
				cin >> w;
			}
			break;
		}

		case 9:			//wyloguj
		{
			system("cls");
			cout << "\t" << "WYLOGOWANO";	
			Sleep(1000);
			system("cls");
			break;
		}
		}
	}
}


///////////////////////////////////////////////////////////////////MAIN////////////////////////////////////////////////////////////////


int main()
{
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 3);
	cout << "\t" << "BLOG";			
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 15);
	Sleep(1000);
	system("cls");
	int w1 = 0;
	while (w1 != 5)
	{
		cout << "WYBIERZ:" << endl;
		cout << "------------------" << endl;
		cout << "1. Katalog " << endl;
		cout << "2. Zaloguj" << endl;
		cout << "3. Zarejestruj" << endl;
		cout << "4. Zamknij" << endl;
		cout << "------------------" << endl;
		cout << "Wybor: ";
		cin >> w1;
		system("cls");
		switch (w1)
		{
		case 1:
		{
			katalog(0);
			break;
		}

		case 2:
		{
			zalogowany_ID=logowanie();
			katalog(1);
			break;
		}

		case 3:
		{
			zarejestruj();
			int w2 = 0;
			cout << "WYBIERZ:" << endl;
			cout << "------------------" << endl;
			cout << "1. Zaloguj " << endl;
			cout << "2. Pomin" << endl;
			cout << "------------------" << endl;
			cout << "Wybor: ";
			cin >> w2;
			system("cls");
			if (w2 == 1)
			{
				zalogowany_ID=logowanie();
				katalog(1);
			}
			else
				katalog(0);

			break;
		}
		case 4:
		{
			return 0;
		}
		}	
	}
}