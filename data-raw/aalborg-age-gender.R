rm(list = ls())

aalborg_age_gender <- read.csv("data-raw/aalborg_age_gender.csv",
                                stringsAsFactors = F)

devtools::use_data(aalborg_age_gender, overwrite = T)
