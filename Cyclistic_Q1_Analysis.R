#Downloading packages for analysis
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("readr")

#Loading packages for analysis
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)


#Importing and Merging all CSV files into one dataframe
getwd()
setwd("C:\\Data_Analyst_Coursera\\CSV_Cleaned")
Q1<- list.files(path='C:\\Data_Analyst_Coursera\\CSV_Cleaned') %>%
	lapply(read_csv) %>%
	bind_rows 

#Reviewing resulting dataframe
head(Q1)
nrow(Q1)
ncol(Q1)
str(Q1)


#Creating graphs 
ggplot(Q1, aes(x=day_of_week, y=ride_length, color=member_casual)) +
	geom_point()

ggplot(Q1, aes(x=ride_length, y=day_of_week)) +
	geom_bar()

ggplot(Q1, aes(x=started_at, y=member_casual)) +
	geom_freqpoly()





problems(Q1)
spec(Q1)
ride_length_c<-transform(Q1, ride_length=as.duration(ride_length))
transform(Q1, started_at=as.dttm(started_at_c))
Q1['ride_length']<- Q1 %>%
	mutate(ride_length=transform(Q1, ride_length=as.duration(ride_length)))

