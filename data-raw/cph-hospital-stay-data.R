rm(list = ls())

hosp <- read.csv("data-raw/cph-hospital-stay-data.csv", stringsAsFactors = F)

# String to date type
for (i in 2:4){
  hosp[, i] <- as.Date(hosp[, i], "%d/%m/%Y")
}


cph_hosp_stay_data <- hosp

rm(i, hosp)
# SAVE --------------------------------------------------------------------
devtools::use_data(cph_hosp_stay_data)
