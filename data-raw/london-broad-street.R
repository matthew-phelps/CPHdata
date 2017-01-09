rm(list = ls())
broad_st <- read.csv("data-raw/london-broad-street.csv",
                               stringsAsFactors = F)
broad_st$date <- paste(broad_st$year, broad_st$month, broad_st$day, sep = "-")
broad_st$year <- broad_st$month <- broad_st$day <- NULL

devtools::use_data(broad_st, overwrite = T)
