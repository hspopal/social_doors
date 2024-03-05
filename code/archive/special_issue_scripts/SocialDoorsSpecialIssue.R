###### Load libraries and Data #####

library(reshape2)
library(ggplot2)
source("/Users/tue50988/Desktop/Social_Doors/summary_se_function.R")

#set ROI data path
#path<- "/Users/tue50988/Desktop/Social_Doors/MASKS/Anatomical"
#path<- "/Volumes/Jarcho/STUDIES/Social_Doors/Version2_SPADE_fMRI/MANUSCRIPTS/Quarmley_2019_SpecialIssue/MASKS/Anatomical/"

#read in all ROI data
AntSocial<- read.csv(paste(path,"Ant.Social.122118/MergedRoiFile_Ant_2019-01-09.csv",sep="/"))
AntDoors<- read.csv(paste(path,"Ant.Doors.122118/MergedRoiFile_Ant_2019-01-09.csv",sep="/"))
FBSocial<- read.csv(paste(path,"FB.Social.122118/MergedRoiFile_FB_2019-01-11.csv",sep="/"))
FBDoors<- read.csv(paste(path,"FB.Doors.122118/MergedRoiFile_FB_2019-01-11.csv",sep="/"))

#read in RedCap data (clinical and demographic)
#redcapdata<- read.csv("/Users/tue50988/Desktop/Social_Doors/SocialDoorsRedCapData.csv",skip=2)
#cdidata<- read.csv("/Users/tue50988/Desktop/Social_Doors/TRAIN_CDI_Data.csv")
redcapdata<- read.csv("/Volumes/Jarcho/STUDIES/Social_Doors/Version2_SPADE_fMRI/MANUSCRIPTS/Quarmley2019Frontiers/Data/SocialDoorsRedCapData.csv",skip=2)
cdidata<- read.csv("/Volumes/Jarcho/STUDIES/Social_Doors/Version2_SPADE_fMRI/MANUSCRIPTS/Quarmley2019Frontiers/Data/TRAIN_CDI_Data.csv")

#### Merge Data ####

#merge Roi data
RoiData<- merge(AntSocial,AntDoors,by="Subject", sort=FALSE)
RoiData<- merge(RoiData,FBSocial,by="Subject", sort=FALSE)
RoiData<- merge(RoiData,FBDoors,by="Subject", sort=FALSE)

#merge in depression, gender, age, social anxiety, anxiety total, and BFNE
data<- RoiData
data$ch_totanx<- redcapdata$ch_sur_scared_total[match(data$Subject,redcapdata$study_id)]
data$ch_socialanx<- redcapdata$ch_sur_scared_social[match(data$Subject,redcapdata$study_id)]
data$p_totanx<- redcapdata$pr_scared_anxiety[match(data$Subject,redcapdata$study_id)]
data$p_socialanx<- redcapdata$pr_scared_social[match(data$Subject,redcapdata$study_id)]
data$bfne<- redcapdata$ch_sur_bfneii_total[match(data$Subject,redcapdata$study_id)]
data$ch_cdi_total<- cdidata$ch_sur_cdi_total[match(data$Subject,cdidata$subject)]
data$ch_cdi_interpersonal<- cdidata$ch_sur_cdi_interpersonal[match(data$Subject,cdidata$subject)]
data$ch_cdi_anhedonia<- cdidata$ch_sur_cdi_anhedonia[match(data$Subject,cdidata$subject)]
data$p_cdi_total<- cdidata$pr_cdi_total[match(data$Subject,cdidata$subject)]
data$gender<- redcapdata$p_on_c_demo_sex[match(data$Subject,redcapdata$study_id)]
data$age<- redcapdata$p_on_c_age[match(data$Subject,redcapdata$study_id)]
data$order<- redcapdata$order[match(data$Subject,redcapdata$study_id)]


#exclude s5145 (for motion) and s024 and s5058 (for drop out due to braces)
data<- data[!data$Subject=="s5145",]
data<- data[!data$Subject=="s024",]
data<- data[!data$Subject=="s5058",]

write.csv(data,file="/Users/tue50988/Desktop/Social_Doors/aggregate_paper_data_010818.csv")





data<- read.csv("/Users/tue50988/Desktop/Social_Doors/aggregate_paper_data_010818.csv")

###### Scatterplots ######

#max SCARED social is 14 above 8 is clinically relevant
ggplot(data, aes(x=Subject, y=ch_socialanx)) +
  geom_point(shape=1) +    # Use hollow circles
  geom_smooth(method=lm)

#score 0 to 50
ggplot(data, aes(x=Subject, y=ch_cdi_total)) +
  geom_point(shape=1) +    # Use hollow circles
  geom_smooth(method=lm)


###### Imaging Scatterplots ######

########### VS L ##########

ggplot(data, aes(x=Subject, y=FB_VS_L_Like_Incorrect_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Incorrect_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Incorrect_NZMean_1)-sd(data$FB_VS_L_Like_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Incorrect_NZMean_1)+sd(data$FB_VS_L_Like_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Incorrect_NZMean_1)-2*sd(data$FB_VS_L_Like_Incorrect_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Incorrect_NZMean_1)+2*sd(data$FB_VS_L_Like_Incorrect_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("VS L Like Incorrect")

ggplot(data, aes(x=Subject, y=FB_VS_L_Dislike_Incorrect_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Incorrect_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Incorrect_NZMean_1)-sd(data$FB_VS_L_Dislike_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Incorrect_NZMean_1)+sd(data$FB_VS_L_Dislike_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Incorrect_NZMean_1)-2*sd(data$FB_VS_L_Dislike_Incorrect_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Incorrect_NZMean_1)+2*sd(data$FB_VS_L_Dislike_Incorrect_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("VS L Dislike Incorrect")
  
ggplot(data, aes(x=Subject, y=FB_VS_L_Dislike_Correct_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Correct_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Correct_NZMean_1)-sd(data$FB_VS_L_Dislike_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Correct_NZMean_1)+sd(data$FB_VS_L_Dislike_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Correct_NZMean_1)-2*sd(data$FB_VS_L_Dislike_Correct_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_VS_L_Dislike_Correct_NZMean_1)+2*sd(data$FB_VS_L_Dislike_Correct_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("VS L Dislike Correct")

ggplot(data, aes(x=Subject, y=FB_VS_L_Like_Correct_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Correct_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Correct_NZMean_1)-sd(data$FB_VS_L_Like_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Correct_NZMean_1)+sd(data$FB_VS_L_Like_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Correct_NZMean_1)-2*sd(data$FB_VS_L_Like_Correct_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_VS_L_Like_Correct_NZMean_1)+2*sd(data$FB_VS_L_Like_Correct_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("VS L Like Correct")

ggplot(data, aes(x=Subject, y=FB_VS_L_WinGames_Incorrect_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Incorrect_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Incorrect_NZMean_1)-sd(data$FB_VS_L_WinGames_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Incorrect_NZMean_1)+sd(data$FB_VS_L_WinGames_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Incorrect_NZMean_1)-2*sd(data$FB_VS_L_WinGames_Incorrect_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Incorrect_NZMean_1)+2*sd(data$FB_VS_L_WinGames_Incorrect_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("VS L Win Incorrect")

ggplot(data, aes(x=Subject, y=FB_VS_L_LoseGames_Incorrect_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Incorrect_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Incorrect_NZMean_1)-sd(data$FB_VS_L_LoseGames_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Incorrect_NZMean_1)+sd(data$FB_VS_L_LoseGames_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Incorrect_NZMean_1)-2*sd(data$FB_VS_L_LoseGames_Incorrect_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Incorrect_NZMean_1)+2*sd(data$FB_VS_L_LoseGames_Incorrect_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("VS L LoseGames Incorrect")

ggplot(data, aes(x=Subject, y=FB_VS_L_LoseGames_Correct_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Correct_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Correct_NZMean_1)-sd(data$FB_VS_L_LoseGames_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Correct_NZMean_1)+sd(data$FB_VS_L_LoseGames_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Correct_NZMean_1)-2*sd(data$FB_VS_L_LoseGames_Correct_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_VS_L_LoseGames_Correct_NZMean_1)+2*sd(data$FB_VS_L_LoseGames_Correct_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("VS L LoseGames Correct")

ggplot(data, aes(x=Subject, y=FB_VS_L_WinGames_Correct_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Correct_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Correct_NZMean_1)-sd(data$FB_VS_L_WinGames_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Correct_NZMean_1)+sd(data$FB_VS_L_WinGames_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Correct_NZMean_1)-2*sd(data$FB_VS_L_WinGames_Correct_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_VS_L_WinGames_Correct_NZMean_1)+2*sd(data$FB_VS_L_WinGames_Correct_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("VS L Win Correct")


######### NA R #########

ggplot(data, aes(x=Subject, y=FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1)-sd(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1)+sd(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1)-2*sd(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1)+2*sd(data$FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("NA R Like Incorrect")

ggplot(data, aes(x=Subject, y=FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1)-sd(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1)+sd(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1)-2*sd(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1)+2*sd(data$FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("NA R Dislike Incorrect")

ggplot(data, aes(x=Subject, y=FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1)-sd(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1)+sd(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1)-2*sd(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1)+2*sd(data$FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("NA R Dislike Correct")

ggplot(data, aes(x=Subject, y=FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1)-sd(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1)+sd(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1)-2*sd(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1)+2*sd(data$FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("NA R Like Correct")

ggplot(data, aes(x=Subject, y=FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1)-sd(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1)+sd(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1)-2*sd(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1)+2*sd(data$FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("NA R Win Incorrect")

ggplot(data, aes(x=Subject, y=FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1)-sd(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1)+sd(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1)-2*sd(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1)+2*sd(data$FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("NA R LoseGames Incorrect")

ggplot(data, aes(x=Subject, y=FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1)-sd(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1)+sd(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1)-2*sd(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1)+2*sd(data$FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("NA R LoseGames Correct")

ggplot(data, aes(x=Subject, y=FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1)) +
  geom_point(shape=1) +   
  geom_smooth(method=lm) +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1),colour="blue") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1)-sd(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1)+sd(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1),colour="green") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1)-2*sd(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1),colour="red") +
  geom_hline(yintercept=mean(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1)+2*sd(data$FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1),colour="red") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  ggtitle("NA R Win Correct")



###### Correlations #######

#correlate all the clinical variables with each other
bfne_socialanx<- cor.test(data$bfne,data$ch_socialanx)
bfne_depression<- cor.test(data$bfne,data$ch_cdi_total)
depression_socialanx<- cor.test(data$ch_cdi_total,data$ch_socialanx)

##### Loop through ROIs and do analyses ######

#make a list of ROIs I want to loop through
rois<- c("VS_L","VS_R","Anterior_Cingulate_l","Anterior_Cingulate_r","Nucleus_Accumbens_l","Nucleus_Accumbens_r")

#loop through ROIs and do a bunch of things
for (i in rois){
  
  
  
} #for (i in rois){

  