#read in our full data
data<- read.csv("/Users/tue50988/Desktop/Social_Doors/Data/aggregate_paper_data_SPSS_020419.csv")
means<- read.csv("/Users/tue50988/Desktop/Social_Doors/Data/EstimatedMarginalMeans.csv")
means<- read.csv("/Users/tue50988/Desktop/Social_Doors/Data/estimatedmarginalmeans_new.csv")


library(reshape2)
library(ggplot2)
source("/Users/tue50988/Desktop/Social_Doors/summary_se_function.R")

means2<- means
means3<- means
means4<- means

monetary_social_likewin_correct<- t.test(data$FB_VS6new_L_WinGames_Correct_NZMean_1,data$FB_VS6new_L_Like_Correct_NZMean_1,paired=TRUE)
monetary_social_likewin_incorrect<- t.test(data$FB_VS6new_L_WinGames_Incorrect_NZMean_1,data$FB_VS6new_L_Like_Incorrect_NZMean_1,paired=TRUE)
monetary_social_dislikelose_correct<- t.test(data$FB_VS6new_L_LoseGames_Correct_NZMean_1,data$FB_VS6new_L_Dislike_Correct_NZMean_1,paired=TRUE)
monetary_social_dislikelose_incorrect<- t.test(data$FB_VS6new_L_LoseGames_Incorrect_NZMean_1,data$FB_VS6new_L_Dislike_Incorrect_NZMean_1,paired=TRUE)

social_like_correctincorrect<- t.test(data$FB_VS6new_L_Like_Correct_NZMean_1,data$FB_VS6new_L_Like_Incorrect_NZMean_1,paired=TRUE)
social_dislike_correctincorrect<- t.test(data$FB_VS6new_L_Dislike_Correct_NZMean_1,data$FB_VS6new_L_Dislike_Incorrect_NZMean_1,paired=TRUE)
monetary_win_correctincorrect<- t.test(data$FB_VS6new_L_WinGames_Correct_NZMean_1,data$FB_VS6new_L_WinGames_Incorrect_NZMean_1,paired=TRUE)
monetary_lose_correctincorrect<- t.test(data$FB_VS6new_L_LoseGames_Correct_NZMean_1,data$FB_VS6new_L_LoseGames_Incorrect_NZMean_1,paired=TRUE)

social_likedislike_correct<- t.test(data$FB_VS6new_L_Dislike_Correct_NZMean_1,data$FB_VS6new_L_Like_Correct_NZMean_1,paired=TRUE)
social_likedislike_incorrect<- t.test(data$FB_VS6new_L_Dislike_Incorrect_NZMean_1,data$FB_VS6new_L_Like_Incorrect_NZMean_1,paired=TRUE)
monetary_winlose_correct<- t.test(data$FB_VS6new_L_WinGames_Correct_NZMean_1,data$FB_VS6new_L_LoseGames_Correct_NZMean_1,paired=TRUE)
monetary_winlose_inccorrect<- t.test(data$FB_VS6new_L_WinGames_Incorrect_NZMean_1,data$FB_VS6new_L_LoseGames_Incorrect_NZMean_1,paired=TRUE)




### Estimated Marginal Means Correct and Incorrect Graphs ####

means_long<- melt(means,measurevar=c("social_like_correct","social_dislike_correct","monetary_win_correct","monetary_lose_correct"),id.vars=c("social_like_incorrect","social_dislike_incorrect","monetary_win_incorrect","monetary_lose_incorrect"))
means_long$task<- c("2social","2social","1monetary","1monetary")
means_long$games<- c("1like/win","2dislike/lose","1like/win","2dislike/lose")

ggplot(data=means_long, aes(x=task, y=value, group=games, colour=games, linetype=games)) +
  geom_line(lwd=2) +
  geom_point(size=3) +
  scale_x_discrete(breaks=c("1monetary", "2social"),labels=c("Monetary","Social")) +
  xlab("Task") +
  ylab("Estimated Marginal Means") +
  scale_colour_manual(values=c("#D55E00","#56B4E9")) +
  #scale_colour_manual(name="Valence", breaks=c("1like/win", "2dislike/lose"),labels=c("Like/Win", "Dislike/Lose"),values=c("#D55E00","#56B4E9")) +
  ylim(-.15,.02)


means2_long<- melt(means,measurevar=c("social_like_incorrect","social_dislike_incorrect","monetary_win_incorrect","monetary_lose_incorrect"),id.vars=c("social_like_correct","social_dislike_correct","monetary_win_correct","monetary_lose_correct"))
means2_long$task<- c("2social","2social","1monetary","1monetary")
means2_long$games<- c("1like/win","2dislike/lose","1like/win","2dislike/lose")

ggplot(data=means2_long, aes(x=task, y=value, group=games, colour=games, linetype=games)) +
  geom_line(lwd=2) +
  geom_point(size=3) +
  scale_colour_manual(name="Valence", breaks=c("1like/win", "2dislike/lose"),labels=c("Like/Win", "Dislike/Lose"),values=c("#D55E00","#56B4E9")) +
  scale_x_discrete(breaks=c("1monetary", "2social"),labels=c("Monetary","Social")) +
  xlab("Task") +
  ylab("Estimated Marginal Means") +
  ylim(-.15,.02)


meansSE<- summarySE(means2_long,measurevar="value",groupvars=c("task","games"))

ggplot(data=meansSE, aes(x=task, y=value, fill=games)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task X Valence") +
  ylab("Estimated Marginal Means \nSubtraction Correct Minus Incorrect") +
  ggtitle("Task X Valence Correct - Incorrect controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("social_like_correctmincorrect", "social_dislike_correctmincorrect","monetary_win_correctmincorrect","monetary_lose_correctmincorrect"),labels=c("social like","social dislike","monetary win","monetary lose"))



########### Correlation Graphs ############
data$social_dislikevlike_correct<- data$FB_VS6new_L_Dislike_Correct_NZMean_1-data$FB_VS6new_L_Like_Correct_NZMean_1
data$ch_cdi_LoHi<- as.character(data$ch_cdi_LoHi)
data<- data[! is.na(data$ch_cdi_total),]

ggplot(data=data, aes(x=ch_totanx, y=social_dislikevlike_correct, group=ch_cdi_LoHi, shape=ch_cdi_LoHi, colour=ch_cdi_LoHi)) +
  geom_point(size=3) +
  geom_smooth(method=lm,se=FALSE,fullrange = TRUE,lwd=2) +
  #scale_colour_manual(values=c("#0072B2","#D55E00")) +
  #scale_shape_manual(values = c(1, 17)) +
  scale_colour_manual(name="Depression", breaks=c("1", "2"),labels=c("Low", "High"), values=c("#0072B2","#D55E00")) +
  xlab("Anxiety") +
  ylab("Social Dislike - Like VS \nActivation for Correct Trials")
  #ylim(-.15,.02)

ggplot(data=data, aes(x=ch_totanx, y=social_dislikevlike_correct, group=ch_cdi_LoHi, shape=ch_cdi_LoHi, colour=ch_cdi_LoHi)) +
  geom_point(size=3) +
  geom_smooth(method=lm,se=FALSE,fullrange = TRUE,lwd=2) +
  #scale_colour_manual(values=c("#0072B2","#D55E00")) +
  #scale_shape_manual(values = c(1, 17)) +
  scale_colour_manual(name="Depression", breaks=c("1", "2"),labels=c("Low", "High"), values=c("#0072B2","#CCCCCC")) +
  xlab("Anxiety") +
  ylab("Social Dislike - Like VS \nActivation for Correct Trials")
#ylim(-.15,.02)

data$anxdepgroup<- NA

for (j in 1:nrow(data)){
if (data$ch_cdi_LoHi[j]=="1" & data$ch_totanx_LoHi[j]=="1"){
  data$anxdepgroup[j]<- "low/low"
} else if (data$ch_cdi_LoHi[j]=="1" & data$ch_totanx_LoHi[j]=="2"){
  data$anxdepgroup[j]<- "low/high"
} else if (data$ch_cdi_LoHi[j]=="2" & data$ch_totanx_LoHi[j]=="1"){
  data$anxdepgroup[j]<- "high/low"
} else if (data$ch_cdi_LoHi[j]=="2" & data$ch_totanx_LoHi[j]=="2"){
  data$anxdepgroup[j]<- "high/high"
} 
}

anxmed<- summarySE(data,measurevar="social_dislikevlike_correct",groupvars="data$anxdepgroup")
names(anxmed)[1]<- "group"

ggplot(data=anxmed, aes(x=group, y=social_dislikevlike_correct, fill=group)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task X Valence") +
  ylab("Estimated Marginal Means \nSubtraction Correct Minus Incorrect") +
  ggtitle("Task X Valence Correct - Incorrect controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("social_like_correctmincorrect", "social_dislike_correctmincorrect","monetary_win_correctmincorrect","monetary_lose_correctmincorrect"),labels=c("social like","social dislike","monetary win","monetary lose"))

data$ch_totanx_LoHi<- as.character(data$ch_totanx_LoHi)
data<- data[! is.na(data$ch_totanx_LoHi),]

ggplot(data=data, aes(x=ch_cdi_total, y=social_dislikevlike_correct, group=ch_totanx_LoHi, colour=ch_totanx_LoHi)) +
  geom_point(size=3) +
  geom_smooth(method=lm,se=FALSE,fullrange = TRUE,lwd=2) +
  scale_colour_manual(name="Anxiety", breaks=c("1", "2"),labels=c("Low", "High"), values=c("blue","red")) +
  xlab("Depression") +
  ylab("Social Dislike - Like VS \nActivation for Correct Trials")
#ylim(-.15,.02)

data$average_Dislike_Like_Correct<- NA
data$average_Win_Lose_Correct<- NA
data$average_Correct<- NA

for (i in 1:nrow(data)){
data$average_Dislike_Like_Correct[i]<- rowMeans(data[i,c("FB_VS6new_L_Dislike_Correct_NZMean_1","FB_VS6new_L_Like_Correct_NZMean_1")],na.rm=TRUE)
data$average_Win_Lose_Correct[i]<- rowMeans(data[i,c("FB_VS6new_L_WinGames_Correct_NZMean_1","FB_VS6new_L_LoseGames_Correct_NZMean_1")],na.rm=TRUE)
data$average_Correct[i]<- rowMeans(data[i,c("average_Dislike_Like_Correct","average_Win_Lose_Correct")],na.rm=TRUE)

}

pdf("/Users/tue50988/Desktop/Social_Doors/SPSS Output and Graphs/Correct_VS_Activation_Graphs.pdf")

ggplot(data=data, aes(x=ch_totanx, y=FB_VS6new_L_Dislike_Correct_NZMean_1, group=ch_cdi_LoHi, colour=ch_cdi_LoHi)) +
  geom_point() +
  geom_smooth(method=lm,se=FALSE,fullrange = TRUE) +
  scale_colour_discrete(name="Depression", breaks=c("1", "2"),labels=c("Low", "High")) +
  xlab("Anxiety") +
  ylab("Social Dislike VS \nActivation for Correct Trials")
#ylim(-.15,.02)


ggplot(data=data, aes(x=ch_totanx, y=FB_VS6new_L_Like_Correct_NZMean_1, group=ch_cdi_LoHi, colour=ch_cdi_LoHi)) +
  geom_point() +
  geom_smooth(method=lm,se=FALSE,fullrange = TRUE) +
  scale_colour_discrete(name="Depression", breaks=c("1", "2"),labels=c("Low", "High")) +
  xlab("Anxiety") +
  ylab("Social Like VS \nActivation for Correct Trials")
#ylim(-.15,.02)

ggplot(data=data, aes(x=ch_totanx, y=average_Dislike_Like_Correct, group=ch_cdi_LoHi, colour=ch_cdi_LoHi)) +
  geom_point() +
  geom_smooth(method=lm,se=FALSE,fullrange = TRUE) +
  scale_colour_discrete(name="Depression", breaks=c("1", "2"),labels=c("Low", "High")) +
  xlab("Anxiety") +
  ylab("Average Social Like/Dislike VS \nActivation for Correct Trials")
#ylim(-.15,.02)

ggplot(data=data, aes(x=ch_totanx, y=average_Win_Lose_Correct, group=ch_cdi_LoHi, colour=ch_cdi_LoHi)) +
  geom_point() +
  geom_smooth(method=lm,se=FALSE,fullrange = TRUE) +
  scale_colour_discrete(name="Depression", breaks=c("1", "2"),labels=c("Low", "High")) +
  xlab("Anxiety") +
  ylab("Average Monetary Win/Lose VS \nActivation for Correct Trials")
#ylim(-.15,.02)


ggplot(data=data, aes(x=ch_totanx, y=average_Correct, group=ch_cdi_LoHi, colour=ch_cdi_LoHi)) +
  geom_point() +
  geom_smooth(method=lm,se=FALSE,fullrange = TRUE) +
  scale_colour_discrete(name="Depression", breaks=c("1", "2"),labels=c("Low", "High")) +
  xlab("Anxiety") +
  ylab("Average Social & Monetary VS \nActivation for Correct Trials")
#ylim(-.15,.02)

dev.off()

### Graphs with Estimated Marginal Mean Subtractions ####

means2$social_like_correctmincorrect<- means2$social_like_correct-means2$social_like_incorrect
means2$social_dislike_correctmincorrect<- means2$social_dislike_correct-means2$social_dislike_incorrect
means2$monetary_win_correctmincorrect<- means2$monetary_win_correct-means2$monetary_win_incorrect
means2$monetary_lose_correctmincorrect<- means2$monetary_lose_correct-means2$monetary_lose_incorrect

means2_long<- melt(means2,measure.vars=c("social_like_correctmincorrect","social_dislike_correctmincorrect","monetary_win_correctmincorrect","monetary_lose_correctmincorrect"))
means2_long$task<- c("social","social","monetary","monetary")
means2_long$valence<- c("like/win","dislike/lose","like/win","dislike/lose")

ggplot(data=means2_long, aes(x=task, y=value, group=valence, colour=valence)) +
  geom_line() +
  geom_point() +
  xlab("Task") +
  ylab("Estimated Marginal Means \nSubtraction Correct Minus Incorrect") +
  ylim(-.0132,.128) +
  ggtitle("Task X Valence Correct - Incorrect controlling \nfor Social Anxiety and Depression")

ggplot(data=means2_long, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task X Valence") +
  ylab("Estimated Marginal Means \nSubtraction Correct Minus Incorrect") +
  ggtitle("Task X Valence Correct - Incorrect controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("social_like_correctmincorrect", "social_dislike_correctmincorrect","monetary_win_correctmincorrect","monetary_lose_correctmincorrect"),labels=c("social like","social dislike","monetary win","monetary lose"))

means2_long_positive<- means2_long[means2_long$valence=="like/win",]
means2_long_negative<- means2_long[means2_long$valence=="dislike/lose",]

ggplot(data=means2_long_positive, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Estimated Marginal Means \nSubtraction Correct Minus Incorrect") +
  ggtitle("Task Like/Win Correct - Incorrect controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("social_like_correctmincorrect","monetary_win_correctmincorrect"),labels=c("social like","monetary win"))

ggplot(data=means2_long_negative, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Estimated Marginal Means \nSubtraction Correct Minus Incorrect") +
  ggtitle("Task Dislike/Lose Correct - Incorrect controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("social_dislike_correctmincorrect","monetary_lose_correctmincorrect"),labels=c("social dislike","monetary lose"))




means3$social_likemdislike_correct<- means3$social_like_correct-means3$social_dislike_correct
means3$social_likemdislike_incorrect<- means3$social_like_incorrect-means3$social_dislike_incorrect
means3$monetary_winmlose_correct<- means3$monetary_win_correct-means3$monetary_lose_correct
means3$monetary_winmlose_incorrect<- means3$monetary_win_incorrect-means3$monetary_lose_incorrect

means3_long<- melt(means3,measure.vars=c("social_likemdislike_correct","social_likemdislike_incorrect","monetary_winmlose_correct","monetary_winmlose_incorrect"))
means3_long$task<- c("social","social","monetary","monetary")
means3_long$outcome<- c("correct","incorrect","correct","incorrect")

ggplot(data=means3_long, aes(x=task, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  xlab("Task") +
  ylab("Estimated Marginal Means \nSubtraction Like/Win Minus Dislike/Lose") +
  ylim(-.11,.038) +
  ggtitle("Task X Outcome Like/Win - Dislike/Lose controlling \nfor Social Anxiety and Depression")

ggplot(data=means3_long, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task X Outcome") +
  ylab("Estimated Marginal Means \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task X Outcome Like/Win Minus Dislike/Lose controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("social_likemdislike_correct", "social_likemdislike_incorrect","monetary_winmlose_correct","monetary_winmlose_incorrect"),labels=c("social correct","social incorrect","monetary correct","monetary incorrect"))

means3_long_correct<- means3_long[means3_long$outcome=="correct",]
means3_long_incorrect<- means3_long[means3_long$outcome=="incorrect",]

ggplot(data=means3_long_correct, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Estimated Marginal Means \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task Correct Like/Win - Dislike/Lose controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("social_likemdislike_correct","monetary_winmlose_correct"),labels=c("social correct","monetary correct"))

ggplot(data=means3_long_incorrect, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Estimated Marginal Means \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task Incorrect Like/Win - Dislike/Lose controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("social_likemdislike_incorrect","monetary_winmlose_incorrect"),labels=c("social incorrect","monetary incorrect"))



means4$monetarymsocial_likewin_correct<- means4$monetary_win_correct-means4$social_like_correct
means4$monetarymsocial_likewin_incorrect<- means4$monetary_win_incorrect-means4$social_like_incorrect
means4$monetarymsocial_dislikelose_correct<- means4$monetary_lose_correct-means4$social_dislike_correct
means4$monetarymsocial_dislikelose_incorrect<- means4$monetary_lose_incorrect-means4$social_dislike_incorrect

means4_long<- melt(means4,measure.vars=c("monetarymsocial_likewin_correct","monetarymsocial_likewin_incorrect","monetarymsocial_dislikelose_correct","monetarymsocial_dislikelose_incorrect"))
means4_long$valence<- c("like/win","like/win","dislike/lose","dislike/lose")
means4_long$outcome<- c("correct","incorrect","correct","incorrect")

ggplot(data=means4_long, aes(x=valence, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  xlab("Valence") +
  ylab("Estimated Marginal Means \nSubtraction Monetary Minus Social") +
  ylim(-.06,-0.04) +
  ggtitle("Valence X Outcome Monetary - Social controlling \nfor Social Anxiety and Depression")

ggplot(data=means4_long, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence") +
  ylab("Estimated Marginal Means \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Outcome Monetary - Social controlling \nfor Social Anxiety and Depression") +
theme(legend.position="none") +
  scale_x_discrete(breaks=c("monetarymsocial_likewin_correct", "monetarymsocial_likewin_incorrect","monetarymsocial_dislikelose_correct","monetarymsocial_dislikelose_incorrect"),labels=c("like/win correct","like/win incorrect","dislike/lose correct","dislike/lose incorrect"))

means4_long_correct<- means4_long[means4_long$outcome=="correct",]
means4_long_incorrect<- means4_long[means4_long$outcome=="incorrect",]

ggplot(data=means4_long_correct, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence") +
  ylab("Estimated Marginal Means \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Correct Monetary - Social controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("monetarymsocial_likewin_correct","monetarymsocial_dislikelose_correct"),labels=c("like/win correct","dislike/lose correct"))

ggplot(data=means4_long_incorrect, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence") +
  ylab("Estimated Marginal Means \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Incorrect Monetary - Social controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("monetarymsocial_likewin_incorrect","monetarymsocial_dislikelose_incorrect"),labels=c("like/win incorrect","dislike/lose incorrect"))



means4_long_likewin<- means4_long[means4_long$valence=="like/win",]
means4_long_dislikelose<- means4_long[means4_long$valence=="dislike/lose",]

ggplot(data=means4_long_likewin, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Outcome") +
  ylab("Estimated Marginal Means \nSubtraction Monetary Minus Social") +
  ggtitle("Outcome X Like/Win Monetary - Social controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("monetarymsocial_likewin_correct","monetarymsocial_likewin_incorrect"),labels=c("like/win correct","like/win incorrect"))

ggplot(data=means4_long_dislikelose, aes(x=variable, y=value, fill=variable)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Outcome") +
  ylab("Estimated Marginal Means \nSubtraction Monetary Minus Social") +
  ggtitle("Outcome X Dislike/Lose Monetary - Social controlling \nfor Social Anxiety and Depression") +
  theme(legend.position="none") +
  scale_x_discrete(breaks=c("monetarymsocial_dislikelose_correct","monetarymsocial_dislikelose_incorrect"),labels=c("dislike/lose correct","dislike/lose incorrect"))
 


### Graphs with Residuals ####

res<- data[,c(3,2265:2274)]
res_long<- melt(res,id.vars=c("Subject","Unstandardized_Residual_Social_Anxiety","Unstandardized_Residual_Depression"),measurevar=c("Unstandardized_Residual_Like_Correct","Unstandardized_Residual_Dislike_Correct","Unstandardized_Residual_Like_Incorrect","Unstandardized_Residual_Dislike_Incorrect","Unstandardized_Residual_Win_Correct","FB_VS6new_L_WinGames_Incorrect_NZMean_1","FB_VS6new_L_LoseGames_Correct_NZMean_1","FB_VS6new_L_LoseGames_Incorrect_NZMean_1"))
res_long$task<- NA
res_long$games<- NA
res_long$outcome<- NA

for (i in 1:nrow(res_long)){
  
  if(res_long$variable[i]=="Unstandardized_Residual_Like_Correct"){
    
    res_long$task[i]<- "social"
    res_long$games[i]<- "1like/win"
    res_long$outcome[i]<- "correct"
    
  } else if(res_long$variable[i]=="Unstandardized_Residual_Like_Incorrect"){
    
    res_long$task[i]<- "social"
    res_long$games[i]<- "1like/win"
    res_long$outcome[i]<- "incorrect"
    
  } else if(res_long$variable[i]=="Unstandardized_Residual_Dislike_Correct"){
    
    res_long$task[i]<- "social"
    res_long$games[i]<- "2dislike/lose"
    res_long$outcome[i]<- "correct"
    
  } else if(res_long$variable[i]=="Unstandardized_Residual_Dislike_Incorrect"){
    
    res_long$task[i]<- "social"
    res_long$games[i]<- "2dislike/lose"
    res_long$outcome[i]<- "incorrect"
    
  } else if(res_long$variable[i]=="Unstandardized_Residual_Win_Correct"){
    
    res_long$task[i]<- "monetary"
    res_long$games[i]<- "1like/win"
    res_long$outcome[i]<- "correct"
    
  } else if(res_long$variable[i]=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"){
    
    res_long$task[i]<- "monetary"
    res_long$games[i]<- "1like/win"
    res_long$outcome[i]<- "incorrect"
    
  } else if(res_long$variable[i]=="FB_VS6new_L_LoseGames_Correct_NZMean_1"){
    
    res_long$task[i]<- "monetary"
    res_long$games[i]<- "2dislike/lose"
    res_long$outcome[i]<- "correct"
  
  } else if(res_long$variable[i]=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"){
    
    res_long$task[i]<- "monetary"
    res_long$games[i]<- "2dislike/lose"
    res_long$outcome[i]<- "incorrect"
    
  }
  
}


resSE<- summarySE(res_long,measurevar="value",groupvars=c("task","games","outcome"),na.rm=T)
resSE_social<- resSE[resSE$task=="social",]
resSE_monetary<- resSE[resSE$task=="monetary",]

options(scipen=999)


ggplot(data=resSE_social, aes(x=games, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  scale_x_discrete(breaks=c("1like/win", "2dislike/lose"),labels=c("like","dislike")) +
  xlab("Valence") +
  ylab("Residuals") +
  ylim(-0.000000000072,0.000000000072) +
  ggtitle("Residuals Social Valence X Outcome")

ggplot(data=resSE_monetary, aes(x=games, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  scale_x_discrete(breaks=c("1like/win", "2dislike/lose"),labels=c("win","lose")) +
  xlab("Valence") +
  ylab("Residuals") +
  ylim(-0.000000000072,0.000000000072) +
  ggtitle("Residuals Monetary Valence X Outcome")

ggplot(data=res_long[res_long$task=='social'& res_long$games=='1like/win' & res_long$outcome=="correct",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Social Like Correct Residual") +
  ylim(-.51,.5) +
  ggtitle("Social Like Correct Residual X Social Anxiety Residual")

ggplot(data=res_long[res_long$task=='social'& res_long$games=='1like/win' & res_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Social Like Incorrect Residual") +
  ylim(-.51,.5) +
  ggtitle("Social Like Incorrect Residual X Social Anxiety Residual")

ggplot(data=res_long[res_long$task=='social'& res_long$games=='2dislike/lose' & res_long$outcome=="correct",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Social Dislike Correct Residual") +
  ylim(-.51,.5) +
  ggtitle("Social Dislike Correct Residual X Social Anxiety Residual")

ggplot(data=res_long[res_long$task=='social'& res_long$games=='2dislike/lose' & res_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Social Dislike Incorrect Residual") +
  ylim(-.51,.5) +
  ggtitle("Social Dislike Incorrect Residual X Social Anxiety Residual")


ggplot(data=res_long[res_long$task=='monetary'& res_long$games=='1like/win' & res_long$outcome=="correct",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Monetary Win Correct Residual") +
  ylim(-.51,.5) +
  ggtitle("Monetary Win Correct Residual X Social Anxiety Residual")

ggplot(data=res_long[res_long$task=='monetary'& res_long$games=='1like/win' & res_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Monetary Win Incorrect Residual") +
  ylim(-.51,.5) +
  ggtitle("Monetary Win Incorrect Residual X Social Anxiety Residual")

ggplot(data=res_long[res_long$task=='monetary'& res_long$games=='2dislike/lose' & res_long$outcome=="correct",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Monetary Lose Correct Residual") +
  ylim(-.51,.5) +
  ggtitle("Monetary Lose Correct Residual X Social Anxiety Residual")

ggplot(data=res_long[res_long$task=='monetary'& res_long$games=='2dislike/lose' & res_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Monetary Lose Incorrect Residual") +
  ylim(-.51,.5) +
  ggtitle("Monetary Lose Incorrect Residual X Social Anxiety Residual")




ggplot(data=res_long[res_long$task=='social'& res_long$games=='1like/win' & res_long$outcome=="correct",], aes(x=Unstandardized_Residual_Depression, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Social Like Correct Residual") +
  ylim(-.51,.5) +
  ggtitle("Social Like Correct Residual X Depression Residual")

ggplot(data=res_long[res_long$task=='social'& res_long$games=='1like/win' & res_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Depression, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Social Like Incorrect Residual") +
  ylim(-.51,.5) +
  ggtitle("Social Like Incorrect Residual X Depression Residual")

ggplot(data=res_long[res_long$task=='social'& res_long$games=='2dislike/lose' & res_long$outcome=="correct",], aes(x=Unstandardized_Residual_Depression, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Social Dislike Correct Residual") +
  ylim(-.51,.5) +
  ggtitle("Social Dislike Correct Residual X Depression Residual")

ggplot(data=res_long[res_long$task=='social'& res_long$games=='2dislike/lose' & res_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Depression, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Social Dislike Incorrect Residual") +
  ylim(-.51,.5) +
  ggtitle("Social Dislike Incorrect Residual X Depression Residual")


ggplot(data=res_long[res_long$task=='monetary'& res_long$games=='1like/win' & res_long$outcome=="correct",], aes(x=Unstandardized_Residual_Depression, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Monetary Win Correct Residual") +
  ylim(-.51,.5) +
  ggtitle("Monetary Win Correct Residual X Depression Residual")

ggplot(data=res_long[res_long$task=='monetary'& res_long$games=='1like/win' & res_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Depression, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Monetary Win Incorrect Residual") +
  ylim(-.51,.5) +
  ggtitle("Monetary Win Incorrect Residual X Depression Residual")

ggplot(data=res_long[res_long$task=='monetary'& res_long$games=='2dislike/lose' & res_long$outcome=="correct",], aes(x=Unstandardized_Residual_Depression, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Monetary Lose Correct Residual") +
  ylim(-.51,.5) +
  ggtitle("Monetary Lose Correct Residual X Depression Residual")

ggplot(data=res_long[res_long$task=='monetary'& res_long$games=='2dislike/lose' & res_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Depression, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Monetary Lose Incorrect Residual") +
  ylim(-.51,.5) +
  ggtitle("Monetary Lose Incorrect Residual X Depression Residual")




### Graphs with Residuals Subtractions ####

res2<- res

res2$social_like_correctmincorrect<- res2$Unstandardized_Residual_Like_Correct-res2$Unstandardized_Residual_Like_Incorrect
res2$social_dislike_correctmincorrect<- res2$Unstandardized_Residual_Dislike_Correct-res2$Unstandardized_Residual_Dislike_Incorrect
res2$monetary_win_correctmincorrect<- res2$Unstandardized_Residual_Win_Correct-res2$FB_VS6new_L_WinGames_Incorrect_NZMean_1
res2$monetary_lose_correctmincorrect<- res2$FB_VS6new_L_LoseGames_Correct_NZMean_1-res2$FB_VS6new_L_LoseGames_Incorrect_NZMean_1

res2_long<- melt(res2,measure.vars=c("social_like_correctmincorrect","social_dislike_correctmincorrect","monetary_win_correctmincorrect","monetary_lose_correctmincorrect"))


for (i in 1:nrow(res2_long)){
  
  if(res2_long$variable[i]=="social_like_correctmincorrect"){
    
    res2_long$task[i]<- "social"
    res2_long$games[i]<- "1like/win"

  } else if(res2_long$variable[i]=="social_dislike_correctmincorrect"){
    
    res2_long$task[i]<- "social"
    res2_long$games[i]<- "2dislike/lose"

  }  else if(res2_long$variable[i]=="monetary_win_correctmincorrect"){
    
    res2_long$task[i]<- "monetary"
    res2_long$games[i]<- "1like/win"

  } else if(res2_long$variable[i]=="monetary_lose_correctmincorrect"){
    
    res2_long$task[i]<- "monetary"
    res2_long$games[i]<- "2dislike/lose"

  } 
  
}


res2SE<- summarySE(res2_long,measurevar="value",groupvars=c("task","games"),na.rm=T)
res2SE_social<- res2SE[res2SE$task=="social",]
res2SE_monetary<- res2SE[res2SE$task=="monetary",]


ggplot(data=res2SE, aes(x=task, y=value, group=games, colour=games)) +
  geom_line() +
  geom_point() +
  xlab("Task") +
  ylab("Residuals \nSubtraction Correct Minus Incorrect") +
  #ylim(-.0132,.128) +
  ggtitle("Task X Valence Correct - Incorrect Residuals")

ggplot(data=res2SE, aes(x=task, y=value, fill=games)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task X Valence") +
  ylab("Residuals \nSubtraction Correct Minus Incorrect") +
  ggtitle("Task X Valence Correct - Incorrect Residuals") 

ggplot(data=res2SE[res2SE$games=="1like/win",], aes(x=task, y=value, fill=task)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Residuals \nSubtraction Correct Minus Incorrect") +
  ggtitle("Task Like/Win Correct - Incorrect Residuals") +
  theme(legend.position="none")

ggplot(data=res2SE[res2SE$games=="2dislike/lose",], aes(x=task, y=value, fill=task)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Residuals \nSubtraction Correct Minus Incorrect") +
  ggtitle("Task Dislike/Lose Correct - Incorrect Residuals") +
  theme(legend.position="none")








res3<- res

res3$social_likemdislike_correct<- res3$Unstandardized_Residual_Like_Correct-res3$Unstandardized_Residual_Dislike_Correct
res3$social_likemdislike_incorrect<- res3$Unstandardized_Residual_Like_Incorrect-res3$Unstandardized_Residual_Dislike_Incorrect
res3$monetary_winmlose_correct<- res3$Unstandardized_Residual_Win_Correct-res3$FB_VS6new_L_LoseGames_Correct_NZMean_1
res3$monetary_winmlose_incorrect<- res3$FB_VS6new_L_WinGames_Incorrect_NZMean_1-res3$FB_VS6new_L_LoseGames_Incorrect_NZMean_1

res3_long<- melt(res3,measure.vars=c("social_likemdislike_correct","social_likemdislike_incorrect","monetary_winmlose_correct","monetary_winmlose_incorrect"))


for (i in 1:nrow(res3_long)){
  
  if(res3_long$variable[i]=="social_likemdislike_correct"){
    
    res3_long$task[i]<- "social"
    res3_long$outcome[i]<- "correct"
    
  } else if(res3_long$variable[i]=="social_likemdislike_incorrect"){
    
    res3_long$task[i]<- "social"
    res3_long$outcome[i]<- "incorrect"
    
  }  else if(res3_long$variable[i]=="monetary_winmlose_correct"){
    
    res3_long$task[i]<- "monetary"
    res3_long$outcome[i]<- "correct"
    
  } else if(res3_long$variable[i]=="monetary_winmlose_incorrect"){
    
    res3_long$task[i]<- "monetary"
    res3_long$outcome[i]<- "incorrect"
    
  } 
  
}


res3SE<- summarySE(res3_long,measurevar="value",groupvars=c("task","outcome"),na.rm=T)
res3SE_social<- res3SE[res3SE$task=="social",]
res3SE_monetary<- res3SE[res3SE$task=="monetary",]


ggplot(data=res3SE, aes(x=task, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  xlab("Task") +
  ylab("Residuals \nSubtraction Like/Win Minus Dislike/Lose") +
  #ylim(-.0132,.128) +
  ggtitle("Task X Outcome Like/Win - Dislike/Lose Residuals")

ggplot(data=res3SE, aes(x=task, y=value, fill=outcome)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task X Outcome") +
  ylab("Residuals \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task X Outcome Like/Win - Dislike/Lose Residuals") 

ggplot(data=res3SE[res3SE$outcome=="correct",], aes(x=task, y=value, fill=task)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Residuals \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task Correct Like/Win - Dislike/Lose Residuals") +
  theme(legend.position="none")

ggplot(data=res3SE[res3SE$outcome=="incorrect",], aes(x=task, y=value, fill=task)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Residuals \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task Incorrect Like/Win - Dislike/Lose Residuals") +
  theme(legend.position="none")





res4<- res

res4$monetarymsocial_likewin_correct<- res4$Unstandardized_Residual_Win_Correct-res4$Unstandardized_Residual_Like_Correct
res4$monetarymsocial_likewin_incorrect<- res4$FB_VS6new_L_WinGames_Incorrect_NZMean_1-res4$Unstandardized_Residual_Like_Incorrect
res4$monetarymsocial_dislikelose_correct<- res4$FB_VS6new_L_LoseGames_Correct_NZMean_1-res4$Unstandardized_Residual_Dislike_Correct
res4$monetarymsocial_dislikelose_incorrect<- res4$FB_VS6new_L_LoseGames_Incorrect_NZMean_1-res4$Unstandardized_Residual_Dislike_Correct

res4_long<- melt(res4,measure.vars=c("monetarymsocial_likewin_correct","monetarymsocial_likewin_incorrect","monetarymsocial_dislikelose_correct","monetarymsocial_dislikelose_incorrect"))


for (i in 1:nrow(res4_long)){
  
  if(res4_long$variable[i]=="monetarymsocial_likewin_correct"){
    
    res4_long$games[i]<- "1like/win"
    res4_long$outcome[i]<- "correct"
    
  } else if(res4_long$variable[i]=="monetarymsocial_likewin_incorrect"){
    
    res4_long$games[i]<- "1like/win"
    res4_long$outcome[i]<- "incorrect"
    
  }  else if(res4_long$variable[i]=="monetarymsocial_dislikelose_correct"){
    
    res4_long$games[i]<- "2dislike/lose"
    res4_long$outcome[i]<- "correct"
    
  } else if(res4_long$variable[i]=="monetarymsocial_dislikelose_incorrect"){
    
    res4_long$games[i]<- "2dislike/lose"
    res4_long$outcome[i]<- "incorrect"
    
  } 
  
}

res4SE<- summarySE(res4_long,measurevar="value",groupvars=c("games","outcome"),na.rm=T)
res4SE_likewin<- res4SE[res4SE$games=="1like/win",]
res4SE_dislikelose<- res4SE[res4SE$games=="2dislike/lose",]


ggplot(data=res4SE, aes(x=games, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  xlab("Valence") +
  ylab("Residuals \nSubtraction Monetary Minus Social") +
  #ylim(-.0132,.128) +
  ggtitle("Valence X Outcome Monetary - Social Residuals")

ggplot(data=res4SE, aes(x=games, y=value, fill=outcome)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence X Outcome") +
  ylab("Residuals \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Outcome Monetary - Social Residuals") 

ggplot(data=res4SE[res4SE$outcome=="correct",], aes(x=games, y=value, fill=games)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence") +
  ylab("Residuals \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Correct Monetary - Social Residuals") +
  theme(legend.position="none")

ggplot(data=res4SE[res4SE$outcome=="incorrect",], aes(x=games, y=value, fill=games)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence") +
  ylab("Residuals \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Incorrect Monetary - Social Residuals") +
  theme(legend.position="none")


ggplot(data=res4SE[res4SE$games=="1like/win",], aes(x=outcome, y=value, fill=outcome)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Outcome") +
  ylab("Residuals \nSubtraction Monetary Minus Social") +
  ggtitle("Like/Win X Outcome Monetary - Social Residuals") +
  theme(legend.position="none")

ggplot(data=res4SE[res4SE$games=="2dislike/lose",], aes(x=outcome, y=value, fill=outcome)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Outcome") +
  ylab("Residuals \nSubtraction Monetary Minus Social") +
  ggtitle("Dislike/Lose X Outcome Monetary - Social Residuals") +
  theme(legend.position="none")


### Graphs with Residuals Subtractions Correlated with SA ####

#res2 correct - incorrect
#res3 like - dislike
#res4 monetary - social



ggplot(data=res2_long[res2_long$task=="social",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Social X Valence Correct - Incorrect Residual") +
  ylim(-.76,.51) +
  ggtitle("Social X Valence Correct - Incorrect Residual X Social Anxiety Residual")


ggplot(data=res2_long[res2_long$task=="monetary",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Monetary X Valence Correct - Incorrect Residual") +
  ylim(-.76,.51) +
  ggtitle("Monetary X Valence Correct - Incorrect Residual X Social Anxiety Residual")




ggplot(data=res3_long[res3_long$task=="social",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Social X Outcome Like - Dislike Residual") +
  ylim(-.61,.61) +
  ggtitle("Social X Outcome Like - Dislike Residual X Social Anxiety Residual")


ggplot(data=res3_long[res3_long$task=="monetary",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Monetary X Outcome Win - Lose Residual") +
  ylim(-.61,.61) +
  ggtitle("Monetary X Outcome Win - Lose Residual X Social Anxiety Residual")





ggplot(data=res4_long[res4_long$games=="1like/win",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Like/Win X Outcome Monetary - Social Residual") +
  ylim(-.4,.61) +
  ggtitle("Like/Win X Outcome Monetary - Social Residual X Social Anxiety Residual")


ggplot(data=res4_long[res4_long$games=="2dislike/lose",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Dislike/Lose X Outcome Monetary - Social Residual") +
  ylim(-.4,.61) +
  ggtitle("Dislike/Lose X Outcome Monetary - Social Residual X Social Anxiety Residual")


ggplot(data=res4_long[res4_long$outcome=="correct",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Correct X Valence Monetary - Social Residual") +
  ylim(-.4,.61) +
  ggtitle("Correct X Valence Monetary - Social Residual X Social Anxiety Residual")


ggplot(data=res4_long[res4_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Social_Anxiety, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Residual") +
  ylab("Incorrect X Valence Monetary - Social Residual") +
  ylim(-.4,.61) +
  ggtitle("Incorrect X Valence Monetary - Social Residual X Social Anxiety Residual")




### Graphs with Residuals Subtractions Correlated with Depression ####

#res2 correct - incorrect
#res3 like - dislike
#res4 monetary - social



ggplot(data=res2_long[res2_long$task=="social",], aes(x=Unstandardized_Residual_Depression, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Social X Valence Correct - Incorrect Residual") +
  ylim(-.76,.51) +
  ggtitle("Social X Valence Correct - Incorrect Residual X Depression Residual")


ggplot(data=res2_long[res2_long$task=="monetary",], aes(x=Unstandardized_Residual_Depression, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Monetary X Valence Correct - Incorrect Residual") +
  ylim(-.76,.51) +
  ggtitle("Monetary X Valence Correct - Incorrect Residual X Depression Residual")




ggplot(data=res3_long[res3_long$task=="social",], aes(x=Unstandardized_Residual_Depression, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Social X Outcome Like - Dislike Residual") +
  ylim(-.61,.61) +
  ggtitle("Social X Outcome Like - Dislike Residual X Depression Residual")


ggplot(data=res3_long[res3_long$task=="monetary",], aes(x=Unstandardized_Residual_Depression, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Monetary X Outcome Win - Lose Residual") +
  ylim(-.61,.61) +
  ggtitle("Monetary X Outcome Win - Lose Residual X Depression Residual")





ggplot(data=res4_long[res4_long$games=="1like/win",], aes(x=Unstandardized_Residual_Depression, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Like/Win X Outcome Monetary - Social Residual") +
  ylim(-.4,.61) +
  ggtitle("Like/Win X Outcome Monetary - Social Residual X Depression Residual")


ggplot(data=res4_long[res4_long$games=="2dislike/lose",], aes(x=Unstandardized_Residual_Depression, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Dislike/Lose X Outcome Monetary - Social Residual") +
  ylim(-.4,.61) +
  ggtitle("Dislike/Lose X Outcome Monetary - Social Residual X Depression Residual")


ggplot(data=res4_long[res4_long$outcome=="correct",], aes(x=Unstandardized_Residual_Depression, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Correct X Valence Monetary - Social Residual") +
  ylim(-.4,.61) +
  ggtitle("Correct X Valence Monetary - Social Residual X Depression Residual")


ggplot(data=res4_long[res4_long$outcome=="incorrect",], aes(x=Unstandardized_Residual_Depression, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Residual") +
  ylab("Incorrect X Valence Monetary - Social Residual") +
  ylim(-.4,.61) +
  ggtitle("Incorrect X Valence Monetary - Social Residual X Depression Residual")







### Graphs with Raw Data ####

raw<- data[,c(3,1272:1292,1965:1985,2029,2033)]
raw<- raw[,c(1,grep("NZMean",names(raw)),44,45)]
raw_long<- melt(raw,id.vars=c("Subject","ch_socialanx","ch_cdi_total"),measurevar=c("FB_VS6new_L_Like_Correct_NZMean_1","FB_VS6new_L_Dislike_Correct_NZMean_1","FB_VS6new_L_Like_Incorrect_NZMean_1","FB_VS6new_L_Dislike_Incorrect_NZMean_1","FB_VS6new_L_WinGames_Correct_NZMean_1","FB_VS6new_L_WinGames_Incorrect_NZMean_1","FB_VS6new_L_LoseGames_Correct_NZMean_1","FB_VS6new_L_LoseGames_Incorrect_NZMean_1"))
raw_long$task<- NA
raw_long$games<- NA
raw_long$outcome<- NA

for (i in 1:nrow(raw_long)){
  
  if(raw_long$variable[i]=="FB_VS6new_L_Like_Correct_NZMean_1"){
    
    raw_long$task[i]<- "social"
    raw_long$games[i]<- "1like/win"
    raw_long$outcome[i]<- "correct"
    
  } else if(raw_long$variable[i]=="FB_VS6new_L_Like_Incorrect_NZMean_1"){
    
    raw_long$task[i]<- "social"
    raw_long$games[i]<- "1like/win"
    raw_long$outcome[i]<- "incorrect"
    
  } else if(raw_long$variable[i]=="FB_VS6new_L_Dislike_Correct_NZMean_1"){
    
    raw_long$task[i]<- "social"
    raw_long$games[i]<- "2dislike/lose"
    raw_long$outcome[i]<- "correct"
    
  } else if(raw_long$variable[i]=="FB_VS6new_L_Dislike_Incorrect_NZMean_1"){
    
    raw_long$task[i]<- "social"
    raw_long$games[i]<- "2dislike/lose"
    raw_long$outcome[i]<- "incorrect"
    
  } else if(raw_long$variable[i]=="FB_VS6new_L_WinGames_Correct_NZMean_1"){
    
    raw_long$task[i]<- "monetary"
    raw_long$games[i]<- "1like/win"
    raw_long$outcome[i]<- "correct"
    
  } else if(raw_long$variable[i]=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"){
    
    raw_long$task[i]<- "monetary"
    raw_long$games[i]<- "1like/win"
    raw_long$outcome[i]<- "incorrect"
    
  } else if(raw_long$variable[i]=="FB_VS6new_L_LoseGames_Correct_NZMean_1"){
    
    raw_long$task[i]<- "monetary"
    raw_long$games[i]<- "2dislike/lose"
    raw_long$outcome[i]<- "correct"
    
  } else if(raw_long$variable[i]=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"){
    
    raw_long$task[i]<- "monetary"
    raw_long$games[i]<- "2dislike/lose"
    raw_long$outcome[i]<- "incorrect"
    
  }
  
}


rawSE<- summarySE(raw_long,measurevar="value",groupvars=c("task","games","outcome"),na.rm=T)
rawSE_social<- rawSE[rawSE$task=="social",]
rawSE_monetary<- rawSE[rawSE$task=="monetary",]

options(scipen=999)


ggplot(data=rawSE_social, aes(x=games, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  scale_x_discrete(breaks=c("1like/win", "2dislike/lose"),labels=c("like","dislike")) +
  xlab("Valence") +
  ylab("Raw") +
  ylim(-0.12,0.06) +
  ggtitle("Raw Social Valence X Outcome")

ggplot(data=rawSE_monetary, aes(x=games, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  scale_x_discrete(breaks=c("1like/win", "2dislike/lose"),labels=c("win","lose")) +
  xlab("Valence") +
  ylab("Raw") +
  ylim(-0.12,0.06) +
  ggtitle("Raw Monetary Valence X Outcome")

ggplot(data=raw_long[raw_long$task=='social'& raw_long$games=='1like/win' & raw_long$outcome=="correct",], aes(x=ch_socialanx, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Social Like Correct Raw") +
  ylim(-1,.5) +
  ggtitle("Social Like Correct Raw X Social Anxiety Raw")

ggplot(data=raw_long[raw_long$task=='social'& raw_long$games=='1like/win' & raw_long$outcome=="incorrect",], aes(x=ch_socialanx, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Social Like Incorrect Raw") +
  ylim(-1,.5) +
  ggtitle("Social Like Incorrect Raw X Social Anxiety Raw")

ggplot(data=raw_long[raw_long$task=='social'& raw_long$games=='2dislike/lose' & raw_long$outcome=="correct",], aes(x=ch_socialanx, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Social Dislike Correct Raw") +
  ylim(-1,.5) +
  ggtitle("Social Dislike Correct Raw X Social Anxiety Raw")

ggplot(data=raw_long[raw_long$task=='social'& raw_long$games=='2dislike/lose' & raw_long$outcome=="incorrect",], aes(x=ch_socialanx, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Social Dislike Incorrect Raw") +
  ylim(-1,.5) +
  ggtitle("Social Dislike Incorrect Raw X Social Anxiety Raw")


ggplot(data=raw_long[raw_long$task=='monetary'& raw_long$games=='1like/win' & raw_long$outcome=="correct",], aes(x=ch_socialanx, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Monetary Win Correct Raw") +
  ylim(-1,.5) +
  ggtitle("Monetary Win Correct Raw X Social Anxiety Raw")

ggplot(data=raw_long[raw_long$task=='monetary'& raw_long$games=='1like/win' & raw_long$outcome=="incorrect",], aes(x=ch_socialanx, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Monetary Win Incorrect Raw") +
  ylim(-1,.5) +
  ggtitle("Monetary Win Incorrect Raw X Social Anxiety Raw")

ggplot(data=raw_long[raw_long$task=='monetary'& raw_long$games=='2dislike/lose' & raw_long$outcome=="correct",], aes(x=ch_socialanx, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Monetary Lose Correct Raw") +
  ylim(-1,.5) +
  ggtitle("Monetary Lose Correct Raw X Social Anxiety Raw")

ggplot(data=raw_long[raw_long$task=='monetary'& raw_long$games=='2dislike/lose' & raw_long$outcome=="incorrect",], aes(x=ch_socialanx, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Monetary Lose Incorrect Raw") +
  ylim(-1,.5) +
  ggtitle("Monetary Lose Incorrect Raw X Social Anxiety Raw")




ggplot(data=raw_long[raw_long$task=='social'& raw_long$games=='1like/win' & raw_long$outcome=="correct",], aes(x=ch_cdi_total, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Social Like Correct Raw") +
  ylim(-1,.5) +
  ggtitle("Social Like Correct Raw X Depression Raw")

ggplot(data=raw_long[raw_long$task=='social'& raw_long$games=='1like/win' & raw_long$outcome=="incorrect",], aes(x=ch_cdi_total, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Social Like Incorrect Raw") +
  ylim(-1,.5) +
  ggtitle("Social Like Incorrect Raw X Depression Raw")

ggplot(data=raw_long[raw_long$task=='social'& raw_long$games=='2dislike/lose' & raw_long$outcome=="correct",], aes(x=ch_cdi_total, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Social Dislike Correct Raw") +
  ylim(-1,.5) +
  ggtitle("Social Dislike Correct Raw X Depression Raw")

ggplot(data=raw_long[raw_long$task=='social'& raw_long$games=='2dislike/lose' & raw_long$outcome=="incorrect",], aes(x=ch_cdi_total, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Social Dislike Incorrect Raw") +
  ylim(-1,.5) +
  ggtitle("Social Dislike Incorrect Raw X Depression Raw")


ggplot(data=raw_long[raw_long$task=='monetary'& raw_long$games=='1like/win' & raw_long$outcome=="correct",], aes(x=ch_cdi_total, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Monetary Win Correct Raw") +
  ylim(-1,.5) +
  ggtitle("Monetary Win Correct Raw X Depression Raw")

ggplot(data=raw_long[raw_long$task=='monetary'& raw_long$games=='1like/win' & raw_long$outcome=="incorrect",], aes(x=ch_cdi_total, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Monetary Win Incorrect Raw") +
  ylim(-1,.5) +
  ggtitle("Monetary Win Incorrect Raw X Depression Raw")

ggplot(data=raw_long[raw_long$task=='monetary'& raw_long$games=='2dislike/lose' & raw_long$outcome=="correct",], aes(x=ch_cdi_total, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Monetary Lose Correct Raw") +
  ylim(-1,.5) +
  ggtitle("Monetary Lose Correct Raw X Depression Raw")

ggplot(data=raw_long[raw_long$task=='monetary'& raw_long$games=='2dislike/lose' & raw_long$outcome=="incorrect",], aes(x=ch_cdi_total, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Monetary Lose Incorrect Raw") +
  ylim(-1,.5) +
  ggtitle("Monetary Lose Incorrect Raw X Depression Raw")




### Graphs with Raw Data Subtractions ####

raw2<- raw

raw2$social_like_correctmincorrect<- raw2$FB_VS6new_L_Like_Correct_NZMean_1-raw2$FB_VS6new_L_Like_Incorrect_NZMean_1
raw2$social_dislike_correctmincorrect<- raw2$FB_VS6new_L_Dislike_Correct_NZMean_1-raw2$FB_VS6new_L_Dislike_Incorrect_NZMean_1
raw2$monetary_win_correctmincorrect<- raw2$FB_VS6new_L_WinGames_Correct_NZMean_1-raw2$FB_VS6new_L_WinGames_Incorrect_NZMean_1
raw2$monetary_lose_correctmincorrect<- raw2$FB_VS6new_L_LoseGames_Correct_NZMean_1-raw2$FB_VS6new_L_LoseGames_Incorrect_NZMean_1

raw2_long<- melt(raw2,measure.vars=c("social_like_correctmincorrect","social_dislike_correctmincorrect","monetary_win_correctmincorrect","monetary_lose_correctmincorrect"))


for (i in 1:nrow(raw2_long)){
  
  if(raw2_long$variable[i]=="social_like_correctmincorrect"){
    
    raw2_long$task[i]<- "social"
    raw2_long$games[i]<- "1like/win"
    
  } else if(raw2_long$variable[i]=="social_dislike_correctmincorrect"){
    
    raw2_long$task[i]<- "social"
    raw2_long$games[i]<- "2dislike/lose"
    
  }  else if(raw2_long$variable[i]=="monetary_win_correctmincorrect"){
    
    raw2_long$task[i]<- "monetary"
    raw2_long$games[i]<- "1like/win"
    
  } else if(raw2_long$variable[i]=="monetary_lose_correctmincorrect"){
    
    raw2_long$task[i]<- "monetary"
    raw2_long$games[i]<- "2dislike/lose"
    
  } 
  
}


raw2SE<- summarySE(raw2_long,measurevar="value",groupvars=c("task","games"),na.rm=T)
raw2SE_social<- raw2SE[raw2SE$task=="social",]
raw2SE_monetary<- raw2SE[raw2SE$task=="monetary",]


ggplot(data=raw2SE, aes(x=task, y=value, group=games, colour=games)) +
  geom_line() +
  geom_point() +
  xlab("Task") +
  ylab("Raw Subtraction Correct Minus Incorrect") +
  #ylim(-.0132,.128) +
  ggtitle("Task X Valence Correct - Incorrect Raw")

ggplot(data=raw2SE, aes(x=task, y=value, fill=games)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task X Valence") +
  ylab("Raw Subtraction Correct Minus Incorrect") +
  ggtitle("Task X Valence Correct - Incorrect Raw") 

ggplot(data=raw2SE[raw2SE$games=="1like/win",], aes(x=task, y=value, fill=task)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Raw Subtraction Correct Minus Incorrect") +
  ggtitle("Task Like/Win Correct - Incorrect Raw") +
  theme(legend.position="none")

ggplot(data=raw2SE[raw2SE$games=="2dislike/lose",], aes(x=task, y=value, fill=task)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Raw Subtraction Correct Minus Incorrect") +
  ggtitle("Task Dislike/Lose Correct - Incorrect Raw") +
  theme(legend.position="none")








raw3<- raw

raw3$social_likemdislike_correct<- raw3$FB_VS6new_L_Like_Correct_NZMean_1-raw3$FB_VS6new_L_Dislike_Correct_NZMean_1
raw3$social_likemdislike_incorrect<- raw3$FB_VS6new_L_Like_Incorrect_NZMean_1-raw3$FB_VS6new_L_Dislike_Incorrect_NZMean_1
raw3$monetary_winmlose_correct<- raw3$FB_VS6new_L_WinGames_Correct_NZMean_1-raw3$FB_VS6new_L_LoseGames_Correct_NZMean_1
raw3$monetary_winmlose_incorrect<- raw3$FB_VS6new_L_WinGames_Incorrect_NZMean_1-raw3$FB_VS6new_L_LoseGames_Incorrect_NZMean_1

raw3_long<- melt(raw3,measure.vars=c("social_likemdislike_correct","social_likemdislike_incorrect","monetary_winmlose_correct","monetary_winmlose_incorrect"))


for (i in 1:nrow(raw3_long)){
  
  if(raw3_long$variable[i]=="social_likemdislike_correct"){
    
    raw3_long$task[i]<- "social"
    raw3_long$outcome[i]<- "correct"
    
  } else if(raw3_long$variable[i]=="social_likemdislike_incorrect"){
    
    raw3_long$task[i]<- "social"
    raw3_long$outcome[i]<- "incorrect"
    
  }  else if(raw3_long$variable[i]=="monetary_winmlose_correct"){
    
    raw3_long$task[i]<- "monetary"
    raw3_long$outcome[i]<- "correct"
    
  } else if(raw3_long$variable[i]=="monetary_winmlose_incorrect"){
    
    raw3_long$task[i]<- "monetary"
    raw3_long$outcome[i]<- "incorrect"
    
  } 
  
}


raw3SE<- summarySE(raw3_long,measurevar="value",groupvars=c("task","outcome"),na.rm=T)
raw3SE_social<- raw3SE[raw3SE$task=="social",]
raw3SE_monetary<- raw3SE[raw3SE$task=="monetary",]


ggplot(data=raw3SE, aes(x=task, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  xlab("Task") +
  ylab("Raw \nSubtraction Like/Win Minus Dislike/Lose") +
  #ylim(-.0132,.128) +
  ggtitle("Task X Outcome Like/Win - Dislike/Lose Raw")

ggplot(data=raw3SE, aes(x=task, y=value, fill=outcome)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task X Outcome") +
  ylab("Raw \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task X Outcome Like/Win - Dislike/Lose Raw") 

ggplot(data=raw3SE[raw3SE$outcome=="correct",], aes(x=task, y=value, fill=task)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Raw \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task Correct Like/Win - Dislike/Lose Raw") +
  theme(legend.position="none")

ggplot(data=raw3SE[raw3SE$outcome=="incorrect",], aes(x=task, y=value, fill=task)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Task") +
  ylab("Raw \nSubtraction Like/Win Minus Dislike/Lose") +
  ggtitle("Task Incorrect Like/Win - Dislike/Lose Raw") +
  theme(legend.position="none")





raw4<- raw

raw4$monetarymsocial_likewin_correct<- raw4$FB_VS6new_L_WinGames_Correct_NZMean_1-raw4$FB_VS6new_L_Like_Correct_NZMean_1
raw4$monetarymsocial_likewin_incorrect<- raw4$FB_VS6new_L_WinGames_Incorrect_NZMean_1-raw4$FB_VS6new_L_Like_Incorrect_NZMean_1
raw4$monetarymsocial_dislikelose_correct<- raw4$FB_VS6new_L_LoseGames_Correct_NZMean_1-raw4$FB_VS6new_L_Dislike_Correct_NZMean_1
raw4$monetarymsocial_dislikelose_incorrect<- raw4$FB_VS6new_L_LoseGames_Incorrect_NZMean_1-raw4$FB_VS6new_L_Dislike_Correct_NZMean_1

raw4_long<- melt(raw4,measure.vars=c("monetarymsocial_likewin_correct","monetarymsocial_likewin_incorrect","monetarymsocial_dislikelose_correct","monetarymsocial_dislikelose_incorrect"))


for (i in 1:nrow(raw4_long)){
  
  if(raw4_long$variable[i]=="monetarymsocial_likewin_correct"){
    
    raw4_long$games[i]<- "1like/win"
    raw4_long$outcome[i]<- "correct"
    
  } else if(raw4_long$variable[i]=="monetarymsocial_likewin_incorrect"){
    
    raw4_long$games[i]<- "1like/win"
    raw4_long$outcome[i]<- "incorrect"
    
  }  else if(raw4_long$variable[i]=="monetarymsocial_dislikelose_correct"){
    
    raw4_long$games[i]<- "2dislike/lose"
    raw4_long$outcome[i]<- "correct"
    
  } else if(raw4_long$variable[i]=="monetarymsocial_dislikelose_incorrect"){
    
    raw4_long$games[i]<- "2dislike/lose"
    raw4_long$outcome[i]<- "incorrect"
    
  } 
  
}

raw4SE<- summarySE(raw4_long,measurevar="value",groupvars=c("games","outcome"),na.rm=T)
raw4SE_likewin<- raw4SE[raw4SE$games=="1like/win",]
raw4SE_dislikelose<- raw4SE[raw4SE$games=="2dislike/lose",]


ggplot(data=raw4SE, aes(x=games, y=value, group=outcome, colour=outcome)) +
  geom_line() +
  geom_point() +
  xlab("Valence") +
  ylab("Raw \nSubtraction Monetary Minus Social") +
  #ylim(-.0132,.128) +
  ggtitle("Valence X Outcome Monetary - Social Raw")

ggplot(data=raw4SE, aes(x=games, y=value, fill=outcome)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence X Outcome") +
  ylab("Raw \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Outcome Monetary - Social Raw") 

ggplot(data=raw4SE[raw4SE$outcome=="correct",], aes(x=games, y=value, fill=games)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence") +
  ylab("Raw \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Correct Monetary - Social Raw") +
  theme(legend.position="none")

ggplot(data=raw4SE[raw4SE$outcome=="incorrect",], aes(x=games, y=value, fill=games)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Valence") +
  ylab("Raw \nSubtraction Monetary Minus Social") +
  ggtitle("Valence X Incorrect Monetary - Social Raw") +
  theme(legend.position="none")


ggplot(data=raw4SE[raw4SE$games=="1like/win",], aes(x=outcome, y=value, fill=outcome)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Outcome") +
  ylab("Raw \nSubtraction Monetary Minus Social") +
  ggtitle("Like/Win X Outcome Monetary - Social Raw") +
  theme(legend.position="none")

ggplot(data=raw4SE[raw4SE$games=="2dislike/lose",], aes(x=outcome, y=value, fill=outcome)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black") +
  xlab("Outcome") +
  ylab("Raw \nSubtraction Monetary Minus Social") +
  ggtitle("Dislike/Lose X Outcome Monetary - Social Raw") +
  theme(legend.position="none")


### Graphs with Raw Data Subtractions Correlated with SA ####

#raw2 correct - incorrect
#raw3 like - dislike
#raw4 monetary - social



ggplot(data=raw2_long[raw2_long$task=="social",], aes(x=ch_socialanx, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Social X Valence Correct - Incorrect Raw") +
  ylim(-.5,.8) +
  ggtitle("Social X Valence Correct - Incorrect Raw X Social Anxiety Raw")


ggplot(data=raw2_long[raw2_long$task=="monetary",], aes(x=ch_socialanx, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Monetary X Valence Correct - Incorrect Raw") +
  ylim(-.5,.8) +
  ggtitle("Monetary X Valence Correct - Incorrect Raw X Social Anxiety Raw")




ggplot(data=raw3_long[raw3_long$task=="social",], aes(x=ch_socialanx, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Social X Outcome Like - Dislike Raw") +
  ylim(-1.5,1) +
  ggtitle("Social X Outcome Like - Dislike Raw X Social Anxiety Raw")


ggplot(data=raw3_long[raw3_long$task=="monetary",], aes(x=ch_socialanx, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Monetary X Outcome Win - Lose Raw") +
  ylim(-1.5,1) +
  ggtitle("Monetary X Outcome Win - Lose Raw X Social Anxiety Raw")





ggplot(data=raw4_long[raw4_long$games=="1like/win",], aes(x=ch_socialanx, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Like/Win X Outcome Monetary - Social Raw") +
  ylim(-.75,1.2) +
  ggtitle("Like/Win X Outcome Monetary - Social Raw X Social Anxiety Raw")


ggplot(data=raw4_long[raw4_long$games=="2dislike/lose",], aes(x=ch_socialanx, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Dislike/Lose X Outcome Monetary - Social Raw") +
  ylim(-.75,1.2) +
  ggtitle("Dislike/Lose X Outcome Monetary - Social Raw X Social Anxiety Raw")


ggplot(data=raw4_long[raw4_long$outcome=="correct",], aes(x=ch_socialanx, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Correct X Valence Monetary - Social Raw") +
  ylim(-.8,1.2) +
  ggtitle("Correct X Valence Monetary - Social Raw X Social Anxiety Raw")


ggplot(data=raw4_long[raw4_long$outcome=="incorrect",], aes(x=ch_socialanx, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Social Anxiety Raw") +
  ylab("Incorrect X Valence Monetary - Social Raw") +
  ylim(-.4,1.2) +
  ggtitle("Incorrect X Valence Monetary - Social Raw X Social Anxiety Raw")




### Graphs with Raw Data Subtractions Correlated with Depression ####

#raw2 correct - incorrect
#raw3 like - dislike
#raw4 monetary - social



ggplot(data=raw2_long[raw2_long$task=="social",], aes(x=ch_cdi_total, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Social X Valence Correct - Incorrect Raw") +
  ylim(-.5,.8) +
  ggtitle("Social X Valence Correct - Incorrect Raw X Depression Raw")


ggplot(data=raw2_long[raw2_long$task=="monetary",], aes(x=ch_cdi_total, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Monetary X Valence Correct - Incorrect Raw") +
  ylim(-.5,.8) +
  ggtitle("Monetary X Valence Correct - Incorrect Raw X Depression Raw")




ggplot(data=raw3_long[raw3_long$task=="social",], aes(x=ch_cdi_total, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Social X Outcome Like - Dislike Raw") +
  ylim(-1.2,.8) +
  ggtitle("Social X Outcome Like - Dislike Raw X Depression Raw")


ggplot(data=raw3_long[raw3_long$task=="monetary",], aes(x=ch_cdi_total, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Monetary X Outcome Win - Lose Raw") +
  ylim(-1.2,.8) +
  ggtitle("Monetary X Outcome Win - Lose Raw X Depression Raw")





ggplot(data=raw4_long[raw4_long$games=="1like/win",], aes(x=ch_cdi_total, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Like/Win X Outcome Monetary - Social Raw") +
  ylim(-.75,1.1) +
  ggtitle("Like/Win X Outcome Monetary - Social Raw X Depression Raw")


ggplot(data=raw4_long[raw4_long$games=="2dislike/lose",], aes(x=ch_cdi_total, y=value, color=outcome)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Dislike/Lose X Outcome Monetary - Social Raw") +
  ylim(-.75,1.1) +
  ggtitle("Dislike/Lose X Outcome Monetary - Social Raw X Depression Raw")


ggplot(data=raw4_long[raw4_long$outcome=="correct",], aes(x=ch_cdi_total, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Correct X Valence Monetary - Social Raw") +
  ylim(-.7,1.1) +
  ggtitle("Correct X Valence Monetary - Social Raw X Depression Raw")


ggplot(data=raw4_long[raw4_long$outcome=="incorrect",], aes(x=ch_cdi_total, y=value, color=games)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Depression Raw") +
  ylab("Incorrect X Valence Monetary - Social Raw") +
  ylim(-.7,1.1) +
  ggtitle("Incorrect X Valence Monetary - Social Raw X Depression Raw")



### Calculate Raw Data Symptom Correlations ####

social_like_correct_anx<- cor.test(raw$ch_socialanx,raw$FB_VS6new_L_Like_Correct_NZMean_1,paired=TRUE)
social_like_incorrect_anx<- cor.test(raw$ch_socialanx,raw$FB_VS6new_L_Like_Incorrect_NZMean_1,paired=TRUE)
social_dislike_correct_anx<- cor.test(raw$ch_socialanx,raw$FB_VS6new_L_Dislike_Correct_NZMean_1,paired=TRUE)
social_dislike_incorrect_anx<- cor.test(raw$ch_socialanx,raw$FB_VS6new_L_Dislike_Incorrect_NZMean_1,paired=TRUE)

monetary_like_correct_anx<- cor.test(raw$ch_socialanx,raw$FB_VS6new_L_WinGames_Correct_NZMean_1,paired=TRUE)
monetary_like_incorrect_anx<- cor.test(raw$ch_socialanx,raw$FB_VS6new_L_WinGames_Incorrect_NZMean_1,paired=TRUE)
monetary_dislike_correct_anx<- cor.test(raw$ch_socialanx,raw$FB_VS6new_L_LoseGames_Correct_NZMean_1,paired=TRUE)
monetary_dislike_incorrect_anx<- cor.test(raw$ch_socialanx,raw$FB_VS6new_L_LoseGames_Incorrect_NZMean_1,paired=TRUE)

social_like_correct_dep<- cor.test(raw$ch_cdi_total,raw$FB_VS6new_L_Like_Correct_NZMean_1,paired=TRUE)
social_like_incorrect_dep<- cor.test(raw$ch_cdi_total,raw$FB_VS6new_L_Like_Incorrect_NZMean_1,paired=TRUE)
social_dislike_correct_dep<- cor.test(raw$ch_cdi_total,raw$FB_VS6new_L_Dislike_Correct_NZMean_1,paired=TRUE)
social_dislike_incorrect_dep<- cor.test(raw$ch_cdi_total,raw$FB_VS6new_L_Dislike_Incorrect_NZMean_1,paired=TRUE)

monetary_like_correct_dep<- cor.test(raw$ch_cdi_total,raw$FB_VS6new_L_WinGames_Correct_NZMean_1,paired=TRUE)
monetary_like_incorrect_dep<- cor.test(raw$ch_cdi_total,raw$FB_VS6new_L_WinGames_Incorrect_NZMean_1,paired=TRUE)
monetary_dislike_correct_dep<- cor.test(raw$ch_cdi_total,raw$FB_VS6new_L_LoseGames_Correct_NZMean_1,paired=TRUE)
monetary_dislike_incorrect_dep<- cor.test(raw$ch_cdi_total,raw$FB_VS6new_L_LoseGames_Incorrect_NZMean_1,paired=TRUE)

### Calculate Raw Data Subtraction Symptom Correlations ####

social_like_correctmincorrect_anx<- cor.test(raw2$ch_socialanx,raw2$social_like_correctmincorrect,paired=TRUE)
social_dislike_correctmincorrect_anx<- cor.test(raw2$ch_socialanx,raw2$social_dislike_correctmincorrect,paired=TRUE)
monetary_win_correctmincorrect_anx<- cor.test(raw2$ch_socialanx,raw2$monetary_win_correctmincorrect,paired=TRUE)
monetary_lose_correctmincorrect_anx<- cor.test(raw2$ch_socialanx,raw2$monetary_lose_correctmincorrect,paired=TRUE)

social_likemdislike_correct_anx<- cor.test(raw3$ch_socialanx,raw3$social_likemdislike_correct,paired=TRUE)
social_likemdislike_incorrect_anx<- cor.test(raw3$ch_socialanx,raw3$social_likemdislike_incorrect,paired=TRUE)
monetary_winmlose_correct_anx<- cor.test(raw3$ch_socialanx,raw3$monetary_winmlose_correct,paired=TRUE)
monetary_winmlose_incorrect_anx<- cor.test(raw3$ch_socialanx,raw3$monetary_winmlose_incorrect,paired=TRUE)

monetarymsocial_likewin_correct_anx<- cor.test(raw4$ch_socialanx,raw4$monetarymsocial_likewin_correct,paired=TRUE)
monetarymsocial_likewin_incorrect_anx<- cor.test(raw4$ch_socialanx,raw4$monetarymsocial_likewin_incorrect,paired=TRUE)
monetarymsocial_dislikelose_correct_anx<- cor.test(raw4$ch_socialanx,raw4$monetarymsocial_dislikelose_correct,paired=TRUE)
monetarymsocial_dislikelose_incorrect_anx<- cor.test(raw4$ch_socialanx,raw4$monetarymsocial_dislikelose_incorrect,paired=TRUE)


social_like_correctmincorrect_dep<- cor.test(raw2$ch_cdi_total,raw2$social_like_correctmincorrect,paired=TRUE)
social_dislike_correctmincorrect_dep<- cor.test(raw2$ch_cdi_total,raw2$social_dislike_correctmincorrect,paired=TRUE)
monetary_win_correctmincorrect_dep<- cor.test(raw2$ch_cdi_total,raw2$monetary_win_correctmincorrect,paired=TRUE)
monetary_lose_correctmincorrect_dep<- cor.test(raw2$ch_cdi_total,raw2$monetary_lose_correctmincorrect,paired=TRUE)

social_likemdislike_correct_dep<- cor.test(raw3$ch_cdi_total,raw3$social_likemdislike_correct,paired=TRUE)
social_likemdislike_incorrect_dep<- cor.test(raw3$ch_cdi_total,raw3$social_likemdislike_incorrect,paired=TRUE)
monetary_winmlose_correct_dep<- cor.test(raw3$ch_cdi_total,raw3$monetary_winmlose_correct,paired=TRUE)
monetary_winmlose_incorrect_dep<- cor.test(raw3$ch_cdi_total,raw3$monetary_winmlose_incorrect,paired=TRUE)

monetarymsocial_likewin_correct_dep<- cor.test(raw4$ch_cdi_total,raw4$monetarymsocial_likewin_correct,paired=TRUE)
monetarymsocial_likewin_incorrect_dep<- cor.test(raw4$ch_cdi_total,raw4$monetarymsocial_likewin_incorrect,paired=TRUE)
monetarymsocial_dislikelose_correct_dep<- cor.test(raw4$ch_cdi_total,raw4$monetarymsocial_dislikelose_correct,paired=TRUE)
monetarymsocial_dislikelose_incorrect_dep<- cor.test(raw4$ch_cdi_total,raw4$monetarymsocial_dislikelose_incorrect,paired=TRUE)





### Paired t tests ####

monetary_social_likewin_correct<- t.test(raw$FB_VS6new_L_WinGames_Correct_NZMean_1,raw$FB_VS6new_L_Like_Correct_NZMean_1,paired=TRUE)
monetary_social_likewin_incorrect<- t.test(raw$FB_VS6new_L_WinGames_Incorrect_NZMean_1,raw$FB_VS6new_L_Like_Incorrect_NZMean_1,paired=TRUE)
monetary_social_dislikelose_correct<- t.test(raw$FB_VS6new_L_LoseGames_Correct_NZMean_1,raw$FB_VS6new_L_Dislike_Correct_NZMean_1,paired=TRUE)
monetary_social_dislikelose_incorrect<- t.test(raw$FB_VS6new_L_LoseGames_Incorrect_NZMean_1,raw$FB_VS6new_L_Dislike_Incorrect_NZMean_1,paired=TRUE)

social_like_correctincorrect<- t.test(raw$FB_VS6new_L_Like_Correct_NZMean_1,raw$FB_VS6new_L_Like_Incorrect_NZMean_1,paired=TRUE)
social_dislike_correctincorrect<- t.test(raw$FB_VS6new_L_Dislike_Correct_NZMean_1,raw$FB_VS6new_L_Dislike_Incorrect_NZMean_1,paired=TRUE)
monetary_win_correctincorrect<- t.test(raw$FB_VS6new_L_WinGames_Correct_NZMean_1,raw$FB_VS6new_L_WinGames_Incorrect_NZMean_1,paired=TRUE)
monetary_lose_correctincorrect<- t.test(raw$FB_VS6new_L_LoseGames_Correct_NZMean_1,raw$FB_VS6new_L_LoseGames_Incorrect_NZMean_1,paired=TRUE)

social_likedislike_correct<- t.test(raw$FB_VS6new_L_Dislike_Correct_NZMean_1,raw$FB_VS6new_L_Like_Correct_NZMean_1,paired=TRUE)
social_likedislike_incorrect<- t.test(raw$FB_VS6new_L_Dislike_Incorrect_NZMean_1,raw$FB_VS6new_L_Like_Incorrect_NZMean_1,paired=TRUE)
monetary_winlose_correct<- t.test(raw$FB_VS6new_L_WinGames_Correct_NZMean_1,raw$FB_VS6new_L_LoseGames_Correct_NZMean_1,paired=TRUE)
monetary_winlose_inccorrect<- t.test(raw$FB_VS6new_L_WinGames_Incorrect_NZMean_1,raw$FB_VS6new_L_LoseGames_Incorrect_NZMean_1,paired=TRUE)










####Look at individual subject Monetary Win Correct #####

ggplot(data=raw_long[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1",], aes(x=Subject, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Subject") +
  ylab("Monetary WinGames Correct") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"])), colour="blue", linetype="solid") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"])+sd(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"])), colour="orange", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"])-sd(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"])), colour="orange", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"])+(2*sd(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"]))), colour="red", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"])-(2*sd(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Correct_NZMean_1"]))), colour="red", linetype="dashed") +
   ggtitle("Monetary Win Correct Activation by Subject")


ggplot(data=raw_long[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1",], aes(x=Subject, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Subject") +
  ylab("Monetary WinGames Incorrect") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"])), colour="blue", linetype="solid") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"])+sd(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"])), colour="orange", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"])-sd(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"])), colour="orange", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"])+(2*sd(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"]))), colour="red", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"])-(2*sd(raw_long$value[raw_long$variable=="FB_VS6new_L_WinGames_Incorrect_NZMean_1"]))), colour="red", linetype="dashed") +
  ggtitle("Monetary Win Incorrect Activation by Subject")


ggplot(data=raw_long[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1",], aes(x=Subject, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Subject") +
  ylab("Monetary LoseGames Correct") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"])), colour="blue", linetype="solid") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"])+sd(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"])), colour="orange", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"])-sd(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"])), colour="orange", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"])+(2*sd(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"]))), colour="red", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"])-(2*sd(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Correct_NZMean_1"]))), colour="red", linetype="dashed") +
  ggtitle("Monetary Lose Correct Activation by Subject")

ggplot(data=raw_long[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1",], aes(x=Subject, y=value)) +
  geom_point() +
  geom_smooth(method=lm) +
  xlab("Subject") +
  ylab("Monetary LoseGames Incorrect") +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=9)) +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"])), colour="blue", linetype="solid") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"])+sd(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"])), colour="orange", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"])-sd(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"])), colour="orange", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"])+(2*sd(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"]))), colour="red", linetype="dashed") +
  geom_hline(aes(yintercept=mean(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"])-(2*sd(raw_long$value[raw_long$variable=="FB_VS6new_L_LoseGames_Incorrect_NZMean_1"]))), colour="red", linetype="dashed") +
  ggtitle("Monetary Lose Incorrect Activation by Subject")
