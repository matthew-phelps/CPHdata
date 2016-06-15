rm(list = ls())
library(tidyr)
cen <- read.csv("data-raw\\census_data.csv")

cen_w <- spread(cen, year, total)
tempA <- cen_w[cen_w$place == "aalborg", ]
tempK <- cen_w[cen_w$place == "korsoer", ]
aal_pop <- (tempA$`1855` - tempA$`1850`) / 5 * 3 + tempA$`1850`
kor_pop <- (tempK$`1860` - tempK$`1850`) / 10 * 7 + tempK$`1850`

cen_w$`1853`[cen_w$place == "aalborg"] <- aal_pop
cen_w$`1857`[cen_w$place == "korsoer"] <- kor_pop

census <- gather(cen_w, "year", "total", 5:9)
census <- census[order(census$place, census$year),]


# Nykoebing and Frederikshavn data from Mads email - all of it from:
# danishfamilysearch.com
nyk1850 <- 2124

fred1850 <- 1461
fred1855 <- 1425
fred1853 <- (fred1855 - fred1850) / 5 * 3 + fred1850

# empty df of proper size
dk_population <- data.frame(city = 1:15, year = NA, pop = NA)
dk_population$pop[1] <- sum(census$total[census$place=="aalborg" & census$year==1850])
dk_population$city[1] <- "aalborg"
dk_population$year[1] <- 1850

dk_population$pop[2] <- sum(census$total[census$place=="aalborg" & census$year==1853])
dk_population$city[2] <- "aalborg"
dk_population$year[2] <- 1853


dk_population$pop[3] <- sum(census$total[census$place=="aalborg" & census$year==1855])
dk_population$city[3] <- "aalborg"
dk_population$year[3] <- 1855

dk_population$pop[4] <- sum(census$total[census$place=="korsoer" & census$year==1850])
dk_population$city[4] <- "korsoer"
dk_population$year[4] <- 1850

dk_population$pop[5] <- sum(census$total[census$place=="korsoer" & census$year==1857])
dk_population$city[5] <- "korsoer"
dk_population$year[5] <- 1857


dk_population$pop[6] <- sum(census$total[census$place=="korsoer" & census$year==1860])
dk_population$city[6] <- "korsoer"
dk_population$year[6] <- 1860

dk_population$pop[7] <- fred1850
dk_population$city[7] <- "frederikshavn"
dk_population$year[7] <- 1850


dk_population$pop[8] <- fred1853
dk_population$city[8] <- "frederikshavn"
dk_population$year[8] <- 1853


dk_population$pop[9] <- fred1855
dk_population$city[9] <- "frederikshavn"
dk_population$year[9] <- 1855

dk_population$pop[10] <- nyk1850
dk_population$city[10] <- "nykoebing"
dk_population$year[10] <- 1850



devtools::use_data(census, overwrite = T)

devtools::use_data(dk_population, overwrite = T)
