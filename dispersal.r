## Dispersal 
## database name: Dispersal; Table name: year1 <- this contains all 6 plots sampled in summer 2007
## I also did January 2008, and April 2008
## May did the same plots the following year?? late 08 through 09. Because she was sampling when I was starting off as a postdoc in ucsc.

library(RMySQL)
library(ggplot2)

con<-dbConnect(MySQL(),user="root",password="wfish82",dbname="dispersal",host="localhost")
year1=dbGetQuery(con,"select * from year1")
year1$TOTGOLDS= year1$W1G+year1$W2G+year1$W3G

plot1= ggplot() + geom_bar(data=year1, aes(x=Distance, ymax=TOTGOLDS), colour="steelblue", fill="steelblue", size=1, alpha=0.5, shape=1)
plot2 = plot1 + facet_grid(TRT ~ PLOT)
plot2
write(year1, file="year1.csv", sep=",")
