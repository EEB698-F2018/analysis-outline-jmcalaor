#### Summary: Spider Data ####

#### load libraries ####
library(tidyverse)
library(lubridate)
library(readxl)

#### load tidy data & explore ####
data <- read.csv("/Users/jerilyn/Box/EBL Long Term Data Repository/Food Web/Farm project/data/tidy data/tidy_spider.csv")
str(data)
summary(data)

#### summarize data ####

#number of spiders by treatment
data %>%
  group_by(treatment) %>%
  summarize(sum(num_spiders))


