rm(list = ls())
parish_cases <- read.csv("data-raw/parish-cases-population-1853.csv",
                     stringsAsFactors = F)
devtools::use_data(parish_cases, overwrite = T)
