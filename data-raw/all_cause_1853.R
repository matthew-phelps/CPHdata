rm(list = ls())

all_cause_1853 <- read.csv("data-raw/all_cause_1853.csv",
                               stringsAsFactors = F)

devtools::use_data(all_cause_1853, overwrite = T)
