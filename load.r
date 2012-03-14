# This is a trial run of the Beetle disepersal data in R.
# Feb 10, 2011
# `````````````````````````````````````````````````````````````````````
rm(list=ls())
library(ggplot2)
setwd('~/Documents/Work/Active Projects/Dispersal/analysis_2011/')
load('base_dispersal_data.rdata')
rm(con,year1,year2) #don't need the MySQL connection anymore

names(dispersal)= c("loc","dist","depth","wax1","wax2","wax3","year","moisture","true_yr","plot","week","trt","d1","d2","who")

save.image(file="dispersal_cleaned.rdata")
# use this ^ file going forward #