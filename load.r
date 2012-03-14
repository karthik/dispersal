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