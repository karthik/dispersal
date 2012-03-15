rm(list=ls())
setwd('~/Github/postdoc/dispersal_analysis')
library(plyr)
library(ggplot2)
library(stringr)
library(reshape2)
load("data/cleaned_disp_data.rdata")

# remove true year temporarily
disp_data <- disp_data[, -which(names(disp_data)=="true_year")]

# Data summaries
s1 <- melt(disp_data, id.vars=1:7)
s2 <- dcast(s1, trt + period + week ~ variable, mean)
ggplot(subset(s2,period=="Y1"), aes(week,total_hits, colour=trt)) + geom_point(aes(shape=s2$period),size=3.2) + ylab("Mean number of hits")
s1a <- melt(s1, id.vars=1:2)
# Analyses

# Plots

