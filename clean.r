# clean.r
rm(list=ls())
library(ggplot2)
setwd('~/Documents/Work/Active Projects/Dispersal/analysis_2011/')
load('dispersal_cleaned.rdata')
# ````````````````````````````````````````````````````
# six weeks, 4 plots per week. so 24 plots in year1.
# ````````````````````````````````````````````````````

year1=subset(dispersal,year==1)
year1$total=year1$wax1+year1$wax2+year1$wax3
year1=year1[,-c(4,5,6,13,14,15)]
year1$loc[year1$loc=="Center "]="Center"
year1$dist[year1$dist==1]=100
year1$dist[year1$dist==1.4]=140

agg <- function (data)
{
dat=ddply(data, .(dist), transform, count=sum(total))
dat=dat[,c(2,7,8,9,11)]
dat2=unique(dat)
return (dat2)
}


resulting_data = dlply(year1, .(plot), agg)
# This makes a count of each plot ignoring depth and direction

r=ldply(resulting_data)
ggplot(r, aes(dist,count,group=plot)) + geom_line() + facet_wrap(trt~week)
# plots counts of the dispersing nematodes