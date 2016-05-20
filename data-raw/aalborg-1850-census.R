rm(list = ls())

aalborg_1850_census <- read.csv("data-raw/aalborg-1850-census.csv",
                                stringsAsFactors = F)
aalborg_1850_census$gender <- ifelse(aalborg_1850_census$gender == "K",
                                     "F",
                                     aalborg_1850_census$gender)
aalborg_1850_census$age <- as.numeric(aalborg_1850_census$age)

devtools::use_data(aalborg_1850_census, overwrite = T)

