## Intro
rm(list = ls())

age_deaths <- read.csv("data-raw\\cph-age-mortality2.csv")


# Replace "." with "-"
age_deaths$start_age_yrs <- as.numeric(as.character(age_deaths$start_age_yrs))
# y <- sub("\\.","-", x)# grep and subbing:http://goo.gl/hY1yjM
# colnames(age_deaths) <- y

# SAVE
cph_age_mortality <- age_deaths
devtools::use_data(cph_age_mortality, overwrite = T)
