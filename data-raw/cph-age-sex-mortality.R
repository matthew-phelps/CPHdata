## Intro
rm(list = ls())

age_deaths <- read.csv("data-raw\\cph-age-mortality2.csv")
load('data\\cph_pop1853.rda')
load('data\\age_mortality.rda')

# Replace "." with "-"
age_deaths$start_age_yrs <- as.numeric(as.character(age_deaths$start_age_yrs))
# y <- sub("\\.","-", x)# grep and subbing:http://goo.gl/hY1yjM
# colnames(age_deaths) <- y
mort_rates <- matrix(data = NA, nrow = nrow(age_mortality), ncol = 1)
mort_rates <- data.frame(mort_rates)
mort_rates$age_range <- cph_pop1853$age_range[1:22]
mort_rates$male_mort_rate <- age_mortality$male_dead / cph_pop1853$men1853[1:22]
mort_rates$female_mort_rate <- age_mortality$female_dead / cph_pop1853$women1853[1:22]
mort_rates$total_mort_rate <- age_mortality$total_dead / cph_pop1853$total1853[1:22]
mort_rates$mort_rates <- NULL

# SAVE
cph_age_mortality <- age_deaths
devtools::use_data(cph_age_mortality, overwrite = T)
devtools::use_data(mort_rates, overwrite = T)
