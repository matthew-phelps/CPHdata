## Intro
rm(list = ls())

case_records <- read.csv("data-raw\\case_records.csv")


case_records$date_admission <- as.Date(case_records$date_admission, format = "%d-%m-%Y")
case_records$dischage_date <- as.Date(case_records$dischage_date, format = "%d-%m-%Y")
case_records$death_date <- as.Date(case_records$death_date, format = "%d-%m-%Y")
case_records$event <- as.Date(case_records$event, format = "%d-%m-%Y")

devtools::use_data(case_records, overwrite = T)
