# New effort to wrap up my dispersal experiment.
rm(list=ls())
setwd('~/Github/postdoc/dispersal_analysis')
library(data.table)
library(plyr)
library(stringr)
load("data/raw_dispersal.rdata")

names(year1) <- tolower(names(year1))
year1 <- year1[,-which(names(year1)=="total")]
names(year2) <- tolower(names(year2))
year1 <- year1[, -which(names(year1)=="year")]
year2 <- year2[, -which(names(year2)=="year")]
year1$period <- "Y1"
year2$period <- "Y2"
disp_data <- rbind(year1, year2)

# Cleaning up field names
disp_data$location <- str_trim(tolower(disp_data$location), side = "both")
disp_data$total_hits <- disp_data$g_w1 + disp_data$g_w2 + disp_data$g_w3
names(disp_data)[which(names(disp_data)=="treatment")]="trt"
# Clean up dates
disp_data$d1 <- as.Date(disp_data$d1)
disp_data$d2 <- as.Date(disp_data$d2)
disp_data$distance <- round(disp_data$distance,0)
disp_data$treatment <- as.factor(disp_data$treatment)
disp_data$week <- as.factor(disp_data$week)

save(disp_data, file="data/cleaned_disp_data.rdata")