## Intro
rm(list = ls())
library(tidyr)
library(grouping)
age_deaths <- read.csv("data-raw\\cph-all-mortality.csv")
load('data\\cph_pop1853.rda')
load('data\\age_mortality.rda')

# Replace "." with "-"
# y <- sub("\\.","-", x)# grep and subbing:http://goo.gl/hY1yjM
# colnames(age_deaths) <- y
mort_rates <- matrix(data = NA, nrow = nrow(age_mortality), ncol = 1)
mort_rates <- data.frame(mort_rates)
mort_rates$age_range <- cph_pop1853$age_range[1:22]
mort_rates$male_mort_rate <- age_mortality$male_dead / cph_pop1853$men1853[1:22]
mort_rates$female_mort_rate <- age_mortality$female_dead / cph_pop1853$women1853[1:22]
mort_rates$total_mort_rate <- age_mortality$total_dead / cph_pop1853$total1853[1:22]
mort_rates$mort_rates <- NULL


# Remove unknowns:
age_deaths <- age_deaths[age_deaths$age_range != "unknown", ]
x <- cph_pop1853[1:3, ]
# Collapse to 10yr age groups ---------------------------------------------
age_range <- c("0-9", "10-19", "20-29", "30-39", "40-49",
               "50-59", "60-69", "70-79", "80+")

age_range <- (matrix(age_range, nrow = length(age_range), ncol = 1))
pop10yr <- data.frame(age_range)
mort_10yr <- data.frame(age_range)
rm(age_range)



pop10yr$men1853[1] <- sum(cph_pop1853$men1853[1:5])
pop10yr$men1853[2] <- sum(cph_pop1853$men1853[6:7])
pop10yr$men1853[3] <- sum(cph_pop1853$men1853[8:9])
pop10yr$men1853[4] <- sum(cph_pop1853$men1853[10:11])
pop10yr$men1853[5] <- sum(cph_pop1853$men1853[12:13])
pop10yr$men1853[6] <- sum(cph_pop1853$men1853[14:15])
pop10yr$men1853[7] <- sum(cph_pop1853$men1853[16:17])
pop10yr$men1853[8] <- sum(cph_pop1853$men1853[18:19])
pop10yr$men1853[9] <- sum(cph_pop1853$men1853[20:22])

pop10yr$women1853[1] <- sum(cph_pop1853$women1853[1:5])
pop10yr$women1853[2] <- sum(cph_pop1853$women1853[6:7])
pop10yr$women1853[3] <- sum(cph_pop1853$women1853[8:9])
pop10yr$women1853[4] <- sum(cph_pop1853$women1853[10:11])
pop10yr$women1853[5] <- sum(cph_pop1853$women1853[12:13])
pop10yr$women1853[6] <- sum(cph_pop1853$women1853[14:15])
pop10yr$women1853[7] <- sum(cph_pop1853$women1853[16:17])
pop10yr$women1853[8] <- sum(cph_pop1853$women1853[18:19])
pop10yr$women1853[9] <- sum(cph_pop1853$women1853[20:22])

pop10yr$total1853[1] <- sum(cph_pop1853$total1853[1:5])
pop10yr$total1853[2] <- sum(cph_pop1853$total1853[6:7])
pop10yr$total1853[3] <- sum(cph_pop1853$total1853[8:9])
pop10yr$total1853[4] <- sum(cph_pop1853$total1853[10:11])
pop10yr$total1853[5] <- sum(cph_pop1853$total1853[12:13])
pop10yr$total1853[6] <- sum(cph_pop1853$total1853[14:15])
pop10yr$total1853[7] <- sum(cph_pop1853$total1853[16:17])
pop10yr$total1853[8] <- sum(cph_pop1853$total1853[18:19])
pop10yr$total1853[9] <- sum(cph_pop1853$total1853[20:22])



mort_10yr$male_dead[1] <- sum(age_mortality$male_dead[1:5])
mort_10yr$male_dead[2] <- sum(age_mortality$male_dead[6:7])
mort_10yr$male_dead[3] <- sum(age_mortality$male_dead[8:9])
mort_10yr$male_dead[4] <- sum(age_mortality$male_dead[10:11])
mort_10yr$male_dead[5] <- sum(age_mortality$male_dead[12:13])
mort_10yr$male_dead[6] <- sum(age_mortality$male_dead[14:15])
mort_10yr$male_dead[7] <- sum(age_mortality$male_dead[16:17])
mort_10yr$male_dead[8] <- sum(age_mortality$male_dead[18:19])
mort_10yr$male_dead[9] <- sum(age_mortality$male_dead[20:22])

mort_10yr$male_sick[1] <- sum(age_mortality$male_sick[1:5])
mort_10yr$male_sick[2] <- sum(age_mortality$male_sick[6:7])
mort_10yr$male_sick[3] <- sum(age_mortality$male_sick[8:9])
mort_10yr$male_sick[4] <- sum(age_mortality$male_sick[10:11])
mort_10yr$male_sick[5] <- sum(age_mortality$male_sick[12:13])
mort_10yr$male_sick[6] <- sum(age_mortality$male_sick[14:15])
mort_10yr$male_sick[7] <- sum(age_mortality$male_sick[16:17])
mort_10yr$male_sick[8] <- sum(age_mortality$male_sick[18:19])
mort_10yr$male_sick[9] <- sum(age_mortality$male_sick[20:22])

mort_10yr$female_sick[1] <- sum(age_mortality$female_sick[1:5])
mort_10yr$female_sick[2] <- sum(age_mortality$female_sick[6:7])
mort_10yr$female_sick[3] <- sum(age_mortality$female_sick[8:9])
mort_10yr$female_sick[4] <- sum(age_mortality$female_sick[10:11])
mort_10yr$female_sick[5] <- sum(age_mortality$female_sick[12:13])
mort_10yr$female_sick[6] <- sum(age_mortality$female_sick[14:15])
mort_10yr$female_sick[7] <- sum(age_mortality$female_sick[16:17])
mort_10yr$female_sick[8] <- sum(age_mortality$female_sick[18:19])
mort_10yr$female_sick[9] <- sum(age_mortality$female_sick[20:22])

mort_10yr$female_dead[1] <- sum(age_mortality$female_dead[1:5])
mort_10yr$female_dead[2] <- sum(age_mortality$female_dead[6:7])
mort_10yr$female_dead[3] <- sum(age_mortality$female_dead[8:9])
mort_10yr$female_dead[4] <- sum(age_mortality$female_dead[10:11])
mort_10yr$female_dead[5] <- sum(age_mortality$female_dead[12:13])
mort_10yr$female_dead[6] <- sum(age_mortality$female_dead[14:15])
mort_10yr$female_dead[7] <- sum(age_mortality$female_dead[16:17])
mort_10yr$female_dead[8] <- sum(age_mortality$female_dead[18:19])
mort_10yr$female_dead[9] <- sum(age_mortality$female_dead[20:22])


mort_10yr$total_dead[1] <- sum(age_mortality$total_dead[1:5])
mort_10yr$total_dead[2] <- sum(age_mortality$total_dead[6:7])
mort_10yr$total_dead[3] <- sum(age_mortality$total_dead[8:9])
mort_10yr$total_dead[4] <- sum(age_mortality$total_dead[10:11])
mort_10yr$total_dead[5] <- sum(age_mortality$total_dead[12:13])
mort_10yr$total_dead[6] <- sum(age_mortality$total_dead[14:15])
mort_10yr$total_dead[7] <- sum(age_mortality$total_dead[16:17])
mort_10yr$total_dead[8] <- sum(age_mortality$total_dead[18:19])
mort_10yr$total_dead[9] <- sum(age_mortality$total_dead[20:22])


mort_rates_10yr <- matrix(data = NA, nrow = nrow(mort_10yr), ncol = 1)
mort_rates_10yr <- data.frame(mort_rates_10yr)
mort_rates_10yr$age_range <- pop10yr$age_range
mort_rates_10yr$male_mort_rate <- mort_10yr$male_dead / pop10yr$men1853
mort_rates_10yr$female_mort_rate <- mort_10yr$female_dead / pop10yr$women1853
mort_rates_10yr$total_mort_rate <- mort_10yr$total_dead / pop10yr$total1853

mort_rates_10yr$mort_rates_10yr <- NULL

# Mortality rates based on statistical report - not cholera report
age_deaths2 <- spread(age_deaths[age_deaths$cause == "cholera", ],
                      key = gender, value = deaths)
mort_rates_10yr$male_mort2 <- age_deaths2$m / pop10yr$men1853
mort_rates_10yr$female_mort2 <- age_deaths2$f / pop10yr$women1853
tot_mort <- age_deaths2$f + age_deaths2$m
mort_rates_10yr$total_mort_2 <- tot_mort / pop10yr$total1853

mort_10yr$male_dead2 <- age_deaths2$m
mort_10yr$female_dead2 <- age_deaths2$f


# Attack rates
attack_rates <- matrix(data = NA, nrow = nrow(mort_10yr), ncol = 1)
attack_rates <- data.frame(attack_rates)
attack_rates$age_range <- pop10yr$age_range
attack_rates$male_attack_rate <- mort_10yr$male_sick / pop10yr$men1853
attack_rates$female_attack_rate <- mort_10yr$female_sick / pop10yr$women1853
attack_rates$attack_rates <- NULL

# All-cause mortality
age_deaths3 <-  spread(age_deaths[age_deaths$cause == "total", ],
                       key = gender, value = deaths)
mort_10yr$male_all_cause <- age_deaths3$m
mort_10yr$female_all_cause <- age_deaths3$f



# Under 5 morbidity / mortality -------------------------------------------
age_mortality$LowerAge <- age_mortality$UpperAge <- NULL


group2(cph_pop1853[6:17, ], 2, FUN = "sum", F) # 10 - 69
group2(cph_pop1853[18:21, ], 1, FUN = "sum", F) # 70 - 89




# SAVE
cph_all_mort <- age_deaths
cph_counts_age <- mort_10yr
cph_mort_rates <- mort_rates
cph_mort_rates_10yr <- mort_rates_10yr
cph_pop1853_10yr <- pop10yr
cph_age_mortality <- age_deaths
cph_age_attack_rate <- attack_rates
cph_age_pop1853_raw <- cph_pop1853
cph_age_sick_dead_raw <- age_mortality

devtools::use_data(cph_age_mortality, overwrite = T)
devtools::use_data(cph_mort_rates, overwrite = T)
devtools::use_data(cph_pop1853_10yr, overwrite = T)
devtools::use_data(cph_mort_rates_10yr, overwrite = T)
devtools::use_data(cph_counts_age, overwrite = T)
devtools::use_data(cph_age_attack_rate, overwrite = T)
devtools::use_data(cph_all_mort, overwrite = T)
devtools::use_data(cph_age_pop1853_raw, overwrite = T)
devtools::use_data(cph_age_sick_dead_raw, overwrite = T)
