#read in our full data
data<- read.csv("/Users/tue50988/Desktop/Social_Doors/aggregate_paper_data_SPSS_011119.csv")

library(reshape2)
library(ggplot2)
source("/Users/tue50988/Desktop/Social_Doors/summary_se_function.R")

data2<- melt(data,id.vars=c("Subject","ch_socialanx_lomedhi","ch_cdi_total_lomedhi"),measure.vars=c("FB_VS6new_L_Like_Correct_NZMean_1","FB_VS6new_L_Dislike_Correct_NZMean_1","FB_VS6new_L_Like_Incorrect_NZMean_1","FB_VS6new_L_Dislike_Incorrect_NZMean_1","FB_VS6new_L_WinGames_Correct_NZMean_1","FB_VS6new_L_LoseGames_Correct_NZMean_1","FB_VS6new_L_WinGames_Incorrect_NZMean_1","FB_VS6new_L_LoseGames_Incorrect_NZMean_1"))

data2$ch_socialanx_lomedhi<- as.character(data2$ch_socialanx_lomedhi)
data2$ch_cdi_total_lomedhi<- as.character(data2$ch_cdi_total_lomedhi)

anx<- summarySE(data2,measurevar="value",groupvars=c("variable","ch_socialanx_lomedhi"))

ggplot(data=anx, aes(x=variable, y=value, group=ch_socialanx_lomedhi, colour=ch_socialanx_lomedhi)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Social Anxiety")

dep<- summarySE(data2,measurevar="value",groupvars=c("variable","ch_cdi_total_lomedhi"),na.rm=TRUE)

ggplot(data=dep, aes(x=variable, y=value, group=ch_cdi_total_lomedhi, colour=ch_cdi_total_lomedhi)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Depression")





data3<- melt(data,id.vars=c("Subject","ResSocAnx_HiMedLo","ResDep_HiMedLo"),measure.vars=c("FB_VS6new_L_Like_Correct_NZMean_1","FB_VS6new_L_Dislike_Correct_NZMean_1","FB_VS6new_L_Like_Incorrect_NZMean_1","FB_VS6new_L_Dislike_Incorrect_NZMean_1","FB_VS6new_L_WinGames_Correct_NZMean_1","FB_VS6new_L_LoseGames_Correct_NZMean_1","FB_VS6new_L_WinGames_Incorrect_NZMean_1","FB_VS6new_L_LoseGames_Incorrect_NZMean_1"))

data3$ResSocAnx_HiMedLo<- as.character(data3$ResSocAnx_HiMedLo)
data3$ResDep_HiMedLo<- as.character(data3$ResDep_HiMedLo)

anx<- summarySE(data3,measurevar="value",groupvars=c("variable","ResSocAnx_HiMedLo"))

ggplot(data=anx, aes(x=variable, y=value, group=ResSocAnx_HiMedLo, colour=ResSocAnx_HiMedLo)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Social Anxiety")

dep<- summarySE(data3,measurevar="value",groupvars=c("variable","ResDep_HiMedLo"),na.rm=TRUE)

ggplot(data=dep, aes(x=variable, y=value, group=ResDep_HiMedLo, colour=ResDep_HiMedLo)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Depression")

anx<- anx[!is.na(anx$ResSocAnx_HiMedLo),]
anx$variable<- as.character(anx$variable)
anx$variable<- substr(anx$variable,13,nchar(anx$variable)-9)

anx_social<- anx[1:12,]
anx_mon<- anx[13:24,]

ggplot(data=anx_social, aes(x=ResSocAnx_HiMedLo, y=value, group=variable, colour=variable)) +
  geom_line() +
  geom_point() +
  #theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Social Anxiety Social Task")


ggplot(data=anx_mon, aes(x=variable, y=value, group=ResSocAnx_HiMedLo, colour=ResSocAnx_HiMedLo)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Social Anxiety Monetary Task")

ggplot(data=anx_social, aes(x=variable, y=value, group=ResSocAnx_HiMedLo, colour=ResSocAnx_HiMedLo)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Social Anxiety Social Task")


ggplot(data=anx_mon, aes(x=ResSocAnx_HiMedLo, y=value, group=variable, colour=variable)) +
  geom_line() +
  geom_point() +
  #theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Social Anxiety Monetary Task")



dep<- dep[!is.na(dep$ResDep_HiMedLo),]
dep$variable<- as.character(dep$variable)
dep$variable<- substr(dep$variable,13,nchar(dep$variable)-9)

dep_social<- dep[1:12,]
dep_mon<- dep[13:24,]

ggplot(data=dep_social, aes(x=ResDep_HiMedLo, y=value, group=variable, colour=variable)) +
  geom_line() +
  geom_point() +
  #theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("SA Social Task")


ggplot(data=dep_mon, aes(x=ResDep_HiMedLo, y=value, group=variable, colour=variable)) +
  geom_line() +
  geom_point() +
  #theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("SA Monetary Task")

ggplot(data=dep_social, aes(x=variable, y=value, group=ResDep_HiMedLo, colour=ResDep_HiMedLo)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Depression Social Task")


ggplot(data=dep_mon, aes(x=variable, y=value, group=ResDep_HiMedLo, colour=ResDep_HiMedLo)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  ggtitle("Depression Monetary Task")

