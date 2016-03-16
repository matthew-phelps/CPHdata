## Intro
rm(list = ls())

hospital_records <- read.csv("data-raw\\hospital_records.csv")


hospital_records$date_admission <- as.Date(hospital_records$date_admission, format = "%d-%m-%Y")
hospital_records$dischage_date <- as.Date(hospital_records$dischage_date, format = "%d-%m-%Y")
hospital_records$death_date <- as.Date(hospital_records$death_date, format = "%d-%m-%Y")
hospital_records$event <- as.Date(hospital_records$event, format = "%d-%m-%Y")

devtools::use_data(hospital_records, overwrite = T)
