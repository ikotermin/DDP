######  DDP project assingment #######


library(ggplot2)
library(maps)
library(plyr)
library(dplyr)

hep <- read.csv("hepatitis.csv")

#hepatitisA
splitteddata <- t(sapply(hep$week,function(x) substring(x, first=c(1,5), last=c(4,6))))
hepatitis <- cbind(hep, splitteddata)
hepatitis <- subset(hepatitis, select=c("1","state","state_name","cases", "incidence_per_capita"))

names(hepatitis)[1] <- "year"
hepatitis <- subset(hepatitis, select=c("year","state_name","state", "incidence_per_capita"))


hepatitis$region <- tolower(hepatitis$state_name)
states <- map_data("state")
map.df <- merge(states,hepatitis, by="region", all.x=T)
map.df <- map.df[order(map.df$order),]