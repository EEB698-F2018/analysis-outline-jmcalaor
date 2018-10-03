#### Summary: Plant data ####

#### load libraries ####
library(tidyverse)
library(lubridate)
library(readxl)

#### load tidy data & explore ####
data <- read.csv("/Users/jerilyn/Box/EBL Long Term Data Repository/Food Web/Farm project/data/tidy data/tidy_plant.csv")
str(data)
summary(data)

#### summarize data ####

#total fruit count by farm, treatment, and species
data %>%
  group_by(farm, trt, spp) %>%
  summarize(avg = mean(totfruit))

#total fruit count by treatment
data %>%
  group_by(trt) %>%
  summarize(avg = mean(totfruit))


#poor fruit by treatment
data %>%
  group_by(trt) %>%
  summarize(avg = mean(poorfr))

#excellent fruit by treatment
data %>%
  group_by(trt) %>%
  summarize(avg = mean(excfr))

#weights by treatment
data %>%
  group_by(trt, spp) %>%
  summarize(avg = mean(drwtfr))

#save summary
write.csv(data, "/Users/jerilyn/Box/EBL Long Term Data Repository/Food Web/Farm project/data/tidy data/plant_summary.csv", row.names = F)

