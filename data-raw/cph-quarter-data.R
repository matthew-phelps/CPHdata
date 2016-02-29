# Intro
rm(list = ls())

library (reshape) # for renaming variables
library(plyr)
load("data/cph_street_data.rda")
census <- read.csv ("data-raw/Census - quarter.csv", sep=",", header=T, stringsAsFactors=F)


# summarize each quarter by day index (i.e. by week)
quarter <- ddply( cph_street_data, .(quarter, startday.index, start.date),
                  summarize,
                  mensick.week = sum(male.sick, na.rm = T),
                  mendead.week = sum(male.dead, na.rm = T),
                  womensick.week = sum(female.sick, na.rm = T),
                  womendead.week = sum(female.dead, na.rm=T),
                  sick.total.week = sum(sick.total, na.rm = T),
                  dead.total.week = sum(dead.total, na.rm = T))

# Normalize incidence by population ---------------------------------------
# Merge census and cholera data 

quarter <- merge(quarter, census, by.x="quarter", by.y="Quarter", all.x = T)

# Estimate 1853 population ------------------------------------------------
quarter$est.pop.1853 <- round(((3/5) * (quarter$pop1855 - quarter$pop1850) + quarter$pop1850), digits = 0)
quarter$pop1855 <- quarter$pop1850 <- NULL

# Normalize for population
quarter$normal.incidence <- quarter$sick.total.week / quarter$est.pop.1853 * 1000
quarter$normal.mortality <- quarter$dead.total.week / quarter$est.pop.1853 * 1000

quarter$normal.incidence <- round(quarter$normal.incidence, digits = 2)
quarter$normal.mortality <- round(quarter$normal.mortality, digits = 2)


rm(census, street.data)

# Add Cumulative No. infected at each week --------------------------------
quarter$week.id <- quarter$startday.index/7 # create time-step index
quarter$quarterID <- as.numeric(as.factor(quarter$quarter))
quarter$cum.sick <- quarter$sick.total.week


## Calculate the number of ppl in each compartment (S,I,R) at each time step:
# calculate cumilative number of infected in each quarter 
quarter.split <- split(quarter, f = quarter$quarter)
x1 <- quarter.split[[1]]

# Write function to pass to lapply
cumSick <- function(x1){
  x1 <- x1[order(x1$start.date), ]
  for (i in 2:nrow(x1)){
    x1$cum.sick[i] <- x1$cum.sick[i - 1] + x1$sick.total.week[i]
  }
  return (x1)
}
x2 <- lapply(quarter.split, cumSick)

quarter <- do.call(rbind.data.frame, x2)
row.names(quarter) <- NULL

# Now find S and R based on the N and "cumulative sick" numbers
quarter$S <- quarter$est.pop.1853 - quarter$cum.sick # no. of susceptibles at each timestep
quarter$R <- quarter$est.pop.1853 - (quarter$S + quarter$sick.total.week)

cph_quarter_data <- quarter
# Save to "data" folder
devtools::use_data(cph_quarter_data)
