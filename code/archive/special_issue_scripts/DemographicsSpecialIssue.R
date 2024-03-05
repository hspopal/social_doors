library(reshape2)
library(ggplot2)
source("/Users/tue50988/Desktop/Social_Doors/summary_se_function.R")

data<- read.csv("/Users/tue50988/Desktop/Social_Doors/aggregate_paper_data_010818.csv")

#subset to only demographic and clinical columns
data<- data[,c(2,2027:2039)]

socialanx<- summarySE(data,measurevar="ch_socialanx",na.rm=TRUE)
depression<- summarySE(data,measurevar="ch_cdi_total",na.rm=TRUE)
age<- summarySE(data,measurevar="age",na.rm=TRUE)

table(data$gender)
 

table(data$race)
