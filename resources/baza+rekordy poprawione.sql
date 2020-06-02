-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Maj 2020, 12:57
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `blog2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `Nazwa_kategorii` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kategoria`
--

INSERT INTO `kategoria` (`Nazwa_kategorii`) VALUES
('DIY'),
('Dom'),
('Filmy'),
('Inne'),
('Ksiazki'),
('Kulinaria'),
('Moda'),
('Natura'),
('Nauka'),
('Podroze'),
('Praca'),
('Rodzina'),
('Sport'),
('Uroda'),
('Zdrowie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria_postu`
--

CREATE TABLE `kategoria_postu` (
  `ID_kategoria_postu` int(11) NOT NULL,
  `PostID_post` int(11) NOT NULL,
  `PodkategoriaID_podkategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kategoria_postu`
--

INSERT INTO `kategoria_postu` (`ID_kategoria_postu`, `PostID_post`, `PodkategoriaID_podkategoria`) VALUES
(7, 6, 130),
(6, 7, 181),
(8, 8, 197),
(9, 9, 169),
(10, 10, 171),
(11, 11, 171);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarz`
--

CREATE TABLE `komentarz` (
  `ID_komentarz` int(11) NOT NULL,
  `Data_dodania` date NOT NULL,
  `Tresc_komentarza` text NOT NULL,
  `PostID_post` int(11) NOT NULL,
  `Autor_komentarza` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `komentarz`
--

INSERT INTO `komentarz` (`ID_komentarz`, `Data_dodania`, `Tresc_komentarza`, `PostID_post`, `Autor_komentarza`) VALUES
(5, '2020-05-17', 'Wow! W takim razie bazy musza byc super!', 10, 'nowakanna'),
(6, '2020-05-18', 'Tak, sa swietne <3', 10, 'jankowalski'),
(7, '2020-05-18', 'Slicznie sukienki! ', 6, 'mkoperek'),
(8, '2020-05-19', 'Musze kupic taka sukienke dla zony!', 6, 'zbigniewduda'),
(9, '2020-05-27', 'Moj kot tez uwielbia te karme :)', 9, 'nowakanna'),
(10, '2020-05-28', 'Moj puszek innej nie chce nawet sprobowac', 9, 'mkoperek'),
(11, '2020-05-20', 'Tez lubie cwiczyc  domu', 8, 'jankowalski'),
(12, '2020-05-21', 'Wszedzie dobrze, ale w domu najlepiej :)', 8, 'zbigniewduda'),
(13, '2020-05-22', 'Swietny post, moze sam sprobuje kiedys MySQL', 11, 'zbigniewduda'),
(14, '2020-05-22', 'Piekne miejsce! Musze sie tam wybrac', 7, 'jankowalski'),
(15, '2020-05-23', 'Koniecznie! Niepowtarzalne przezycia.', 7, 'nowakanna');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podkategoria`
--

CREATE TABLE `podkategoria` (
  `ID_podkategoria` int(11) NOT NULL,
  `Nazwa_podkategorii` text NOT NULL,
  `Kategoria_glowna` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `podkategoria`
--

INSERT INTO `podkategoria` (`ID_podkategoria`, `Nazwa_podkategorii`, `Kategoria_glowna`) VALUES
(129, 'Wiosna', 'Moda'),
(130, 'Lato', 'Moda'),
(131, 'Jesien', 'Moda'),
(132, 'Zima', 'Moda'),
(133, 'Latwe', 'DIY'),
(134, 'Średnie', 'DIY'),
(135, 'Trudne', 'DIY'),
(136, 'Ogrod', 'Dom'),
(137, 'Biuro', 'Dom'),
(138, 'Salon', 'Dom'),
(139, 'Sypialnia', 'Dom'),
(140, 'Lazienka', 'Dom'),
(141, 'Kuchnia', 'Dom'),
(142, 'Komedia', 'Filmy'),
(143, 'Dramat', 'Filmy'),
(144, 'Thriller', 'Filmy'),
(145, 'Fanatsy', 'Filmy'),
(146, 'Kryminal', 'Filmy'),
(147, 'Science fiction', 'Filmy'),
(148, 'Dokument', 'Filmy'),
(149, 'Reportaz', 'Filmy'),
(150, 'Horror', 'Filmy'),
(151, 'Bajka', 'Filmy'),
(152, 'Ogolne', 'Inne'),
(153, 'Basnie', 'Ksiazki'),
(154, 'Poradniki', 'Ksiazki'),
(155, 'Psychologiczne', 'Ksiazki'),
(156, 'Obyczajowe', 'Ksiazki'),
(157, 'Kryminalne', 'Ksiazki'),
(158, 'Romans', 'Ksiazki'),
(159, 'Sensacja', 'Ksiazki'),
(160, 'Fantastyczne', 'Ksiazki'),
(161, 'Horror', 'Ksiazki'),
(162, 'Mlodziezowe', 'Ksiazki'),
(163, 'Sniadanie', 'Kulinaria'),
(164, 'Obiad', 'Kulinaria'),
(165, 'Kolacja', 'Kulinaria'),
(166, 'Deser', 'Kulinaria'),
(167, 'Przekaski', 'Kulinaria'),
(168, 'Napoje', 'Kulinaria'),
(169, 'Fauna', 'Natura'),
(170, 'Flora', 'Natura'),
(171, 'Nauki scisle', 'Nauka'),
(172, 'Nauki humanistyczne', 'Nauka'),
(173, 'Azja', 'Podroze'),
(174, 'Europa', 'Podroze'),
(175, 'Afryka', 'Podroze'),
(176, 'Australia', 'Podroze'),
(177, 'Ameryka Polnocna', 'Podroze'),
(178, 'Ameryka Poludniowa', 'Podroze'),
(179, 'Antarktyda', 'Podroze'),
(180, 'Inne', 'Podroze'),
(181, 'Krajowe', 'Podroze'),
(182, 'Rozmowa rekrutacyjna', 'Praca'),
(183, 'Porady i wskazowki', 'Praca'),
(184, 'Home office', 'Praca'),
(185, 'Rodzicielstwo', 'Rodzina'),
(186, 'Dzieci', 'Rodzina'),
(187, 'Mlodziez', 'Rodzina'),
(188, 'Zimowe', 'Sport'),
(189, 'Letnie', 'Sport'),
(190, 'Wlosy', 'Uroda'),
(191, 'Paznokcie', 'Uroda'),
(192, 'Twarz', 'Uroda'),
(193, 'Cialo', 'Uroda'),
(194, 'Makijaz', 'Uroda'),
(195, 'Wskazowki i porady', 'Zdrowie'),
(196, 'Problemy zdrowotne', 'Zdrowie'),
(197, 'Aktywnosc fizyczna', 'Zdrowie'),
(198, 'Seniorzy', 'Zdrowie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `ID_post` int(11) NOT NULL,
  `Tytul` text NOT NULL,
  `Data_dodania` date NOT NULL,
  `Data_ostatniej_modyfikacji` date DEFAULT NULL,
  `Tresc` text DEFAULT NULL,
  `Liczba_polubien` int(11) DEFAULT NULL,
  `Liczba_nielubien` int(11) DEFAULT NULL,
  `Autor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`ID_post`, `Tytul`, `Data_dodania`, `Data_ostatniej_modyfikacji`, `Tresc`, `Liczba_polubien`, `Liczba_nielubien`, `Autor`) VALUES
(6, 'MODNE SUKIENKI HISZPANKI – ZAKOCHASZ SIĘ W NICH!', '2020-05-16', '2020-05-16', 'Sukienki w stylu hiszpańskim co roku cieszą się ogromnym powodzeniem. Dziewczyny uwielbiają ten fason, a faceci wprost nie mogą oderwać oczu od kobiet ubranych w taką sukienkę. Są bardzo kobiece i pasują praktycznie na każdą okazję. Dostępne w różnych kolorach i wzorach, wykonane z różnych tkanin. To doskonała propozycja dla każdego typu sylwetki.', 8, 1, 'nowakanna'),
(7, 'Objazdówka wczesnoporanna', '2020-05-22', '2020-05-24', 'Wymyśliłam sobie,że w sobotę wstanę wcześnie i pojadę w teren.Tak też zrobiłam,zapowiadało się słonecznie,bułki i picie spakowane,aparat i lornetka wzięta to ruszyłam.Po drodze przystanki na foty ptaków i tak jako pierwsze załapały się pokląskwy.', 12, 3, 'nowakanna'),
(8, 'Trening w domu w dobie koronawirusa. Joga dla początkujących', '2020-05-18', '2020-05-19', 'Tak naprawdę do sesji jogi w domowym zaciszu nie potrzebujecie drogiego, specjalistycznego sprzętu. Wystarczą chęci, niewielka, uporządkowana przestrzeń i mata do jogi, która zapewnia stabilne podłoże do wykonywania wszystkich ćwiczeń, a także amortyzuje punkty podparcia. Niezbędne mogą okazać się specjalne kostki do pozycji siedzących i leżących lub bawełniane taśmy do ćwiczeń rozciągających.', 13, 4, 'zbigniewduda'),
(9, 'WINSTON: KOCIE KARMY W ROSSMANIE', '2020-05-26', '2020-05-26', 'Ciężko znaleźć kogoś kto nie zna drogeri kosmetycznej Rossman. Bogaty asortyment i liczne promocje przyciagają większość Polaków. W jednym miejscu kupimy produkty pielęgnacyjne, akcesoria do sprzatania i gadżety do domu. Sklep oferuje również marki własne. W Rossmanie znajdziemy także dział dla zwierzat.', 4, 2, 'mkoperek'),
(10, 'Dlaczego warto zostać programistą baz danych', '2020-05-11', '2020-05-17', 'Jednym z często zadawanych pytań w kontekście nauki programowania jest kierunek ich rozwoju i trendy obecnych technologii. Zanim zaczniemy się czegokolwiek uczyć i poświęcimy na to swój cenny czas, pieniądze i zaangażowanie, chcemy wiedzieć, z jakich ofert dostępnych na rynku będziemy mogli wybierać. Na tej podstawie oceniamy, czy włożony wysiłek będzie opłacalny, czy może lepiej zdecydować się na inną opcję kierowania własną karierą. W tym artykule chciałbym podważyć sens przesadnego analizowania trendów technologii oraz zwrócić uwagę na korzyści płynące z umiejętności programowania baz danych.', 15, 0, 'jankowalski'),
(11, 'Co należy wiedzieć o MySQL? ', '2020-05-20', '2020-05-20', 'MySQL to najpopularniejsza aplikacja bazodanowa typu open source. Doskonale nadaje sie do wspolpracy z wieloma popularnymi jezykami programowania. Czesto wykorzystuje sie ja do budowania dynamicznych stron internetowych w polaczeniu z jezykami server-side (np. PHP).', 18, 2, 'jankowalski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `preferencje_uzytkownika`
--

CREATE TABLE `preferencje_uzytkownika` (
  `ID_preferencje_uzytkownika` int(11) NOT NULL,
  `Wybrana_kategoria` varchar(30) NOT NULL,
  `Wlasciciel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `preferencje_uzytkownika`
--

INSERT INTO `preferencje_uzytkownika` (`ID_preferencje_uzytkownika`, `Wybrana_kategoria`, `Wlasciciel`) VALUES
(5, 'Podroze', 'nowakanna'),
(6, 'Nauka', 'jankowalski'),
(7, 'Moda', 'nowakanna'),
(8, 'Natura', 'mkoperek'),
(9, 'Dom', 'mkoperek'),
(10, 'Sport', 'zbigniewduda'),
(11, 'Zdrowie', 'zbigniewduda');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `profil`
--

CREATE TABLE `profil` (
  `Login` varchar(20) NOT NULL UNIQUE,
  `Zainteresowania` text DEFAULT NULL,
  `Cele` text DEFAULT NULL,
  `Plec` text DEFAULT NULL,
  `Opis` text DEFAULT NULL,
  `Lokalizacja` text DEFAULT NULL,
  `Urodziny` date DEFAULT NULL,
  `Imie` text NOT NULL,
  `Nazwisko` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `profil`
--

INSERT INTO `profil` (`Login`, `Zainteresowania`, `Cele`, `Plec`, `Opis`, `Lokalizacja`, `Urodziny`, `Imie`, `Nazwisko`) VALUES
('jankowalski', 'Informatyka, Przyroda', 'Przezyc', 'Mezczyzna', 'Hej, z tej strony Jan Kowalski. Jestem informatykiem. ', 'Krakow', '1980-01-01', 'Jan', 'Kowalski'),
('mkoperek', 'Dom, zwierzeta, a szczegolnie koty', 'Zalozyc schronisko dla kotow', 'Kobieta', 'Lubie slodkie kotki, a ty?', 'Wroclaw', '1982-11-10', 'Magdalena', 'Koperek'),
('nowakanna', 'Podroze', 'Zwiedzic caly swiat', 'Kobieta', 'Tu Anna Nowak, chetnie porozmawiam o moich wycieczkach. ', 'Gdansk', '1991-07-18', 'Anna', 'Nowak'),
('zbigniewduda', 'Sport, zdrowie', 'Wygrac maraton', 'Mezczyzna', 'Witam na moim profilu.', 'Warszawa', '1975-03-28', 'Zbigniew', 'Duda');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `Login` varchar(20) NOT NULL UNIQUE,
  `Mail` text NOT NULL,
  `Haslo` text NOT NULL,
  `Data_utworzenia_konta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`Login`, `Mail`, `Haslo`, `Data_utworzenia_konta`) VALUES
('jankowalski', 'jkowalski@gmail.com', 'Zaq12wsx', '2020-01-30'),
('mkoperek', 'koperek@interia.pl', 'Puszek123', '2020-03-26'),
('nowakanna', 'nowak_anna@gmail.com', 'Podrozniczka2137', '2020-02-28'),
('zbigniewduda', 'zbigniewduda@wp.pl', 'zbigniewduda', '2020-03-15');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`Nazwa_kategorii`);

--
-- Indeksy dla tabeli `kategoria_postu`
--
ALTER TABLE `kategoria_postu`
  ADD PRIMARY KEY (`ID_kategoria_postu`),
  ADD KEY `PostID_post` (`PostID_post`,`PodkategoriaID_podkategoria`),
  ADD KEY `PodkategoriaID_podkategoria` (`PodkategoriaID_podkategoria`);

--
-- Indeksy dla tabeli `komentarz`
--
ALTER TABLE `komentarz`
  ADD PRIMARY KEY (`ID_komentarz`),
  ADD KEY `Autor_komentarza` (`Autor_komentarza`),
  ADD KEY `PostID_post` (`PostID_post`);

--
-- Indeksy dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  ADD PRIMARY KEY (`ID_podkategoria`),
  ADD KEY `Kategoria_glowna` (`Kategoria_glowna`);

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ID_post`),
  ADD KEY `Autor` (`Autor`);

--
-- Indeksy dla tabeli `preferencje_uzytkownika`
--
ALTER TABLE `preferencje_uzytkownika`
  ADD PRIMARY KEY (`ID_preferencje_uzytkownika`),
  ADD KEY `Wybrana_kategoria` (`Wybrana_kategoria`),
  ADD KEY `Wlasciciel` (`Wlasciciel`);

--
-- Indeksy dla tabeli `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`Login`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`Login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kategoria_postu`
--
ALTER TABLE `kategoria_postu`
  MODIFY `ID_kategoria_postu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `komentarz`
--
ALTER TABLE `komentarz`
  MODIFY `ID_komentarz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  MODIFY `ID_podkategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `ID_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `preferencje_uzytkownika`
--
ALTER TABLE `preferencje_uzytkownika`
  MODIFY `ID_preferencje_uzytkownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `kategoria_postu`
--
ALTER TABLE `kategoria_postu`
  ADD CONSTRAINT `kategoria_postu_ibfk_1` FOREIGN KEY (`PostID_post`) REFERENCES `post` (`ID_post`),
  ADD CONSTRAINT `kategoria_postu_ibfk_2` FOREIGN KEY (`PodkategoriaID_podkategoria`) REFERENCES `podkategoria` (`ID_podkategoria`);

--
-- Ograniczenia dla tabeli `komentarz`
--
ALTER TABLE `komentarz`
  ADD CONSTRAINT `komentarz_ibfk_1` FOREIGN KEY (`Autor_komentarza`) REFERENCES `uzytkownik` (`Login`),
  ADD CONSTRAINT `komentarz_ibfk_2` FOREIGN KEY (`PostID_post`) REFERENCES `post` (`ID_post`);

--
-- Ograniczenia dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  ADD CONSTRAINT `podkategoria_ibfk_1` FOREIGN KEY (`Kategoria_glowna`) REFERENCES `kategoria` (`Nazwa_kategorii`);

--
-- Ograniczenia dla tabeli `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`Autor`) REFERENCES `uzytkownik` (`Login`);

--
-- Ograniczenia dla tabeli `preferencje_uzytkownika`
--
ALTER TABLE `preferencje_uzytkownika`
  ADD CONSTRAINT `preferencje_uzytkownika_ibfk_1` FOREIGN KEY (`Wlasciciel`) REFERENCES `profil` (`Login`),
  ADD CONSTRAINT `preferencje_uzytkownika_ibfk_2` FOREIGN KEY (`Wybrana_kategoria`) REFERENCES `kategoria` (`Nazwa_kategorii`);

--
-- Ograniczenia dla tabeli `profil`
--
ALTER TABLE `profil`
  ADD CONSTRAINT `profil_ibfk_1` FOREIGN KEY (`Login`) REFERENCES `uzytkownik` (`Login`);
  
--
-- Ograniczenia dla tabeli `uzytkownik`
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
