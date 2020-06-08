import os
import pymysql 
import getpass
import datetime


class Log():
    def __init__(self):
        self.__zalogowany = False
        self.login = None
        self.imie = None
        self.nazwisko = None
    
    def zaloguj(self,login,imie,nazwisko):
        self.__zalogowany = True
        self.login = login
        self.imie = imie
        self.nazwisko = nazwisko
        pass

    def zalogowany(self):
        return self.__zalogowany
    
    def wyswietlDane(self):
        print('Zalogowany: {} {}'.format(self.imie,self.nazwisko))


    def wyloguj(self):
        self.__zalogowany = False


    def dodajKomentarz(self,post):
        tresc = input('Podaj tresc komentarza : ')
        #return str('''INSERT INTO komentarz(`Data_dodania`,`Tresc_komentarza`,`PostID_post`,`Autor_komentarza`) VALUES(%(data)s,%(tresc)s,%(post)s,%(log)s)''')
        return str('''INSERT INTO komentarz(`Data_dodania`,`Tresc_komentarza`,`PostID_post`,`Autor_komentarza`) VALUES('{}','{}','{}','{}')'''.format(datetime.date.today(),tresc,post,self.login))


    def polub(self,post):
        return '''UPDATE post SET Liczba_polubien = Liczba_polubien + 1 WHERE ID_post=%s''' % post


    def nielub(self,post):
        return '''UPDATE post SET Liczba_nielubien = Liczba_nielubien + 1 WHERE ID_post=%s''' % post


    def wysywDlaCiebie(self):
        return '''SELECT ID_preferencje_uzytkownika,Wybrana_kategoria FROM preferencje_uzytkownika WHERE Wlasciciel=\'%s\'''' % self.login


    def napiszPost(self):  #zwraca liste dla klasy glownej
        tytul = input('Podaj tytul postu: ')
        data = datetime.date.today()
        dataMod = datetime.date.today()
        tresc = input('Podaj tresc postu: ')

        return ['''INSERT INTO post(Tytul,Data_dodania,Data_ostatniej_modyfikacji,Tresc,Liczba_polubien,Liczba_nielubien,Autor)
VALUES(\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\')''' % (tytul,data,dataMod,tresc,0,0,self.login),(tytul,data,dataMod,tresc,0,0,self.login)]


    def wyswDane(self):
        return '''SELECT Login,Mail,Data_utworzenia_konta FROM uzytkownik WHERE Login=\'%s\' ''' % self.login

    def edycjaProfilu(self):
        return '''SELECT Login,Zainteresowania,Cele,Opis,Lokalizacja FROM profil WHERE Login=\'%s\'''' % self.login


        

class bazaDanych():
    def __init__(self, host, uzytkownik, haslo, baza):
        self.polaczenie = pymysql.connect(host, uzytkownik, haslo, baza)
        self.kursor = self.polaczenie.cursor()
        self.__log = Log()

    def log(self):
        return self.__log


    def rejestracja(self):
        mail = input('*** Podaj mail: ')
        imie = input('*** Podaj imie: ')
        nazw = input('*** Podaj Nazwisko: ')
        print('*** Podaj date urodzenia: ')
        rok = int(input('\tRok: '))
        miesiac = int(input('\tMiesiac: '))
        dzien = int(input('\tDzien: '))
        data = datetime.date(rok,miesiac,dzien)
        plec=input('*** Podaj plec: ')

        while 1:
            login = input('*** Podaj login: ')
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
            haslo1 = getpass.getpass('*** Podaj haslo: ')
            haslo2 = getpass.getpass('*** Potwierdz haslo: ')
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
        
        sql_query = '''INSERT INTO `profil` (`Login`,`Imie`,`Nazwisko`,`Urodziny`,`Plec`) VALUES(%s, %s, %s, %s, %s)'''
        argumentyTuple = (login, imie, nazw,data,plec)
        self.kursor.execute(sql_query,argumentyTuple)
        self.polaczenie.commit()
        
        print('Konto {} zostalo utworzone \n'.format(login))


    def logowanie(self):
        poprawne = False
        while poprawne == False:
            login = input('*** Podaj login: ')
            haslo = getpass.getpass('*** Podaj haslo: ')
            
            self.kursor.execute('SELECT Login, Haslo FROM uzytkownik')
            check = self.kursor.fetchall()
            for i in check:
                if i[0] == login and i[1] == haslo:
                    poprawne = True
                    zapytanie = 'SELECT Imie, Nazwisko FROM profil WHERE Login=%s'
                    self.kursor.execute(zapytanie,login)
                    dane = self.kursor.fetchall() 
                    print('Witaj {} {}\n'.format(dane[0][0],dane[0][1]))
                    self.__log.zaloguj(login,dane[0][0],dane[0][1])
                    break
            if poprawne is False:
                print('Bledne dane logowania sprobuj ponownie...')

    def wyswKategorie(self):
        self.kursor.execute('SELECT Nazwa_kategorii FROM kategoria')
        kategorie = list(self.kursor.fetchall())
        for i,kat in enumerate(kategorie):           
            print('{}. {}'.format(i+1,kat[0])) 
        return kategorie
        

    def wybierzKategorie(self):
        kategorie = self.wyswKategorie()
        while 1:
            a = input('Wybierz kategorie (podaj b by wyjsc): ')
            if a=='b':
                return
            elif int(a) <= len(kategorie) and int(a) > 0:
                self.wybierzPodkategorie(kategorie[int(a)-1][0])
                break
            else:
                print('Blad...')


    def wyswPodkategorie(self,nazwa):
        zapytanie = None
        if nazwa == None:
            zapytanie ='SELECT ID_podkategoria,Nazwa_podkategorii FROM podkategoria'
        else:
            zapytanie = 'SELECT ID_podkategoria,Nazwa_podkategorii FROM podkategoria WHERE Kategoria_glowna=%s'
        self.kursor.execute(zapytanie,nazwa)
        podkategorie = self.kursor.fetchall()
       
        for pod in podkategorie:
            print('{}. {}'.format(pod[0],pod[1]))
        return podkategorie
        
    def wybierzPodkategorie(self,nazwa):
        podkategorie= self.wyswPodkategorie(nazwa)

        while 1:
            a = input('Wybierz podkategorie(podaj b by wyjsc): ')
            if a == 'b':
                return
            blad = True
            for pod in podkategorie:
                if pod[0] == int(a):
                    blad = False
                    self.pokazPostyPodktg(pod[0])
                    break
            if blad:
                print('Blad...')
    
    def kategorieDlaUzytkownika(self):
        if self.log().zalogowany():
            zapytanie = self.log().wysywDlaCiebie()
            self.kursor.execute(zapytanie)
            twoje = self.kursor.fetchall()
            print('Wybrane dla Ciebie: ')
            for twoj in twoje:
                print('\t{}. {}'.format(twoj[0],twoj[1]))
            a=input('1. Wybierz kategorie q. Cofnij\n')
            if a =='1':
                kat = input('Podaj kategorie: ')
                for twoj in twoje:
                    if twoj[0]==int(kat):
                        self.wybierzPodkategorie(twoj[1])
            elif a=='q':
                return
        else:
            print('ERROR')

    def pokazPostyPodktg(self,podktg):
        zapytanie = '''SELECT ID_post,Autor,Tytul,Data_dodania,Data_ostatniej_modyfikacji,Tresc, Liczba_polubien,Liczba_nielubien FROM
post JOIN kategoria_postu ON ID_post=PostID_post WHERE PodkategoriaID_podkategoria=%s'''
        self.kursor.execute(zapytanie,podktg)
        posty = self.kursor.fetchall()
        self.__pokazPosty(posty)

    def pokazWszystkiePosty(self):
        zapytanie = '''SELECT ID_post,Autor,Tytul,Data_dodania,Data_ostatniej_modyfikacji,Tresc, Liczba_polubien,Liczba_nielubien FROM
post'''
        self.kursor.execute(zapytanie)
        posty = self.kursor.fetchall()
        self.__pokazPosty(posty)
    

    def __pokazPosty(self,posty):
        for post in posty:
            print('-'*50)
            print('')
            print(post[1]+'\n')
            print(post[2]+'\n')
            print('Data Dodania: {},  Data Modyfikacji: {} \n'.format(post[3],post[4]))
            print(post[5]+'\n')
            print('Polubienia : {}              Nielubnienia: {} \n -------------------------------------'.format(post[6],post[7]))

            if self.log().zalogowany():            
                while 1:
                    a = input('1.Dodaj komentarz  2.Wyswietl komentarze  3.Polub  4.Niepolub  5.Wyswietl Profil Autora  b. Cofnij  d. Dalej\n')
                    if a =='b':
                        return
                    elif a== 'd':
                        break
                    elif  a =='1':
                        zapytanie = self.log().dodajKomentarz(post[0])
                        self.kursor.execute(zapytanie)
                        self.polaczenie.commit()
                    elif  a =='2':
                        self.wyswKomentarze(post[0])  
                    elif  a =='3':
                        zapytanie = self.log().polub(post[0]) 
                        self.kursor.execute(zapytanie)
                        self.polaczenie.commit()
                        print('Polubiono !')
                    elif  a =='4':
                        zapytanie = self.log().nielub(post[0]) 
                        self.kursor.execute(zapytanie)
                        self.polaczenie.commit()
                        print('Znielubiono!')
                    elif  a =='5':
                        self.wyswProfil(post[1]) 
            else:
                while 1:
                    a = input('1. Wyswietl Komentarze  2. Wyswietl profil autora  b. Cofnij  d. Dalej\n')
                    if a == 'b':
                        return
                    elif  a =='1':
                        self.wyswKomentarze(post[0])
                    elif a=='2':
                        self.wyswProfil(post[1]) 
                    elif a =='d':
                        break

    def wyswProfil(self,login):
        query = 'SELECT * FROM profil WHERE login=%s'
        self.kursor.execute(query,(login))
        profil = self.kursor.fetchone()
        if profil:
            print('-'*50)
            print("Imie i nazwisko: {} {}".format(profil[7],profil[8]))    
            print('Data urodzenia: {}'.format(profil[6]))
            print('Miejscowosc: {}'.format(profil[5]))
            print('Plec: {}'.format(profil[3]))
            print('Cele: {}'.format(profil[2]))
            print('Opis: {}'.format(profil[4]))
            print('Zainteresowania: {}'.format(profil[1]))
            
        else:
            print('Brak informacji o uzytkowniku\n')
        print('-'*50)


    def wyswKomentarze(self,post):
        zapytanie='''SELECT Autor_komentarza,Data_dodania,Tresc_komentarza FROM komentarz WHERE PostID_post=%s'''
        self.kursor.execute(zapytanie,post)
        komentarze=self.kursor.fetchall()
        for kom in komentarze:
            print('*'*25)
            print('Autor:{}           {}'.format(kom[0],kom[1]))
            print('-'*25)
            print(kom[2])
            print('*'*25)

    def dodajPost(self):
        if self.log().zalogowany():
            zapytanie=self.log().napiszPost()
            self.kursor.execute(zapytanie[0])
            self.kursor.execute('SELECT ID_post FROM post WHERE Tytul=%s AND Data_dodania= %s AND Data_ostatniej_modyfikacji=%s AND Tresc =%s AND Liczba_polubien=%s AND Liczba_nielubien=%s AND Autor=%s',zapytanie[1])
            post = self.kursor.fetchone()[0]
            podkategorie = self.wyswPodkategorie(None)
            while 1:
                a = input('Wybierz podkategorie postu: ')
                jest = False
                for pod in podkategorie:
                    if pod[0] ==int(a):

                        jest = True
                if jest:
                    self.__dolaczPodkategoriePostu(post,a)
                    break
                else:
                    print('Nie ma takiej podkategorii')
                    continue
            print('Dodano post !')
            self.polaczenie.commit()
                 
        else:
            print('ERROR')

    def wyswDane(self):
        if self.log().zalogowany():
            print('-'*50)
            zapytanie = self.log().wyswDane()
            self.kursor.execute(zapytanie)
            dane = self.kursor.fetchone()
            #print(dane)
            print('Login: {}'.format(dane[0]))
            print('Mail: {}'.format(dane[1]))
            print('Data utworzenia konta: {}'.format(dane[2]))
            print('-'*50)
        else:
            print('ERROR')


    def __dolaczPodkategoriePostu(self,post,pod):
        self.kursor.execute('INSERT INTO kategoria_postu(PostID_post,PodkategoriaID_podkategoria) VALUES(%s,%s)',(post,pod))

    def close(self):
        self.polaczenie.close()

    def edytujProfil(self):
        if self.log().zalogowany():
            zapytanie = self.log().edycjaProfilu()
            self.kursor.execute(zapytanie)
            profil=list(self.kursor.fetchone())
            while 1:
                a = input('1. Zmien zainteresowania\n2. Zmien opis\n3. Zmien cele\n4. Zmien lokalizacje \ne. Wykonaj\nq.Cofnij\n')
                if a == 'e':
                    break
                elif a =='q':
                    return
                elif a =='1':
                    profil[1] = input(': ')
                elif a =='2':
                    profil[2] = input(': ')
                elif a =='3':
                    profil[3] = input(': ')
                elif a =='4':
                    profil[4] = input(': ')
            
            zapytanie = '''UPDATE profil SET Zainteresowania=%s, Cele=%s, Opis=%s, Lokalizacja=%s WHERE Login=%s'''
            self.kursor.execute(zapytanie,(profil[1],profil[2],profil[3],profil[4],profil[0]))
            self.polaczenie.commit()
        else:
            print('ERROR')

bd = bazaDanych('localhost','karina','haslo','blog')

if __name__ == '__main__':
    while True:
        if bd.log().zalogowany():
            bd.log().wyswietlDane()
            podany = input('''WYBIERZ:\n 1. Wyswietl Kategorie \n 2. Wyswietl Profil \n 3. Wyswietl Wszystkie posty \n 4. Wybrane dla Ciebie \n 5. Dodaj Post \n 6. Wyswietl swoje dane 
 7. Edytuj swoj profil \n 8. Wyloguj\n''')
            if podany == '1':
                bd.wybierzKategorie()
            elif podany == '2':
                login=input('***Podaj nazwe uzytkownika: ')
                bd.wyswProfil(login)
            elif podany == '3':
                bd.pokazWszystkiePosty()
            elif podany == '4':
                bd.kategorieDlaUzytkownika()
            elif podany == '5':
                bd.dodajPost()
            elif podany == '6':
                bd.wyswDane()
            elif podany == '7':
                bd.edytujProfil()
            elif podany == '8':
                bd.log().wyloguj()

        else:
            podany = input('WYBIERZ:\n 1. Wyswietl Kategorie \n 2. Zaloguj \n 3. Zarejestruj \n 4. Zakoncz\n')
            if podany == '1':
                bd.wybierzKategorie()
            elif podany == '2':
                bd.logowanie()
            elif podany == '3':
                bd.rejestracja()
            elif podany == '4':
                bd.close()
                print('Koniec')
                break
            else:
                print('Zla wartosc')
                continue



