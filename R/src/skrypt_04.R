(100)
library(tidyverse)
dane<- data("iris")
dane <- iris

#zmina nazwy kolumn
dane <- dplyr::rename_with(dane,.cols=dplyr::everything(),\(i) tolower(i))

#grupowanie
dane_g <- dplyr::group_by(dane,species)
dane_g                           
dane_s <- dplyr::summarise(dane_g, srednia=mean(sepal.length))

#praca na kilku kolumnach na raz
#logarytm
dane_01 <- dplyr::mutate(dane, sepal.length=log(sepal.length))
#pierwiastek z dwoch kolumn
dane_02 <- dplyr::mutate(dane, sepal.width=sqrt(sepal.width),petal.length=sqrt(petal.length))

#across - czyli wiecej niz jedna na raz
dane_03 <- dplyr::mutate(dane, dplyr::across(sepal.length:petal.width,\(i)log10(i)))

#across - ale tylko na kolumny z length
dane_04 <- dplyr::mutate(dane,dplyr::across(dplyr::contains("length"),\(i)log10(i)))

#across i mutate
dane_05 <- dplyr::mutate(dane,dplyr::across(dplyr::starts_with("petal"),\(i)log2(i)),iloraz =petal.length/petal.width)

#across w summarise
dane_07 <- dplyr::summarise(dane, dplyr::across(dplyr::everything(),\(i)mean(i)))

#across na wartosciach  numerycznych
dane_08 <- dplyr::summarise(dane, dplyr::across(dplyr::where(\(i)is.numeric(i)),\(i)mean(i)))
