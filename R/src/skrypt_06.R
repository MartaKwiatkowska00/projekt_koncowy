library(tidyverse)

data_1 <- readxl::read_excel("R/data/data_msu.xlsx", sheet = "loi")
data_2 <- readxl::read_excel("R/data/data_msu.xlsx", sheet = "elemental")
data_3 <- readxl::read_excel("R/data/data_msu.xlsx", sheet = "bsi")

readxl::excel_sheets("R/data/data_msu.xlsx")

dane_left <- dplyr::left_join(x = data_1,y = data_2)
dane_left_2 <- dplyr::left_join(x = data_1,y = data_3, by = dplyr::join_by(sample.id==sample.id))
dane_left_3 <- dplyr::left_join(dplyr::select(data_1,-mass.mg),dplyr::rename(data_3,nazwa.id=sample.id), by= dplyr::join_by(sample.id==nazwa.id))

dane_left_4 <- dplyr::left_join(data_1,data_2, by=dplyr::join_by(sample.id)) |> dplyr::left_join(y = data_3, by= dplyr::join_by(sample.id))
dane_right <- dplyr::right_join(x = data_1, y = data_2)
dane_right_2 <- dplyr::right_join(data_3,data_1,by=dplyr::join_by(sample.id)) |> dplyr::right_join(data_2,by=dplyr::join_by(sample.id))

#łączenie wszytskiego
data_inner <- dplyr::inner_join(data_1, data_2)

data_crazy <- dplyr::inner_join(data_1,data_3, by=dplyr::join_by(sample.id)) |> dplyr::right_join(dane_right)

#full join
data_full <- dplyr::full_join(data_1,data_2)

#semi joinnie wiem co robi troche taki left join
data_semi <- dplyr::semi_join(data_1,data_2)

#antijoin czyli odwrocenie, zostaje to co nie pasuje
data_anti <- dplyr::anti_join(data_3,data_1)
