## Call needed libraries
library(Hmisc)
library(plyr)
library(dplyr)
library(lubridate)


## Set the working directory in which the data file is
setwd("~/Desktop/R_Coursera")


## import "household_power_consumption.txt" 
datas<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric" ))


## select only relevant rows
datas_filtered <-datas_filtered %>% filter( between(as.Date(datas2$Date, "%d/%m/%Y"), as.Date("2007-02-01"), as.Date("2007-02-02")))


## create the correct date-time column and remove Date and Time columns
datas_filtered<-datas_filtered %>% mutate(DateTime=strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
datas_filtered$Date<-NULL
datas_filtered$Time<-NULL


## PLOT 1

png(filename = "plot1.png", width = 480, height = 480)
hist(datas_filtered$Global_active_power, breaks=15, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
