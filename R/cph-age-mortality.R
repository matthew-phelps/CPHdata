## Intro
rm(list = ls())

age_deaths <- read.csv("data-raw\\cph-age-mortality.csv")
x <- colnames(age_deaths)

# Replace "." with "-"
y <- sub("\\.","-", x)# grep and subbing:http://goo.gl/hY1yjM
colnames(age_deaths) <- y

# SAVE
cph_age_mortality <- age_deaths
devtools::use_data(cph_age_mortality, overwrite = T)
