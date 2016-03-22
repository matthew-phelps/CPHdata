rm(list = ls())
load('data\\age1855.rda')
load('data\\age1850.rda')
library(dplyr)

# Interpolate 1853 population--------------------------------------------------

# Calculate interpolated population
age_ts <- age1850[, c("age_range", "men", "women", "total")]
age_ts <- rename(age_ts, men1850 = men, women1850 = women, total1850 = total)
age_ts$total1853 <- age_ts$women1853 <- age_ts$men1853 <- NA
age_ts <- cbind(age_ts, age1855[, c("men", "women", "total")])
age_ts <- rename(age_ts, men1855 = men,
                 women1855 = women,
                 total1855 = total)


# Weighted average to estimate pop in 1853
age_ts$total1853 <- round((2 * age_ts$total1850 + 3 * age_ts$total1855) / 5, digits = 0)
age_ts$men1853 <- round((2 * age_ts$men1850 + 3 * age_ts$men1855) / 5, digits = 0)
age_ts$women1853 <- round((2 * age_ts$women1850 + 3 * age_ts$women1855) / 5, digits = 0)

cph_pop1853 <- age_ts[, c("age_range", "men1853", "women1853", "total1853")]

devtools::use_data(cph_pop1853, overwrite = T)
