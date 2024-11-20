library(tidyverse)
data <- iris
#średnia dl płatka
sredni_platek <- mean(data$Petal.Length)

mediana_platek <- median(data$Sepal.Length)


odch_stand_dl_platek <- sd(data$Petal.Length)

#srednie dla gatunkow
sredni_platek_setosa <- mean(data[1:50,4])



sredni_platek_versi <- mean(data[51:100,4])

#srednia dla gat po nazwie
sredn_plat_setos <- mean(data[data$Species=="setosa",4])

podsumowanie <- summary(data)
podsumowanie

podsumowanie2 <- summary(data[,1:2])
podsumowanie2

#suma długości tworzenie nowej kolumny
data$Suma_dlugosci <- data$Sepal.Length+data$Petal.Length


# frakcja wszystkie dl dzielone prze szer

data$Frakcja <- (data$Sepal.Length+data$Petal.Length/data$Sepal.Width)

#tworzenie ramki tylko z danymi setosa
data_setosa <- data[data$Species=="setosa",]
#ramka danch tylko dla setosa
data_setosa_nazwa <- data[data$Species==c("setosa","virginica"),]

#ramka danych oryginalna
data_oryg <- dplyr::select(data,Sepal.Length:Species)

data_oryg_sepal <- dplyr::selec

#wybor zmiennych wedlug nazwy z zapisem od do ^^
#wybor zmiennych wg nazwy z zapisemwg poczatku
data_oryg_sepal_3 <- dplyr::select(data,starts_with("Petal"))

data_oryg_sepal_4 <- dplyr::select(data,ends_with("Length"))

# wykrzyknik neguje
#wybor zmiennych wg nazwy z zapisem dowolnych znakow wspolnych
data_oryg_al <- dplyr::select(data,contains("al"))



###Wybor wierszy
#wybor wierszy tylko setos
data_wiersze_1 <- dplyr::filter(data,Species=="setosa")

#wybor wierszy nie z gat set
data_wiersze_2 <- dplyr::filter(data,!Species=="setosa")

#wybor wierszy gdzie petal length jest wieksze niz 5.0
data_wiersze_3 <- dplyr::filter(data,Petal.Length>5.0)

#wybor wierszy gdzie petal length jest wieksze od 5 mniejsze od 6
data_wiersze_4 <- dplyr::filter(data,Petal.Length>5.0&Petal.Length<6.0)


