# Powtórka; grupa 1, 22.01.2025

# Załaduj paczki {tidyverse}, {readxl}
library(tidyverse)
library(readxl)

# Stwórz jednowymiarowy wektor o pięciu elementach liczbowych
wektor <- c(1,5,7,3,4)

# Wybierz czwartą i trzecią (w tej kolejności) pozycję w utworzonym wektorze i zapisz jako nowy wektor
wektor2 <- c(wektor[4],wektor[3])

wektor3 <- wektor[c(4,3)]
# Wczytaj dane z iris dataset
data <- iris

# Wybierz drugą kolumnę i wszystkie wiersze
data1 <- data[,2]

# Wybierz czwarty i trzydiesty wiersz oraz wszystkie kolumny - klasyczne indeksowanie
data2 <- data[c(4,30),]

# Wybierz wiersze 4, 8, 22 i kolumny Petal.Length oraz Sepal.Width - klasyczne indeksowanie
data3 <- data[c(4,8,22),c(3,4)]

# Wybierz kolumnę Species korzystając z operatora $
data4 <- data$Species
# Uwtórz nową kolumnę "Petal.Iloraz" w ramce danych, tak aby była ilorazem Petal.Length i Petal.Width
data$Petal.Iloraz <- data$Petal.Length/data$Petal.Width
# Wczytaj dane z adresu sieciowego, zwróć uwagę na separator
# https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv
data6 <- readr::read_csv("https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv")

# Wczytaj dane z pliku csv na dysku
danecsv <- readr::read_csv(file = "R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Wczytaj dane z pliku excel na dysku, wyraźnie wskaż arkusz
daneexc <- readxl::read_excel("R/data/data_msu.xlsx",sheet = 1)
daneexc <- readxl::read_excel("R/data/data_msu.xlsx",sheet = 2)
daneexc <- readxl::read_excel("R/data/data_msu.xlsx",sheet = 3)


# {dplyr} i {tidyr}

# Wczytaj dane dotyczące pingwinów
pingwiny <- palmerpenguins::penguins


# Zmień nazwę species na gatunek
pingwiny1 <- rename(pingwiny,gatunek=species)
# Zmień wszystkie nazwy tak aby były pisane wielką literą
pingwiny2 <- rename_with(pingwiny,.cols = everything(),\(i)toupper(i))
# Wybierz kolumny od bill_length_mm do body_mass_g
pingwiny3 <- select(pingwiny,bill_length_mm:body_mass_g)

# Wybierz kolumny kończące się na "mm"
pingwiny4 <- pingwiny |> select(ends_with("mm"))

# Wybierz kolumny zawierające "th"
pingwiny5 <- pingwiny |> select(contains("th"))
# Wybierz kolumny niebędące species
pingwiny6 <- dplyr::select(pingwiny,!species)
# Uwtórz nową kolumnę bill_ratio jako iloraz bill_length_mm do bill_depth_mm
pingwiny7 <- dplyr::mutate(pingwiny,iloraz=bill_length_mm/bill_depth_mm)
# Utwórz kolumnę id z numerem obserwacji (tip: 1:n())
pingwiny <- mutate(pingwiny, id=1:n())

# Zlogarytmuj w miejscu kolumnę body_mass_g
dane19 <- dplyr::mutate(pingwiny,body_mass_g=log(body_mass_g))
# Oblicz w miejscu pierwiastek ze wszystkich kolumn numerycznych
dane20 <- mutate(pingwiny,across(where(\(i)is.numeric(i)),\(i)sqrt(i)))

# Zgrupuj ramkę ranych na podstawie zmiennej gatunek i wykonaj operację summarise (średnia) dla kolumn bill_length_mm i body_mass_g
dane21 <- pingwiny |> group_by(species) |> summarise(srednia=mean(bill_length_mm,na.rm = TRUE),srednia2=mean(body_mass_g,na.rm = TRUE))

# Wykonaj operację summarise (mediana) dla kolumn bill_length_mm i body_mass_g, wskaż zmienną grupującą jako argument .by

# Zmień format ramki na dłuższy, wykorzystaj kolumny bill_length_mm i bill_depth_mm
dane23 <- pingwiny |> tidyr::pivot_longer(cols = bill_length_mm,bill_depth_mm)names_to="zmienna",value_to="wartosc_zmiennej)"

# Zmień format ramki na szerszy, tak aby każda zmienna była wyrażona dla każdej wyspy
dane24 <- pingwiny |> pivot_wider(id_cols = id, names_from = island,values_from = flipper_length_mm)

# Korzystając z danych geochemicznych połącz ze sobą ramki loi oraz bsi na podstawie zmiennej sample.id - dołącz do lewej
left_join(ramk1,ramk2,)join_by(sample.id==sample.id)

# Korzystając z danych geochemicznych połącz ze sobą ramki elemental oraz bsi na podstawie zmiennej sample.id - dołącz do prawej
right_join(ramk2,ramk3, join_by(sample.id))

# Korzystając z danych geochemicznych połącz ze sobą wszystkie trzy ramki w sposób całkowity
full_join(ramk1,ramk3,join_by(sample.id)) |> full_join(x=_, y=ramk2, join_by(sample.id))
