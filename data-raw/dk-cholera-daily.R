# Author: Matthew Phelps
# Desc: Collect data from various files
# Output datasets: Rdata in local directory


## Intro
rm(list = ls())


aalborg_daily_data <- read.csv('data-raw\\Aalborg_daily_1853.csv')
cph_daily_data <- read.csv('data-raw\\CPH_daily_1853.csv')
korsoer_daily_data <- read.csv('data-raw\\Korsoer_daily_1857.csv')
brandholm_daily_data <- read.csv("data-raw\\Brandhom_daily_1850.csv")

# Population numbers from Lone's excel: "Cholera daily cases in 3 cities.xlsx
aalborg_pop <- 7745
cph_pop <- 143591
korsoer_pop <- 2236
brandholm_pop <- 700



# DATE PREPERATION --------------------------------------------------------

aalborg_daily_data$month <- sprintf("%02d", aalborg_daily_data$month) # pad with leading zeros
aalborg_daily_data$date <- paste(aalborg_daily_data$years, aalborg_daily_data$month, aalborg_daily_data$day, sep = "-")
aalborg_daily_data$date <- as.Date(aalborg_daily_data$date)
aalborg_daily_data$city <- "aalborg"
aalborg_daily_data$month <- as.integer(aalborg_daily_data$month)



cph_daily_data$month <- sprintf("%02d", cph_daily_data$month) # pad with leading zeros
cph_daily_data$date <- paste(cph_daily_data$years, cph_daily_data$month, cph_daily_data$day, sep = "-")
cph_daily_data$date <- as.Date(cph_daily_data$date)
cph_daily_data$city <- "copenhagen"
cph_daily_data$month <- as.integer(cph_daily_data$month)


korsoer_daily_data$month <- sprintf("%02d", korsoer_daily_data$month) # pad with leading zeros
korsoer_daily_data$date <- paste(korsoer_daily_data$years, korsoer_daily_data$month, korsoer_daily_data$day, sep = "-")
korsoer_daily_data$date <- as.Date(korsoer_daily_data$date)

korsoer_daily_data$month <- as.integer(korsoer_daily_data$month)

# Pad missing zero obvservations with 0
time_length <- nrow(korsoer_daily_data)
time_min <- min(korsoer_daily_data[, "date"])
time_max <- max(korsoer_daily_data[, "date"])

# generate a time sequence with 1 month intervals to fill in missing dates
pad_dates <- seq(time_min, time_max, by = "day")
pad_dates <- data.frame(date = pad_dates)
korsoer_daily_data <- merge(korsoer_daily_data, pad_dates, all = T)
korsoer_daily_data[which(is.na(korsoer_daily_data$cases)), c("cases", "deaths")] <- 0
korsoer_daily_data$city <- "korsoer"

# Re-generate day-index
korsoer_daily_data$day_index <- 1:nrow(korsoer_daily_data)


brandholm_daily_data$month <- sprintf("%02d", brandholm_daily_data$month) # pad with leading zeros
brandholm_daily_data$date <- paste(brandholm_daily_data$years, brandholm_daily_data$month, brandholm_daily_data$day, sep = "-")
brandholm_daily_data$date <- as.Date(brandholm_daily_data$date)
brandholm_daily_data$city <- "brandholm"
brandholm_daily_data$month <-as.integer(brandholm_daily_data$month)



# NORMALIZING -------------------------------------------------------------

aalborg_daily_data$cases_norm <- aalborg_daily_data$cases/aalborg_pop * 10000
aalborg_daily_data$deaths_norm <- aalborg_daily_data$deaths/aalborg_pop * 10000
aalborg_daily_data$day_norm <- aalborg_daily_data$day_index / max(aalborg_daily_data$day_index)

cph_daily_data$cases_norm <- cph_daily_data$cases/cph_pop * 10000
cph_daily_data$deaths_norm <- cph_daily_data$deaths/cph_pop * 10000
cph_daily_data$day_norm <- cph_daily_data$day_index / max(cph_daily_data$day_index)

korsoer_daily_data$cases_norm <- korsoer_daily_data$cases/korsoer_pop * 10000
korsoer_daily_data$deaths_norm <- korsoer_daily_data$deaths/korsoer_pop * 10000
korsoer_daily_data$day_norm <- korsoer_daily_data$day_index / max(korsoer_daily_data$day_index)

brandholm_daily_data$cases_norm <- brandholm_daily_data$cases / brandholm_pop * 10000
brandholm_daily_data$deaths_norm <- brandholm_daily_data$deaths / brandholm_pop * 10000
brandholm_daily_data$day_norm <- brandholm_daily_data$day_index / max(brandholm_daily_data$day_index)
# BIND TO LONG DATASET ----------------------------------------------------

cholera_daily_data <- rbind(aalborg_daily_data, brandholm_daily_data, cph_daily_data, korsoer_daily_data)

# SAVE --------------------------------------------------------------------
devtools::use_data(cholera_daily_data, overwrite = T)

