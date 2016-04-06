rm(list = ls())
library(tidyr)
cen <- read.csv("data-raw\\census_data.csv")

cen_w <- spread(cen, year, total)
tempA <- cen_w[cen_w$place == "aalborg", ]
tempK <- cen_w[cen_w$place == "korsoer", ]
aal_pop <- (tempA$`1855` - tempA$`1850`) / 5 * 3 + tempA$`1850`
kor_pop <- (tempK$`1860` - tempK$`1850`) / 10 * 7 + tempK$`1850`

cen_w$`1853` <- aal_pop
cen_w$`1857` <- kor_pop

census <- gather(cen_w, "year", "total", 5:9)
census <- census[order(census$place, census$year),]

devtools::use_data(census, overwrite = T)
