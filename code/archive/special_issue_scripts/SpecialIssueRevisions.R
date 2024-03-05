library(reshape2)
library(ggplot2)
source("/Users/tue50988/Desktop/Social_Doors/summary_se_function.R")

data<- read.csv("/Users/tue50988/Desktop/aggregate_paper_data_SPSS_020419.csv")

data<- data[,c(3:14,2300)]

anxiety<- summarySE(data,measurevar="ch_totanx",groupvars="ch_cdi_LoHi",na.rm=TRUE)
depression<- summarySE(data,measurevar="ch_cdi_total",groupvars="ch_cdi_LoHi",na.rm=TRUE)
age<- summarySE(data,measurevar="age",groupvars="ch_cdi_LoHi",na.rm=TRUE)

table(data$gender,data$ch_cdi_LoHi)
