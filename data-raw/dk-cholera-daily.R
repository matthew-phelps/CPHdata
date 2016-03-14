# Author: Matthew Phelps
# Desc: Collect data from various files
# Output datasets: Rdata in local directory


## Intro
rm(list = ls())


aalbrog_daily_data <- read.csv('data-raw\\Aalborg_daily_1853.csv')
cph_daily_data <- read.csv('data-raw\\CPH_daily_1853.csv')
korsoer_daily_data <- read.csv('data-raw\\Korsoer_daily_1857.csv')
brandholm_daily_data <- read.csv("data-raw\\Brandhom_daily_1850.csv")

# Population numbers from Lone's excel: "Cholera daily cases in 3 cities.xlsx
aalborg_pop <- 7745
cph_pop <- 143591
korsoer_pop <- 2236



# DATE PREPERATION --------------------------------------------------------

aalbrog_daily_data$month <- sprintf("%02d", aalbrog_daily_data$month) # pad with leading zeros
aalbrog_daily_data$date <- paste(aalbrog_daily_data$years, aalbrog_daily_data$month, aalbrog_daily_data$day, sep = "-")
aalbrog_daily_data$date <- as.Date(aalbrog_daily_data$date)
aalbrog_daily_data$city <- "aalborg"
aalbrog_daily_data$month <- as.integer(aalbrog_daily_data$month)



cph_daily_data$month <- sprintf("%02d", cph_daily_data$month) # pad with leading zeros
cph_daily_data$date <- paste(cph_daily_data$years, cph_daily_data$month, cph_daily_data$day, sep = "-")
cph_daily_data$date <- as.Date(cph_daily_data$date)
cph_daily_data$city <- "copenhagen"
cph_daily_data$month <- as.integer(cph_daily_data$month)


korsoer_daily_data$month <- sprintf("%02d", korsoer_daily_data$month) # pad with leading zeros
korsoer_daily_data$date <- paste(korsoer_daily_data$years, korsoer_daily_data$month, korsoer_daily_data$day, sep = "-")
korsoer_daily_data$date <- as.Date(korsoer_daily_data$date)
korsoer_daily_data$city <- "korsoer"
korsoer_daily_data$month <- as.integer(korsoer_daily_data$month)


brandholm_daily_data$month <- sprintf("%02d", brandholm_daily_data$month) # pad with leading zeros
brandholm_daily_data$date <- paste(brandholm_daily_data$years, brandholm_daily_data$month, brandholm_daily_data$day, sep = "-")
brandholm_daily_data$date <- as.Date(brandholm_daily_data$date)
brandholm_daily_data$city <- "brandholm"
brandholm_daily_data$month <-as.integer(brandholm_daily_data$month)



# BIND TO LONG DATASET ----------------------------------------------------

cholera_daily_data <- rbind(aalbrog_daily_data, brandholm_daily_data, cph_daily_data, korsoer_daily_data)

# SAVE --------------------------------------------------------------------
devtools::use_data(cholera_daily_data)

