rm(list = ls())
load('data\\age1855.rda')
load('data\\age1850.rda')


# Interpolate 1853 population--------------------------------------------------

# Calculate interpolated population
age_ts <- age1850$age_range
age_ts <- data.frame(age_ts)
age_ts$total1850 <- age1850$total
age_ts$total1853 <- NA
age_ts$total1855 <- age1855$total
age_ts <- plyr::rename(age_ts, replace = c("age_ts" = "age"))

# Weighted average to estimate pop in 1853
age_ts$total1853 <- round((2 * age_ts$total1850 + 3 * age_ts$total1855) / 5, digits = 0)

cph_pop1853 <- age_ts[, c("age", "total1853")]
cph_pop1853$pop_1853 <- cph_pop1853$total1853
cph_pop1853$total1853 <- NULL

devtools::use_data(cph_pop1853, overwrite = T)
