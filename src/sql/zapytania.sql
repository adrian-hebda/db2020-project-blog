1.	Przeszukiwanie postu w podkategorii fauna. Dodatkowo użytkownik życzy sobie posortować wyniki wyszukiwania po liczbie polubieni.

	SELECT * 
	FROM post JOIN kategoria_postu 
		  ON ID_post=PostID_post 
	ORDER BY Liczba_polubien DESC;

2.	Przeszukiwanie użytkowników względem liczby napisanych postów posortowanych malejąco.

	SELECT count(*) as ilosc_postow, login, mail 
	FROM `post` JOIN uzytkownik 
		    ON UzytkownikID_uzytkownik = ID_Uzytkownik 
	GROUP BY ID_uzytkownik 
	ORDER BY ilosc_postow DESC

3.	Wyświetlenie wszystkich profili osób pochodzących z Krakowa.

	SELECT * 
	FROM profil 
	WHERE Lokalizacja="Krakow"

4.	Wyświetlenie komentarzy dla postu z największą liczbą nielubień.

	SELECT * 
	FROM `post` JOIN komentarz 
		    ON PostId_post = ID_post 
	WHERE Liczba_nielubien = (SELECT max(Liczba_nielubien) FROM `post`)

5.	Posortowanie podkategorii postu względem ilości wstawionych postów.

	SELECT count(*),Nazwa_podkategorii 
	FROM `podkategoria` LEFT JOIN `kategoria_postu` 
		 	    ON ID_podkategoria = PodkategoriaID_podkategoria  
			    JOIN post ON PostId_post = ID_post 
	GROUP BY Nazwa_podkategorii

6.	Wyświetlenie wszystkich postów w podkategorii ogólne (albo innej) względem daty dodania.

	SELECT * 
	FROM post JOIN kategoria_postu 
		  ON ID_post=PostID_post 
	WHERE PodkategoriaID_podkategoria = 62

7.	Wyświetlenie postów użytkownika Jan Kowalski.

	SELECT * FROM post JOIN profil 
			   ON UzytkownikID_uzytkownik=ID_profil 
	WHERE imie="Jan" && nazwisko="Kowalski"

8.	Wyświetlenie komentarzy napisanych przez Jana Kowalskiego.

	SELECT * 
	FROM komentarz JOIN profil 
			ON UzytkownikID_uzytkownik=ID_profil 
	WHERE imie="Jan" && nazwisko="Kowalski"
