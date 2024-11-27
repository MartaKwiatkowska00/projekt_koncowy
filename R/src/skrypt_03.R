#27.11.2024
library(tidyverse)
library(readxl)

#wczytanie danych
ramka <- readxl::read_excel("R/data/zmienne_excel.xlsx", sheet="Arkusz1")


ramka <- dplyr::rename(ramka,dystans_km = 'dystans w km')
ramka <- dplyr::rename(ramka,godzina_wstania = 'godzina wstania')
ramka <- dplyr::rename(ramka,samopoczucie_skala_1_5= 'samopoczucie (skala 1-5)')

#zmiana nazwy z malej na duza
ramka2 <- dplyr::rename_with(ramka, .cols = everything(),\(i)toupper(i))
ramka3 <- dplyr::rename_with(ramka2, .cols = dplyr::contains("wstania"),\(i) tolower(i))

#operacja na kolumnach

ramka2[2,] #wiersz ramka2[,2] - kolumna 2
ramka2$kolumna_kolejna <- ramka2[,2] / ramka2[,4]
ramka4 <- dplyr::mutate(ramka,wynik_dzielenia=dystans_km/samopoczucie_skala_1_5,wynik_dodawania=dystans_km+wynik_dzielenia)
ramka5 <- dplyr::mutate(ramka,dystans_km=dystans_km-1)
ramka6 <- dplyr::mutate(ramka,dystans_km=dystans_km-1, .keep = ("none"))


#przesuniecie kolumn
ramka7 <- dplyr::relocate(ramka,dystans_km,.after = godzina_wstania)
