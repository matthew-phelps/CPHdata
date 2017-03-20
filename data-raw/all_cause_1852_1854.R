rm(list = ls())

all_cause_1852_1854 <- read.csv("data-raw/all_cause_1853.csv",
                               stringsAsFactors = F)
all_cause_1852_1854$date <- as.Date(all_cause_1852_1854$date)
devtools::use_data(all_cause_1852_1854, overwrite = T)
