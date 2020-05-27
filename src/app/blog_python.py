import os
import pymysql 
import getpass
import datetime

class bazaDanych():
    def __init__(self, host, uzytkownik, haslo, baza):
        self.polaczenie = pymysql.connect(host, uzytkownik, haslo, baza)
        self.kursor = self.polaczenie.cursor()

    def rejestracja(self):
        mail = input('--> Podaj mail : ')
        imie = input('--> Podaj imie : ')
        nazw = input('--> Podaj Nazwisko : ')
        while 1:
            login = input('--> Podaj login: ')
            self.kursor.execute('SELECT login FROM uzytkownik')
            loginy = self.kursor.fetchall()

            powtorzony = False
            for log in loginy:
                if log[0] == login:
                    powtorzony=True

            if powtorzony == False:
                break
            else :
                print('Istnieje juz taki login podaj inny...')
                continue

        while 1:
            haslo1 = getpass.getpass('--> Podaj haslo : ')
            haslo2 = getpass.getpass('--> Potwierdz haslo : ')
            if haslo1 == haslo2:
                print('Hasla sie zgadzaja !')
                break
            else:
                print('Hasla sie nie zgadzaja, powtorz proces')
                continue
        data = datetime.date.today()
        sql_query = '''INSERT INTO `uzytkownik` (`Login`, `Mail`, `Haslo`, `Data_utworzenia_konta`) VALUES(%s, %s, %s, %s)'''
        argumentyTuple = (login,mail,haslo1,data)
        self.kursor.execute(sql_query,argumentyTuple)
        
        sql_query = '''INSERT INTO `profil` (`Login`,`Imie`,`Nazwisko`) VALUES(%s, %s, %s)'''
        argumentyTuple = (login, imie, nazw)
        self.kursor.execute(sql_query,argumentyTuple)
        self.polaczenie.commit()
        
        print('Konto {} zostalo utworzone \n'.format(login))
        

        
        
    # def pokazKategorie(self):
    #     self.kursor.execute('SELECT * FROM kategoria')
    #     dane = self.kursor.fetchall()
    #     for kat in dane:
    #         print('ID: {} , nazwa kategorii : {}'.format(kat[0],kat[1]))
            




bd = bazaDanych('localhost','karina','haslo','blog2')

if __name__ == '__main__':
    while True:
        print('WYBIERZ:\n 1.Katalog \n 2.Zaloguj \n 3.Zarejestruj \n 4.Zakoncz')
        podany = input()
        if podany == '1':
            pass
        elif podany == '2':
            pass
        elif podany == '3':
            bd.rejestracja()
        elif podany == '4':
            print('Koniec')
            break
        else:
            print('Zla wartosc')
            continue

