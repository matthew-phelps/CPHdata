# Desc: Prepare data - get & clean data at street level
# Output datasets: Clean street-level data to be used to create quarter level data

# Intro
rm(list = ls())

library(reshape)

cph_street_data <- read.csv ("data-raw/Cholera by street CPH_eng.csv", sep=",")

# convert to date format
cph_street_data$start.date <- as.Date(cph_street_data$start.date, "%d-%m-%Y")
cph_street_data$end.date <- as.Date(cph_street_data$end.date, "%d-%m-%Y")

# Remove the word "Quarter" from data for brevity's sake
cph_street_data$quarter <- gsub("Qvarter", "", cph_street_data$quarter)

# Recode 888 to missing data:
cph_street_data$female.dead[cph_street_data$female.dead==888] <- NA

# Remove un-used variables
cph_street_data$street.index <- cph_street_data$end.date <- NULL

# Count missing data
missing <- cph_street_data[!complete.cases(cph_street_data[, 4:7]), ]

# combine male and female counts
cph_street_data$sick.total <- cph_street_data$male.sick + cph_street_data$female.sick
cph_street_data$dead.total <- cph_street_data$male.dead + cph_street_data$female.dead
# one Noerrbro record for male.sick has NA - this causes the 15 female sick on that day not to be
# included in the total summation

# Assing day index to each weekly observation
day0 <- as.Date("1853-06-12")
cph_street_data$startday.index <-0
cph_street_data$startday.index <-  cph_street_data$start.date - day0


# Order data by quarter, street, then date
cph_street_data <- cph_street_data[order(cph_street_data$quarter,
                                         cph_street_data$street,
                                         cph_street_data$start.date),]

# Save to "data" folder
devtools::use_data(cph_street_data)
