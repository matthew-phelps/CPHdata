rm(list = ls())
census <- read.csv("data-raw\\census_data.csv")
devtools::use_data(census, overwrite = T)
