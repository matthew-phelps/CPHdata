rm(list = ls())
library(dplyr)


x <- read.csv('data-raw/CPH-monthly-all-cause-mortality1852-54.csv')
x$date <- as.Date(x$date, "%d%b%Y")
x$Day <- x$Month <- x$Year <- NULL
colnames(x) <- c("date", "<10", "10-25", "26-50", ">50")

CPH_allcause <- x
devtools::use_data(CPH_allcause, overwrite = T)
