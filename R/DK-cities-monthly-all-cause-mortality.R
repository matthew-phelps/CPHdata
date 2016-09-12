rm(list = ls())
library(dplyr)


x <- read.csv('data-raw/DK-cities-monthly-all-cause-mortality1852-54.csv')
x$Date <- as.Date(x$Date, "%d%b%Y")
x$Day <- x$Month <- x$Year <- NULL
colnames(x) <- c("Date", "<10", "10-25", "26-50", ">50")

dk_cities_allcause <- x
devtools::use_data(dk_cities_allcause, overwrite = T)
