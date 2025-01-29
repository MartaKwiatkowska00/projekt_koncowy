#paczki
library(tidyverse)

#dane
zab_hydrochemia <- read.csv("R/data/zab_data/zab_hydrochemistry-lake.csv") |>

mutate(date = lubridate::ymd(date))

#wykres x=cas y=zmeinne
ggplot2::ggplot(zab_hydrochemia,aes(date,ca))+ geom_line()

#wykres x=cas y=zmeinne
ggplot2::ggplot(zab_hydrochemia,aes(date,ca, colour = depth))+ geom_line()

#wykres x=cas y=zmeinne
ggplot2::ggplot(zab_hydrochemia,aes(date,ca, colour = factor(depth))) +
  geom_line()


#wykres x=cas y=zmeinne
ggplot2::ggplot(zab_hydrochemia,aes(date,ca, colour = factor(depth))) +
  geom_line() + facet_wrap(vars(depth))

#wykres x=cas y=zmeinne
ggplot2::ggplot(zab_hydrochemia,aes(date,ca, colour = factor(depth))) +
  geom_line() + facet_wrap(vars(depth), ncol=1)

#brak tła
ggplot2::ggplot(zab_hydrochemia,aes(date,ca, colour = factor(depth))) +
  geom_line() + facet_wrap(vars(depth), ncol=1) +
  theme(panel.background = element_blank())

#wykres punktowy
zab_temperature <- read.csv("R/data/zab_data/zab_temperature-daily.csv") |>
mutate(day=lubridate::ymd(day))

#wykres temperatury wody w czasie, temperatura na pierwszym metrze, punkty linia wygładzone
ggplot2::ggplot(zab_temperature,aes(day,temp_01))+
  geom_point()+
  geom_line(color="red")+
  geom_smooth()

#pivotowanie (wykres z seriami rozbitymi na panele, wszystkie głębokości)
zab_temperature |> tidyr::pivot_longer(cols = starts_with("temp_"), names_to = "glebokosc", values_to = "temperatura") |>
ggplot(aes(day,temperatura)) +
  geom_line() +
  facet_wrap(vars(glebokosc), ncol = 1, scales = "free")

#kolejne
zab_trap <- read.csv("R/data/zab_data/zab_sediment-trap_hypolimnion.csv") |>
  mutate(date= lubridate::ymd(date))
zab_trap |>
  ggplot(aes(date,mar)) +
  geom_col(color = "pink")

#boxplot
ggplot(zab_hydrochemia) + geom_boxplot(aes(y = ca, group = factor(depth)))
