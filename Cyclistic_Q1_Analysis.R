#Downloading packages for analysis
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("readr")
install.packages("stringr")

#Loading packages for analysis
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)
library(stringr)

#Importing and Merging all CSV files into one dataframe
#getwd()
#setwd("C:\\Data_Analyst_Coursera\\CSV_Cleaned")
#Q1<- list.files(path='C:\\Data_Analyst_Coursera\\CSV_Cleaned') %>%
	lapply(read_csv) %>%
	bind_rows 

setwd("C:")
#Jan_2023<-read.csv("C:\\Data_Analyst_Coursera\\CSV_Cleaned\\2023_01-divvy-tripdata_cleaned.csv")

install.packages("data.table")
library(data.table)
temp<-list.files("C:\\Data_Analyst_Coursera\\CSV_Cleaned", full.names=TRUE, pattern="\\.csv$")
Q1<-rbindlist(lapply(temp,fread),fill=TRUE)

#Transform character data to duration data
#nulls out the data,no error message?
#library(lubridate)
#Q1_new<- Q1[, ride_length:=as.duration(ride_length)]


#Reviewing resulting dataframe
head(Q1)
nrow(Q1)
ncol(Q1)
str(Q1)


#Creating graphs. 
#not these graphs, but better, more telling graphs once I get the data in order. 
#Goal is to have a graph anticipating members for following months. Use smooth plot or freqpoly

ggplot(Q1, aes(x=day_of_week, y=ride_length, color=member_casual)) +
	geom_point()

ggplot(Q1, aes(x=ride_length, y=day_of_week)) +
	geom_bar()

ggplot(Q1, aes(x=started_at, y=member_casual)) +
	geom_freqpoly()

