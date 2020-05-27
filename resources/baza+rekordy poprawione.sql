-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Maj 2020, 14:05
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
  `ID_kategoria` int(11) NOT NULL,
  `Nazwa_kategorii` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kategoria`
--

INSERT INTO `kategoria` (`ID_kategoria`, `Nazwa_kategorii`) VALUES
(1, 'moda'),
(2, 'uroda'),
(3, 'natura'),
(4, 'kulinaria'),
(5, 'dom'),
(6, 'DIY'),
(7, 'sport'),
(8, 'zdrowie'),
(9, 'praca'),
(10, 'rodzina'),
(11, 'podroze'),
(12, 'ksiazki'),
(13, 'filmy'),
(14, 'nauka'),
(15, 'inne');

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
(1, 1, 62),
(2, 2, 2),
(3, 3, 39),
(4, 4, 27),
(5, 5, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarz`
--

CREATE TABLE `komentarz` (
  `ID_komentarz` int(11) NOT NULL,
  `Data_dodania` date NOT NULL,
  `Tresc_komentarza` text NOT NULL,
  `PostID_post` int(11) NOT NULL,
  `UzytkownikID_uzytkownik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `komentarz`
--

INSERT INTO `komentarz` (`ID_komentarz`, `Data_dodania`, `Tresc_komentarza`, `PostID_post`, `UzytkownikID_uzytkownik`) VALUES
(1, '2020-01-07', 'Witamy serdecznie', 1, 7),
(2, '2020-05-21', 'Swietne sukienki, tez je bardzo lubie', 2, 8),
(3, '2020-05-20', 'XD', 4, 5),
(4, '2020-05-21', 'Dziekuje za komentarz', 2, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podkategoria`
--

CREATE TABLE `podkategoria` (
  `ID_podkategoria` int(11) NOT NULL,
  `Nazwa_podkategorii` text NOT NULL,
  `KategoriaID_kategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `podkategoria`
--

INSERT INTO `podkategoria` (`ID_podkategoria`, `Nazwa_podkategorii`, `KategoriaID_kategoria`) VALUES
(1, 'wiosna', 1),
(2, 'lato', 1),
(3, 'jesien', 1),
(4, 'zima', 1),
(5, 'makijaz', 2),
(6, 'twarz', 2),
(7, 'wlosy', 2),
(8, 'paznokcie', 2),
(9, 'cialo', 2),
(10, 'fauna', 3),
(11, 'flora', 3),
(12, 'obiad', 4),
(13, 'deser', 4),
(14, 'przekaski', 4),
(15, 'lunch', 4),
(16, 'napoje', 4),
(17, 'kuchnia', 5),
(18, 'lazienka', 5),
(19, 'sypialnia', 5),
(20, 'salon', 5),
(21, 'biuro', 5),
(22, 'ogrod', 5),
(23, 'latwe', 6),
(24, 'umiarkowane', 6),
(25, 'zaawansowane', 6),
(26, 'zimowe', 7),
(27, 'letnie', 7),
(28, 'aktywnosc fizyczna', 8),
(29, 'porady zdrowotne', 8),
(30, 'problemy zdrowotne', 8),
(31, 'rekrutacja', 9),
(32, 'porady i wskazowki', 9),
(33, 'praca w zespole', 9),
(34, 'inne', 9),
(35, 'rodzicielstwo', 10),
(36, 'dzieci', 10),
(37, 'dziadkowie', 10),
(38, 'dalsza rodzina', 10),
(39, 'krajowe', 11),
(40, 'Azja', 11),
(41, 'Europa', 11),
(42, 'Afryka', 11),
(43, 'Ameryka Poludniowa', 11),
(44, 'Ameryka Polnocna', 11),
(45, 'Australia', 11),
(46, 'Antarktyda', 11),
(47, 'naukowe', 12),
(48, 'romans', 12),
(49, 'kryminal', 12),
(50, 'fantasy', 12),
(51, 'mlodziezowe', 12),
(52, 'bajki', 12),
(53, 'psychologiczne', 12),
(54, 'si-fi', 13),
(55, 'horror', 13),
(56, 'dokumentalne', 13),
(57, 'seriale', 13),
(58, 'komedie', 13),
(59, 'inne', 13),
(60, 'nauki humanistyczne', 14),
(61, 'nauki scisle', 14),
(62, 'ogolne', 15);

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
  `UzytkownikID_uzytkownik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`ID_post`, `Tytul`, `Data_dodania`, `Data_ostatniej_modyfikacji`, `Tresc`, `Liczba_polubien`, `Liczba_nielubien`, `UzytkownikID_uzytkownik`) VALUES
(1, 'Witam', '2020-01-05', '2020-01-05', 'Witam, to pierwszy post, mam nadzieje na duze zainteresowanie blogiem', 5, 1, 5),
(2, 'MODNE SUKIENKI HISZPANKI – ZAKOCHASZ SIĘ W NICH!', '2020-05-12', '2020-05-12', 'Sukienki w stylu hiszpańskim co roku cieszą się ogromnym powodzeniem. Dziewczyny uwielbiają ten fason, a faceci wprost nie mogą oderwać oczu od kobiet ubranych w taką sukienkę. Są bardzo kobiece i pasują praktycznie na każdą okazję. Dostępne w różnych kolorach i wzorach, wykonane z różnych tkanin. To doskonała propozycja dla każdego typu sylwetki.', 8, 2, 6),
(3, 'Objazdówka wczesnoporanna!', '2020-05-14', '2020-05-15', 'Wymyśliłam sobie,że w sobotę wstanę wcześnie i pojadę w teren.Tak też zrobiłam,zapowiadało się słonecznie,bułki i picie spakowane,aparat i lornetka wzięta to ruszyłam.Po drodze przystanki na foty ptaków i tak jako pierwsze załapały się pokląskwy.', 6, 1, 6),
(4, 'Trening w domu w dobie koronawirusa. Joga dla początkujących', '2020-05-19', '2020-05-19', 'Tak naprawdę do sesji jogi w domowym zaciszu nie potrzebujecie drogiego, specjalistycznego sprzętu. Wystarczą chęci, niewielka, uporządkowana przestrzeń i mata do jogi, która zapewnia stabilne podłoże do wykonywania wszystkich ćwiczeń, a także amortyzuje punkty podparcia. Niezbędne mogą okazać się specjalne kostki do pozycji siedzących i leżących lub bawełniane taśmy do ćwiczeń rozciągających.', 11, 0, 7),
(5, 'WINSTON: KOCIE KARMY W ROSSMANIE', '2020-05-05', '2020-05-07', 'Ciężko znaleźć kogoś kto nie zna drogeri kosmetycznej Rossman. Bogaty asortyment i liczne promocje przyciagają większość Polaków. W jednym miejscu kupimy produkty pielęgnacyjne, akcesoria do sprzatania i gadżety do domu. Sklep oferuje również marki własne. W Rossmanie znajdziemy także dział dla zwierzat.', 7, 3, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `preferencje_uzytkownika`
--

CREATE TABLE `preferencje_uzytkownika` (
  `ID_preferencje_uzytkownika` int(11) NOT NULL,
  `UzytkownikID_uzytkownik` int(11) NOT NULL,
  `KategoriaID_kategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `preferencje_uzytkownika`
--

INSERT INTO `preferencje_uzytkownika` (`ID_preferencje_uzytkownika`, `UzytkownikID_uzytkownik`, `KategoriaID_kategoria`) VALUES
(2, 1, 14),
(3, 2, 11),
(4, 3, 7),
(5, 4, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `profil`
--

CREATE TABLE `profil` (
  `ID_Profil` int(11) NOT NULL,
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

INSERT INTO `profil` (`ID_Profil`, `Zainteresowania`, `Cele`, `Plec`, `Opis`, `Lokalizacja`, `Urodziny`, `Imie`, `Nazwisko`) VALUES
(5, 'Informatyka, Przyroda', 'Przezyc', 'Mezczyzna', 'Hej, z tej strony Jan Kowalski. Jestem informatykiem. ', 'Krakow', '1980-01-01', 'Jan', 'Kowalski'),
(6, 'Podroze', 'Zwiedzic caly swiat', 'Kobieta', 'Tu Anna Nowak, chetnie porozmawiam o moich wycieczkach. ', 'Gdansk', '1991-07-18', 'Anna', 'Nowak'),
(7, 'Sport, Zdrowie', 'Wygrac maraton', 'Mezczyzna', 'Witam na moim profilu. ', 'Warszawa', '1975-03-28', 'Zbigniew', 'Duda'),
(8, 'Dom, Zwierzeta, a szczegolnie koty', 'Zalozyc schronisko dla kotow.', 'Kobieta', '', 'Wroclaw', '1982-11-10', 'Magdalena', 'Koperek');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `ID_uzytkownik` int(11) NOT NULL,
  `Data_utworzenia_konta` date NOT NULL,
  `Mail` text NOT NULL,
  `Login` text NOT NULL,
  `Haslo` text NOT NULL,
  `ProfilID_profil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`ID_uzytkownik`, `Data_utworzenia_konta`, `Mail`, `Login`, `Haslo`, `ProfilID_profil`) VALUES
(5, '2020-01-30', 'jkowalski@gmail.com', 'jankowalski', 'Zaq12wsx', 5),
(6, '2020-02-28', 'nowak_anna@gmail.com', 'nowakanna', 'Podrozniczka2137', 6),
(7, '2020-03-15', 'zbigniewduda@wp.pl', 'zbigniewduda', 'zbigniewduda', 7),
(8, '2020-03-26', 'koperek@interia.pl', 'mkoperek', 'Puszek123', 8);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`ID_kategoria`);

--
-- Indeksy dla tabeli `kategoria_postu`
--
ALTER TABLE `kategoria_postu`
  ADD PRIMARY KEY (`ID_kategoria_postu`);

--
-- Indeksy dla tabeli `komentarz`
--
ALTER TABLE `komentarz`
  ADD PRIMARY KEY (`ID_komentarz`);

--
-- Indeksy dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  ADD PRIMARY KEY (`ID_podkategoria`);

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ID_post`);

--
-- Indeksy dla tabeli `preferencje_uzytkownika`
--
ALTER TABLE `preferencje_uzytkownika`
  ADD PRIMARY KEY (`ID_preferencje_uzytkownika`);

--
-- Indeksy dla tabeli `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`ID_Profil`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`ID_uzytkownik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `ID_kategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `kategoria_postu`
--
ALTER TABLE `kategoria_postu`
  MODIFY `ID_kategoria_postu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `komentarz`
--
ALTER TABLE `komentarz`
  MODIFY `ID_komentarz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `podkategoria`
--
ALTER TABLE `podkategoria`
  MODIFY `ID_podkategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `ID_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `preferencje_uzytkownika`
--
ALTER TABLE `preferencje_uzytkownika`
  MODIFY `ID_preferencje_uzytkownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `profil`
--
ALTER TABLE `profil`
  MODIFY `ID_Profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `ID_uzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
