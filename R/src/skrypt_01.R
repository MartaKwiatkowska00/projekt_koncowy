# Zaladowanie paczek
library(tidyverse)

#Dane nowa zelandia
dane_www <- readr::read_csv(file = "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#wczytanie z dysku
  dane_dysk_full_path <- readr::read_csv(file = "C:/github1/projekt_koncowy/R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

  #wczytanie z dysku sciezka wzgledna
  dane_dysk_relative_path <- readr::read_csv(file = "R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

  #Zmiana kolumny tekst-liczba
  dane_dysk_relative_path$Value <- as.numeric(dane_dysk_relative_path$Value)

  #parsowanie tekstu na numer
  dane <- readr::read_csv(file = "R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")
  dane$Value <- readr::parse_number(dane$Value)

