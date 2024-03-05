* Encoding: UTF-8.

*** 1) FOR REVISION, USE THIS FIRST ANALYSIS TO DEMONSTRATE TASK EFFECTS: TASK X GOAL X OUTCOME***

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 
    FB_VS6new_L_Dislike_Correct_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 
    FB_VS6new_L_LoseGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Goal*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_cdi_total*ch_totanx ch_totanx ch_cdi_total.


DATASET ACTIVATE DataSet1.
GLM FB_VS6new_R_Like_Correct_NZMean_1 FB_VS6new_R_Like_Incorrect_NZMean_1 
    FB_VS6new_R_Dislike_Correct_NZMean_1 FB_VS6new_R_Dislike_Incorrect_NZMean_1 
    FB_VS6new_R_WinGames_Correct_NZMean_1 FB_VS6new_R_WinGames_Incorrect_NZMean_1 
    FB_VS6new_R_LoseGames_Correct_NZMean_1 FB_VS6new_R_LoseGames_Incorrect_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Goal*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_cdi_total*ch_totanx ch_totanx ch_cdi_total.


****DECOMPOSING BASED ON CORRECTNESS

*** 2) FOR REVISION, USE THIS  ANALYSIS TO DEMONSTRATE TASK EFFECTS: TASK X GOAL  FOR CORRECT OUTCOMES***

GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Goal Goal*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Task*Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

*** 3) FOR REVISION, USE THIS  ANALYSIS TO DEMONSTRATE TASK EFFECTS: TASK X GOAL  FOR INCORRECT OUTCOMES***

GLM FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Goal Goal*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Task*Goal) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.


*** 4) FOR REVISION, USE THIS  ANALYSIS TO DEMONSTRATE VALENCE DIFFERENCES IN THE MONETARY  TASK  FOR CORRECT OUTCOMES***

* Correct outcomes: goal x anx x depression in monetary task

GLM  FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
   /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.



*~ signficant!

* THIS IS THE DECOMPOSITION OF TASK EFFECT FOR REVISIONS

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 
    FB_VS6new_L_Dislike_Correct_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 
    FB_VS6new_L_LoseGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Goal) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Goal) 
  /EMMEANS=TABLES(Task*Outcome)
  /EMMEANS=TABLES(Goal*Outcome) 
  /EMMEANS=TABLES(Task*Goal*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  

* Main effect of outcome, then goal x outcome 

GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Goal Goal*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Goal) 
  /EMMEANS=TABLES(Task)
  /EMMEANS=TABLES(Task*Goal) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)


GLM FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Goal Goal*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Goal) 
  /EMMEANS=TABLES(Task)
  /EMMEANS=TABLES(Task*Goal) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  

GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 
  /WSFACTOR=Task 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Outcome Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task)
  /EMMEANS=TABLES(Task*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)


GLM FB_VS6new_L_Dislike_Correct_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_LoseGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 
   /WSFACTOR=Task 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Outcome Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task)
  /EMMEANS=TABLES(Task*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  

GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 
    FB_VS6new_L_Dislike_Correct_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
  /WSFACTOR=Goal 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Goal*Outcome Outcome*Goal) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Goal)
  /EMMEANS=TABLES(Goal*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)


GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 
    FB_VS6new_L_LoseGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 
  /WSFACTOR=Goal 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Goal*Outcome Outcome*Goal) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Goal)
  /EMMEANS=TABLES(Goal*Outcome) 
    /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  
* END OF DECOMPOSITION FOR REVISIONS

* Incorrect outcomes: Task x goal x anx x depression

GLM FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Goal Goal*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Task*Goal) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Goal 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Goal Goal*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Goal) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Task*Goal) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

*~ NOT signficant









* Correct Social, Dislike vs Like x anxiety x depression

GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

*~ all factors are signficant!




* Correct Non-Social, Win vs Lose x anxiety x depression

GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.


*~ NOT signficant




* Incorrect Social, Dislike vs Like x anxiety x depression

GLM FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

* Incorrect Non-Social, Win vs Lose x anxiety x depression

GLM FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

* Correct Social, Dislike vs Monetary Lose x anxiety x depression

GLM FB_VS6new_L_LoseGames_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.
 * Not significant

* Correct Social, Like vs Monetary win x anxiety x depression

GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.
 *Not significant
 

* Incorrect Social, Like vs Monetary win x anxiety x depression

GLM FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.
 *Not significant
 
* Incorrect Social, Disike vs Monetary lose x anxiety x depression

GLM FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_totanx 
    ch_cdi_total
  /WSFACTOR=Task 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)COMPARE ADJ(LSD)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.
 *Not significant


****************
* DEEP DIGGING TO SEE WHAT'S DRIVING WHAT *

* Create a difference score for Correct dislike vs. like outcomes

COMPUTE FB_VS6new_L_Correct_DislikeVsLike=
    FB_VS6new_L_Dislike_Correct_NZMean_1-FB_VS6new_L_Like_Correct_NZMean_1.
EXECUTE.


* Code for Median split on anxiety and depression

RECODE ch_totanx (Lowest thru 15.50=1) (15.51 thru Highest=2) INTO ch_totanx_LoHi.
VARIABLE LABELS  ch_totanx_LoHi 'ch_totanx_LoHi: 15.50 cut point'.
EXECUTE.

RECODE ch_cdi_total (Lowest thru 9.0=1) (9.011 thru Highest=2) INTO ch_cdi_LoHi.
VARIABLE LABELS  ch_cdi_LoHi 'ch_cdi_LoHi: 9.0 cut point'.
EXECUTE.


*** this is our best bet

* Sort output based on high and low depression

SORT CASES  BY ch_cdi_LoHi.
SPLIT FILE SEPARATE BY ch_cdi_LoHi.

* Sort output based on high and low anxiety

SORT CASES  BY ch_totanx_LoHi.
SPLIT FILE SEPARATE BY ch_totanx_LoHi.

* Perform correlations - use the non-parametric ones


CORRELATIONS
  /VARIABLES=ch_totanx FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_Mean_1 
    FB_VS6new_L_Correct_DislikeVsLike
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=ch_totanx FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_Mean_1 
    FB_VS6new_L_Correct_DislikeVsLike
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES=ch_socialanx FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_Mean_1 
    FB_VS6new_L_Correct_DislikeVsLike
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=ch_socialanx FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_Mean_1 
    FB_VS6new_L_Correct_DislikeVsLike
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.



* marginally significant positive correlation for anxiety and brain with low depression
* marginally signifancnt negative correlation for anxiety and brain with high depression 





CORRELATIONS
  /VARIABLES=ch_cdi_total FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_Mean_1 
    FB_VS6new_L_Correct_DislikeVsLike
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
NONPAR CORR
  /VARIABLES=ch_cdi_total FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_Mean_1 
    FB_VS6new_L_Correct_DislikeVsLike
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.


*SELECT CASES then correct task x valence 

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1
  /WSFACTOR=Task 2 Polynomial Valence 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Valence) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Valence) 
  /EMMEANS=TABLES(Task*Valence) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Valence Task*Valence.

* SELECT CASES then incorrect task x valence 

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Valence 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Valence) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Valence) 
  /EMMEANS=TABLES(Task*Valence) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Valence Task*Valence.

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 WITH ch_cdi_total 
    ch_socialanx
  /WSFACTOR=Task 2 Polynomial Valence 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Valence) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_cdi_total*ch_socialanx ch_cdi_total ch_socialanx.

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 
    FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 WITH ch_cdi_total 
    ch_socialanx
  /WSFACTOR=Task 2 Polynomial Valence 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Task*Valence) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_cdi_total*ch_socialanx ch_cdi_total ch_socialanx.
