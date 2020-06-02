/* 1.	Przeszukiwanie postu w podkategorii fauna. Dodatkowo użytkownik życzy sobie posortować wyniki wyszukiwania po liczbie polubieni. */
	SELECT * 
	FROM post JOIN kategoria_postu 
		  ON ID_post=PostID_post 
	ORDER BY Liczba_polubien DESC;

/* 2.	Przeszukiwanie użytkowników względem liczby napisanych postów posortowanych malejąco. */
	SELECT count(*) as ilosc_postow, login, mail 
	FROM `post` JOIN uzytkownik 
		    ON Autor = Login 
	GROUP BY Login 
	ORDER BY ilosc_postow DESC;

/* 3.	Wyświetlenie wszystkich profili osób pochodzących z Krakowa. */
	SELECT * 
	FROM `profil` 
	WHERE Lokalizacja = 'Krakow';

/* 4.	Wyświetlenie komentarzy dla postu z największą liczbą nielubień. */
	SELECT * 
	FROM `post` JOIN komentarz 
		    ON PostId_post = ID_post 
	WHERE Liczba_nielubien = (SELECT max(Liczba_nielubien) FROM `post`);

/* 5.	Posortowanie podkategorii postu względem ilości wstawionych postów. */
	SELECT count(*),Nazwa_podkategorii 
	FROM `podkategoria` LEFT JOIN `kategoria_postu` 
		 	    ON ID_podkategoria = PodkategoriaID_podkategoria  
			    JOIN post ON PostId_post = ID_post 
	GROUP BY Nazwa_podkategorii;

/* 6.	Wyświetlenie wszystkich postów w podkategorii nauki scicsle (albo innej) względem daty dodania. */
	SELECT * 
	FROM post JOIN kategoria_postu 
		  ON ID_post=PostID_post 
	WHERE PodkategoriaID_podkategoria = 171;

/* 7.	Wyświetlenie postów użytkownika Jan Kowalski. */
	SELECT * FROM post JOIN profil 
			   ON Autor=Login 
	WHERE imie="Jan" && nazwisko="Kowalski";

/* 8.	Wyświetlenie komentarzy napisanych przez Jana Kowalskiego. */
	SELECT * 
	FROM komentarz JOIN profil 
			ON Autor_komentarza=Login 
	WHERE imie="Jan" && nazwisko="Kowalski";
	
/* 9.  Wyświetlenie preferowanej kategorii użytkownika o loginie jankowalski. */
	SELECT ID_preferencje_uzytkownika,Wybrana_kategoria 
	FROM preferencje_uzytkownika 
	WHERE Wlasciciel='jankowalski';
	
/* 10. Wyświetlenie profilu osoby o loginie mkoperek. */
	SELECT * 
	FROM profil 
	WHERE Login='mkoperek';
	
/* 11. Aktualizowanie profilu zalogowanego uzytkownika zbigniewduda */
	UPDATE profil 
	SET Zainteresowania='Sport na swiezym powietrzu', Cele='Poprzedni cel zdobyty, kolejny to zdobyc Mount Everest', Opis='Pozytywnie zakrecony', Lokalizacja='Olsztyn' 
	WHERE Login='zbigniewduda';
	
/* 12. Wyswietlenie danych zalgownego uzytkownika nowakanna. */
	SELECT Login,Mail,Data_utworzenia_konta F
	ROM uzytkownik 
	WHERE Login='nowakanna';
	
/* 13.  Uzytkownik ma mozliwosc zarejestrowania sie. */
	INSERT INTO `uzytkownik` (`Login`, `Mail`, `Haslo`, `Data_utworzenia_konta`) 
	VALUES('Karen2035', 'dyrda.karina@gmail.com', 'eloelo320', '2020-06-02');

/* 14. Uzytkownik ma mozliwosc wyswietlenia wszystkich istniejacych kategorii wedlug nazwy kategorii w odroconej kolejnosci alfabetycznej. */
	SELECT Nazwa_kategorii 
	FROM kategoria
	ORDER BY Nazwa_kategorii DESC;

/* 15. 	Uzytkownik ma mozliwosc wyswietlenia wszystkich istniejacych podkategorii dla wybranej kategorii (np. dla ktegorii moda). */
	SELECT ID_podkategoria,Nazwa_podkategorii 
	FROM podkategoria 
	WHERE Kategoria_glowna='Moda';
	
/* 16. Uzytkownik ma mozliowsc wyswietlania wszystkich napisanych postow posortowanych alfabetycznie wedlug loginu Autora. */
	SELECT ID_post,Autor,Tytul,Data_dodania,Data_ostatniej_modyfikacji,Tresc, Liczba_polubien,Liczba_nielubien 
	FROM post 
	ORDER BY Autor;
	
/* 17.  Uzytkownik ma mozliwosc wstawienia swojego wlasnego posta. */
	INSERT INTO post(Tytul,Data_dodania,Data_ostatniej_modyfikacji,Tresc,Autor)
	VALUES('Moj pierwszy post', '2020-06-02', '2020-06-02', 'Witam witam', 'mkoperek');
	
/* 18. Uzytkownik moze stworzyc profil zwiazany ze swoim kontem. */
	INSERT INTO `profil` (`Login`,`Imie`,`Nazwisko`,`Urodziny`,`Plec`) 
	VALUES('Karen2035', 'Karina', 'Dyrda', '1999-02-01', 'Kobieta');
