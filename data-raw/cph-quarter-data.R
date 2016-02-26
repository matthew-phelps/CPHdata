# Intro
rm(list = ls())

library (reshape) # for renaming variables
library(plyr)
load("data\\street_data.rda")


# summarize each quarter by day index (i.e. by week)
quarter <- ddply( street_data, .(quarter, startday.index, start.date),
                  summarize,
                  mensick.week = sum(male.sick, na.rm = T),
                  mendead.week = sum(male.dead, na.rm = T),
                  womensick.week = sum(female.sick, na.rm = T),
                  womendead.week = sum(female.dead, na.rm=T))
