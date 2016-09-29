rm(list = ls())

korsoer_age_gender <- read.csv("data-raw/korsoer_age_gender.csv",
                               stringsAsFactors = F)

devtools::use_data(korsoer_age_gender, overwrite = T)
