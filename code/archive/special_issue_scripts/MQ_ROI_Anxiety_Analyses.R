
#read in data and also the summary se function 
#source("/Volumes/SDN_Data/STUDIES/VirtualSchool1/fMRI_ANALYSES/SCRIPTS/ROI/summary_se_function.R")
library(ggplot2)

#clin <- read.csv("/Volumes/SDN_Data/STUDIES/Social_Doors/Data/Clinical Data RedCap Downloads/SPADE_DATA_2018-07-26_1315_MQ_Download.csv",skip=1)
#ant.social<- read.csv("/Volumes/SDN_Data/STUDIES/Social_Doors/fMRI_ANALYSES/MASKS/Anatomical/Ant.SocialDoors.072418/MergedRoiFile_Ant_2018-07-26.csv")
#ant.doors<- read.csv("/Volumes/SDN_Data/STUDIES/Social_Doors/fMRI_ANALYSES/MASKS/Anatomical/Ant.Doors.072418/MergedRoiFile_Ant_2018-07-26.csv")
#fb.social<- read.csv("/Volumes/SDN_Data/STUDIES/Social_Doors/fMRI_ANALYSES/MASKS/Anatomical/FB.SocialDoors.072418/MergedRoiFile_FB_2018-07-26.csv")
#fb.doors<- read.csv("/Volumes/SDN_Data/STUDIES/Social_Doors/fMRI_ANALYSES/MASKS/Anatomical/FB.Doors.072418/MergedRoiFile_FB_2018-07-26.csv")

clin <- read.csv("/Users/mquarmley/Desktop/Social_Doors/Data/Clinical Data RedCap Downloads/SPADE_DATA_2018-07-26_1315_MQ_Download.csv",skip=1)
ant.social<- read.csv("/Users/mquarmley/Desktop/Social_Doors/fMRI_ANALYSES/MASKS/Anatomical/Ant.SocialDoors.080918/MergedRoiFile_Ant_2018-08-09.csv")
ant.doors<- read.csv("/Users/mquarmley/Desktop/Social_Doors/fMRI_ANALYSES/MASKS/Anatomical/Ant.Doors.080918/MergedRoiFile_Ant_2018-08-09.csv")
fb.social<- read.csv("/Users/mquarmley/Desktop/Social_Doors/fMRI_ANALYSES/MASKS/Anatomical/FB.SocialDoors.080918/MergedRoiFile_FB_2018-08-09.csv")
fb.doors<- read.csv("/Users/mquarmley/Desktop/Social_Doors/fMRI_ANALYSES/MASKS/Anatomical/FB.Doors.080918/MergedRoiFile_FB_2018-08-09.csv")

#merge data together
data<- merge(clin,ant.social,by.x="src_subject_id",by.y="Subject")
data<- merge(data,ant.doors,by.x="src_subject_id",by.y="Subject")
data<- merge(data,fb.social,by.x="src_subject_id",by.y="Subject")
data<- merge(data,fb.doors,by.x="src_subject_id",by.y="Subject")

#Get demographics and clinical measure breakdown
age<- summarySE(data,measurevar="age",na.rm=T)
ch_scared_total<- summarySE(data,measurevar="ch_sur_scared_total",na.rm=T)
ch_scared_social<- summarySE(data,measurevar="ch_sur_scared_social",na.rm=T)
ch_ari_total<- summarySE(data,measurevar="ari_score",na.rm=T)
gender<- table(data$gender)

#make a list of ROIs to loop through
roilist<- c("Amygdala_L","Amygdala_R","Putamen_R","Putamen_L","Precuneus_R","Precuneus_L","Nucleus_Accumbens_R",
            "Nucleus_Accumbens_L","Insula_R","Insula_L","dacc_L","Caudate_R","Caudate_L","Anterior_Cingulate_R",
           "Anterior_Cingulate_L")

#roilist<- c("Nucleus_Accumbens_R")


#########################################################################
################### CREATE CONTRASTS ####################################
#########################################################################

for (i in roilist){

#ANT SOCIAL DISLIKE GAMES - LIKE GAMES
data[paste("Ant",i,"Dislike_v_Like_NZMean_1",sep="_")]<- data[paste("Ant",i,"Dislike_NZMean_1",sep="_")]-data[paste("Ant",i,"Like_NZMean_1",sep="_")]

#ANT DOORS LOSE GAMES - WIN GAMES
data[paste("Ant",i,"LoseGames_v_WinGames_NZMean_1",sep="_")]<- data[paste("Ant",i,"LoseGames_NZMean_1",sep="_")]-data[paste("Ant",i,"WinGames_NZMean_1",sep="_")]
  
#FB SOCIAL DISLIKE GAMES WIN - DISLIKE GAMES LOSE
data[paste("FB",i,"DislikeWin_v_DislikeLose_NZMean_1",sep="_")]<- data[paste("FB",i,"Dislike_Win_NZMean_1",sep="_")]-data[paste("FB",i,"Dislike_Lose_NZMean_1",sep="_")]

#FB SOCIAL LIKE GAMES WIN - LIKE GAMES LOSE
data[paste("FB",i,"LikeWin_v_LikeLose_NZMean_1",sep="_")]<- data[paste("FB",i,"Like_Win_NZMean_1",sep="_")]-data[paste("FB",i,"Like_Lose_NZMean_1",sep="_")]

#FB SOCIAL DISLIKE GAMES WIN - LIKE GAMES WIN
data[paste("FB",i,"DislikeWin_v_LikeWin_NZMean_1",sep="_")]<- data[paste("FB",i,"Dislike_Win_NZMean_1",sep="_")]-data[paste("FB",i,"Like_Win_NZMean_1",sep="_")]

#FB DOORS LOSE GAMES WIN - LOSE GAMES LOSE
data[paste("FB",i,"LoseGamesWin_v_LoseGamesLose_NZMean_1",sep="_")]<- data[paste("FB",i,"LoseGames_Win_NZMean_1",sep="_")]-data[paste("FB",i,"LoseGames_Lose_NZMean_1",sep="_")]

#FB DOORS WIN GAMES WIN - WIN GAMES LOSE
data[paste("FB",i,"WinGamesWin_v_WinGamesLose_NZMean_1",sep="_")]<- data[paste("FB",i,"WinGames_Win_NZMean_1",sep="_")]-data[paste("FB",i,"WinGames_Lose_NZMean_1",sep="_")]

#FB DOORS LOSE GAMES LOSE - WIN GAMES LOSE
data[paste("FB",i,"LoseGamesLose_v_WinGamesLose_NZMean_1",sep="_")]<- data[paste("FB",i,"LoseGames_Lose_NZMean_1",sep="_")]-data[paste("FB",i,"WinGames_Lose_NZMean_1",sep="_")]

}

write.csv(data,"/Users/mquarmley/Desktop/Social_Doors/Data/Clinical Data RedCap Downloads/SPADE_Data_Aggregate_080918.csv")

############################################################################
################### CLINICAL AND ROI SCATTERPLOTS ##########################
############################################################################

for (i in roilist){
  
  ############## CHILD SCARED TOTAL ##########################
  
  g<- ggplot(data, aes(x=ch_sur_scared_total, y=eval(parse(text=(paste("Ant",i,"Dislike_v_Like_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("Ant Social Dislike Games - Like Games Child SCARED Total by ",i,sep="")) 
  
  print(g)
  
  h<- ggplot(data, aes(x=ch_sur_scared_total, y=eval(parse(text=(paste("Ant",i,"LoseGames_v_WinGames_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("Ant Doors Lose Games - Win Games Child SCARED Total by ",i,sep="")) 
  
  print(h)
  
  j<- ggplot(data, aes(x=ch_sur_scared_total, y=eval(parse(text=(paste("FB",i,"DislikeWin_v_DislikeLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Dislike Games Win - Dislike Games Lose Child SCARED Total by ",i,sep="")) 
  
  print(j)
  
  k<- ggplot(data, aes(x=ch_sur_scared_total, y=eval(parse(text=(paste("FB",i,"LikeWin_v_LikeLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Like Games Win - Like Games Lose Child SCARED Total by ",i,sep="")) 
  
  print(k)
  
  l<- ggplot(data, aes(x=ch_sur_scared_total, y=eval(parse(text=(paste("FB",i,"DislikeWin_v_LikeWin_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Dislike Games Win - Like Games Win Child SCARED Total by ",i,sep="")) 
  
  print(l)
  
  m<- ggplot(data, aes(x=ch_sur_scared_total, y=eval(parse(text=(paste("FB",i,"LoseGamesWin_v_LoseGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Lose Games Win - Lose Games Lose Child SCARED Total by ",i,sep="")) 

  print(m)
  
  n<- ggplot(data, aes(x=ch_sur_scared_total, y=eval(parse(text=(paste("FB",i,"WinGamesWin_v_WinGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Win Games Win - Win Games Lose Child SCARED Total by ",i,sep="")) 
  
  print(n)
  
  o<- ggplot(data, aes(x=ch_sur_scared_total, y=eval(parse(text=(paste("FB",i,"LoseGamesLose_v_WinGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Lose Games Lose - Win Games Lose Child SCARED Total by ",i,sep="")) 
  
  print(o)
  
  ############## CHILD SCARED SOCIAL ##########################
  
  g<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("Ant",i,"Dislike_v_Like_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("Ant Social Dislike Games - Like Games Child SCARED Social by ",i,sep="")) 
  
  print(g)
  
  h<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("Ant",i,"LoseGames_v_WinGames_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("Ant Doors Lose Games - Win Games Child SCARED Social by ",i,sep="")) 
  
  print(h)
  
  j<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"DislikeWin_v_DislikeLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Dislike Games Win - Dislike Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(j)
  
  k<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"LikeWin_v_LikeLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Like Games Win - Like Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(k)
  
  l<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"DislikeWin_v_LikeWin_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Dislike Games Win - Like Games Win Child SCARED Social by ",i,sep="")) 
  
  print(l)
  
  m<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"LoseGamesWin_v_LoseGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Lose Games Win - Lose Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(m)
  
  n<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"WinGamesWin_v_WinGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Win Games Win - Win Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(n)
  
  o<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"LoseGamesLose_v_WinGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Lose Games Lose - Win Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(o)
  
  x<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"LoseGames_Lose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Lose Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(x)
  
  y<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"WinGames_Lose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Win Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(y)
  
  z<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"LoseGames_Win_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Lose Games Win Child SCARED Social by ",i,sep="")) 
  
  print(z)
  
  ab<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"WinGames_Win_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Win Games Win Child SCARED Social by ",i,sep="")) 
  
  print(ab)
  
  ac<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"Dislike_Lose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Dislike Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(ac)
  
  ad<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"Like_Lose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Like Games Lose Child SCARED Social by ",i,sep="")) 
  
  print(ad)
  
  ae<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"Dislike_Win_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Dislike Games Win Child SCARED Social by ",i,sep="")) 
  
  print(ae)
  
  af<- ggplot(data, aes(x=ch_sur_scared_social, y=eval(parse(text=(paste("FB",i,"Like_Win_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("SCARED Child Anxiety") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Like Games Win Child SCARED Social by ",i,sep="")) 
  
  print(af)
  
}
  
  for (i in roilist){
    
  ############## CHILD ARI TOTAL ##########################
  
  g<- ggplot(data, aes(x=ari_score , y=eval(parse(text=(paste("Ant",i,"Dislike_v_Like_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("Irritability") +
    ylab(print(i)) +
    ggtitle(paste("Ant Social Dislike Games - Like Games ARI by ",i,sep="")) 
  
  print(g)
  
  h<- ggplot(data, aes(x=ari_score , y=eval(parse(text=(paste("Ant",i,"LoseGames_v_WinGames_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("Irritability") +
    ylab(print(i)) +
    ggtitle(paste("Ant Doors Lose Games - Win Games ARI by ",i,sep="")) 
  
  print(h)
  
  j<- ggplot(data, aes(x=ari_score , y=eval(parse(text=(paste("FB",i,"DislikeWin_v_DislikeLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("Irritability") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Dislike Games Win - Dislike Games Lose ARI by ",i,sep="")) 
  
  print(j)
  
  k<- ggplot(data, aes(x=ari_score , y=eval(parse(text=(paste("FB",i,"LikeWin_v_LikeLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("Irritability") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Like Games Win - Like Games Lose ARI by ",i,sep="")) 
  
  print(k)
  
  l<- ggplot(data, aes(x=ari_score , y=eval(parse(text=(paste("FB",i,"DislikeWin_v_LikeWin_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("Irritability") +
    ylab(print(i)) +
    ggtitle(paste("FB Social Dislike Games Win - Like Games Win ARI by ",i,sep="")) 
  
  print(l)
  
  m<- ggplot(data, aes(x=ari_score , y=eval(parse(text=(paste("FB",i,"LoseGamesWin_v_LoseGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("Irritability") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Lose Games Win - Lose Games Lose ARI by ",i,sep="")) 
  
  print(m)
  
  n<- ggplot(data, aes(x=ari_score , y=eval(parse(text=(paste("FB",i,"WinGamesWin_v_WinGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("Irritability") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Win Games Win - Win Games Lose ARI by ",i,sep="")) 
  
  print(n)
  
  o<- ggplot(data, aes(x=ari_score , y=eval(parse(text=(paste("FB",i,"LoseGamesLose_v_WinGamesLose_NZMean_1",sep="_")))))) +
    geom_point() +
    geom_smooth(method=lm, se=FALSE) +
    xlab("Irritability") +
    ylab(print(i)) +
    ggtitle(paste("FB Doors Lose Games Lose - Win Games Lose ARI by ",i,sep="")) 
  
  print(o)
}


############################################################################
####################### CLINICAL AND ROI ANOVAS ############################
############################################################################







