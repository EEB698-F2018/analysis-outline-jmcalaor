#### Tidy Script: Plant Data ####

#### load libraries ####
library(tidyverse)
library(lubridate)
library(readxl)

#### load dataset ####
data <- readxl::read_xlsx("/Users/jerilyn/Box/EBL Long Term Data Repository/Food Web/Farm project/data/raw data/Farm Harvest Data - Fruit&Veg Weight 7oct10ec.xlsx")

##### explore data ####
str(data) #shows structure of dataset
summary(data) #gives summary information
names(data) #show column names

##### standardize/clean inconsistencies ####

##rename column headings
data <- rename(data, island = "Island", farm = "Farm", date = "Date", 
               names = "Names", trt = "Treat-ment",
               spp = "Spp", plant = "Plant #", totfruit = "Fruit Count", 
               juvfruit = "# Juvenile Fruits", 
               oldfruit = "Old or Rotten (cannot assess damage)",
               poorfr = "# Poor Fruits (1) >7% damage", 
               belavg = "# Below average Fruits (2)   3-7% damage",
               avgfr = "# Average Fruits (3)   1-3% damage",
               goodfr = "# Good Fruits (4) .5-1% damage",
               excfr = "# Excellent Fruits (5) <.5% damage",
               wetwtfr = "Wet weight of fruit (g)",
               drwtfr = "Dry weight of fruit (g)",
               drwtnfrt = "Dry weight of non-fruiting parts of plant (g)",
               drwtout = "Dry weight of non-fruiting parts(g) out side of the exclosure",
               drwtleaf = "Total dry weight non-fruiting parts(g)",
               notes = "Notes")

names(data) #check changes

##change class of columns

#changing these from characters to factors to be able to explore levels
factor_cols <- c("island", "farm", "trt", "spp") 
data[factor_cols] <- lapply(data[factor_cols], as.factor)

summary(data) #check classes & explore if levels need to be fixed

#change capitalization
data$island <- as.factor(tolower(data$island))
data$farm <- as.factor(tolower(data$farm))

summary(data) #check changes

#### write csv ####
write.csv(data, "/Users/jerilyn/Box/EBL Long Term Data Repository/Food Web/Farm project/data/tidy data/tidy_plant.csv", row.names = F)

