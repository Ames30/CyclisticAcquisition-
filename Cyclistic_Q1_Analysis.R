#Downloading packages for analysis
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("readr")
install.packages("stringr")
install.packages("data.table")

#Loading packages for analysis
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)
library(stringr)
library(data.table)
library(lubridate)

#Importing and Merging all CSV files into one dataframe
getwd()
setwd("C:\\Data_Analyst_Coursera\\CSV_Cleaned")
temp<-list.files("C:\\Data_Analyst_Coursera\\CSV_Cleaned", full.names=TRUE, pattern="\\.csv$")
Q1<-rbindlist(lapply(temp,fread),fill=TRUE)

#Transform character data to duration data
Q1$ride_dur<-as.duration(hms(Q1$ride_length))

#Reviewing resulting dataframe
head(Q1)
nrow(Q1)
ncol(Q1)
str(Q1)


#Creating graphs

