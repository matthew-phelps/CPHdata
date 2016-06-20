rm(list = ls())

aalborg_1855_census <- read.csv("data-raw/aalborg-1855-census.csv",
                                stringsAsFactors = F)
aalborg_1855_census$gender <- ifelse(aalborg_1855_census$gender == "K",
                                     "F",
                                     aalborg_1855_census$gender)
aalborg_1855_census$age <- as.numeric(aalborg_1855_census$age)

devtools::use_data(aalborg_1855_census, overwrite = T)
