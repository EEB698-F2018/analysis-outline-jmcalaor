#### Tidy Script: Leaf Data ####

#### load libraries ####
library(tidyverse)
library(lubridate)
library(readxl)

#### load dataset ####
data <- read_excel("/Users/jerilyn/Box/EBL Long Term Data Repository/Food Web/Farm project/data/raw data/Farm Harvest, Spider Surveys 7oct10ec.xls")

##### explore data ####
str(data) #shows structure of dataset
summary(data) #gives summary information
names(data) #show column names

#### standardize/clean inconsistencies ####

##remove last column (it is empty)
data <- data[ ,-14]

##Fix column names. When loaded, column names were loaded in first row. 
colnames(data) <- data[1, ] #assings first row as the column names
data <- data[-1, ] #removes first row

names(data) #check changes

##rename column names
data <- rename(data, date = "date", island = "island", farm = "farm", 
                treatment = "treatment", type = "web type", 
                num_spiders = "num_spiders", spider_size = "spider size",
                height = "web height(cm)", length = "web length(cm)",
                width = "web width(cm)", connection = "connection (most connected to0",
                location = "location", notes = "notes")

names(data) #check changes

##change class of columns

#changing these from characters to factors to be able to explore levels
factor_cols <- c("island", "farm", "treatment", "type", "connection", "location", "spider_size")
numeric_cols <- c("num_spiders", "height", "length", "width")

data[factor_cols] <- lapply(data[factor_cols], as.factor)
data[numeric_cols] <- lapply(data[numeric_cols], as.numeric)
data$date <- as.Date(data$date, "%m/%d/%y")

summary(data) #check classes & explore if levels need to be fixed

#### write csv ####
write.csv(data, "/Users/jerilyn/Box/EBL Long Term Data Repository/Food Web/Farm project/data/tidy data/tidy_spider.csv", row.names = F)
