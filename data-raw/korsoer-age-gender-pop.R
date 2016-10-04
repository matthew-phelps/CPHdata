rm(list = ls())

korsoer_age_gender_pop <- read.csv("data-raw/korsoer-age-gender-pop.csv",
                               stringsAsFactors = F)

devtools::use_data(korsoer_age_gender_pop, overwrite = T)
