library(tidyverse)

test <- c(6,7,8,9)
test <- cumsum(test)
test <- mean(test)

#test_potokowania
#nadpisywanie kolejnymi wartosciami
#1 stworz wektor, policz sume skumul, policz sr
dane_nadpisane <- c(6,7,8,9)
dane_nadpisane <- cumsum(dane_nadpisane)
dane_nadpisane <- mean(dane_nadpisane)

#zapisz z funkcja
dane_funkcja <- mean(cumsum(c(6,7,8,9)))

# to samo co wyzejz uzyciem potokowania pipe
dane_potok <- c(6,7,8,9) |>
  cumsum() |>
  mean()

#tidyr
data <- iris
#zmiana formatu long na wide
l_2_w <- data |>
  tidyr::pivot_wider(names_from = Species,values_from = Sepal.Length:Petal.Width)

pingwiny <- palmerpenguins::penguins
pingwiny_wide <- pingwiny |>
  tidyr::drop_na() |>
#zmiana formatu na longer
  pingwiny_longer <- pingwiny |>
  tidyr::pivot_longer(bill_length_mm:body_mass_g,names_to = "zmienna", values_to = "wartosci")

pingwiny <- pingwiny |>
  dplyr::mutate(id=1:length(year))

#joins
#podzial na plec
pingwiny_m <- pingwiny |>
  dplyr::filter(sex=="male")

pingwiny_f <- pingwiny |>
  dplyr::filter(!sex=="male")

#łązenie wierszy
pingwiny_m_f <- dplyr::bind_rows(pingwiny_m,pingwiny_f)

#podział kolumn
pingwiny_1 <- pingwiny |>
  dplyr::select(species:body_mass_g)

pingwiny_2 <- pingwiny |>
  dplyr::select(-c(species:body_mass_g))

#lączenie kolumn
pingwin_1_2 <- dplyr::bind_cols(pingwiny_1, pingwiny_2)
