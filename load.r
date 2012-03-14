# New effort to wrap up my dispersal experiment.
rm(list=ls())
setwd('~/Github/postdoc/dispersal_analysis')
library(data.table)
library(plyr)
library(RMySQL)
# I seem to have skipped loading the RAW data from MySQL here.
load('data/base_dispersal_data.rdata')
rm(con,year1,year2) #don't need the MySQL connection 
names(dispersal)= c("loc","dist","depth","wax1","wax2","wax3","year","moisture","true_yr","plot","week","trt","d1","d2","who")
save(dispersal, file = "data/cleaned_dispersal_data.rdata")

# Older stuff I need to integrate

library(RMySQL)
library(ggplot2)

con<-dbConnect(MySQL(),user="root",password="wfish82",dbname="dispersal",host="localhost")
year1=dbGetQuery(con,"select * from year1")
year1$TOTGOLDS= year1$W1G+year1$W2G+year1$W3G

plot1= ggplot() + geom_bar(data=year1, aes(x=Distance, ymax=TOTGOLDS), colour="steelblue", fill="steelblue", size=1, alpha=0.5, shape=1)
plot2 = plot1 + facet_grid(TRT ~ PLOT)
plot2
write(year1, file="year1.csv", sep=",")