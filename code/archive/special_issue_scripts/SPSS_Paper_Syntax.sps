* Encoding: UTF-8.
* Encoding: .
* Encoding: .

DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_L_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Like_Incorrect_NZMean_1 FB_Nucleus_Accumbens_L_Dislike_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_Dislike_Incorrect_NZMean_1 FB_Nucleus_Accumbens_L_WinGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_WinGames_Incorrect_NZMean_1 FB_Nucleus_Accumbens_L_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Anterior_Cingulate_L_Like_Correct_NZMean_1 FB_Anterior_Cingulate_L_Like_Incorrect_NZMean_1 FB_Anterior_Cingulate_L_Dislike_Correct_NZMean_1 
    FB_Anterior_Cingulate_L_Dislike_Incorrect_NZMean_1 FB_Anterior_Cingulate_L_WinGames_Correct_NZMean_1 
    FB_Anterior_Cingulate_L_WinGames_Incorrect_NZMean_1 FB_Anterior_Cingulate_L_LoseGames_Correct_NZMean_1 
    FB_Anterior_Cingulate_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Anterior_Cingulate_R_Like_Correct_NZMean_1 FB_Anterior_Cingulate_R_Like_Incorrect_NZMean_1 FB_Anterior_Cingulate_R_Dislike_Correct_NZMean_1 
    FB_Anterior_Cingulate_R_Dislike_Incorrect_NZMean_1 FB_Anterior_Cingulate_R_WinGames_Correct_NZMean_1 
    FB_Anterior_Cingulate_R_WinGames_Incorrect_NZMean_1 FB_Anterior_Cingulate_R_LoseGames_Correct_NZMean_1 
    FB_Anterior_Cingulate_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_VS_L_Like_Correct_NZMean_1 FB_VS_L_Like_Incorrect_NZMean_1 FB_VS_L_Dislike_Correct_NZMean_1 
    FB_VS_L_Dislike_Incorrect_NZMean_1 FB_VS_L_WinGames_Correct_NZMean_1 
    FB_VS_L_WinGames_Incorrect_NZMean_1 FB_VS_L_LoseGames_Correct_NZMean_1 
    FB_VS_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_VS_R_Like_Correct_NZMean_1 FB_VS_R_Like_Incorrect_NZMean_1 FB_VS_R_Dislike_Correct_NZMean_1 
    FB_VS_R_Dislike_Incorrect_NZMean_1 FB_VS_R_WinGames_Correct_NZMean_1 
    FB_VS_R_WinGames_Incorrect_NZMean_1 FB_VS_R_LoseGames_Correct_NZMean_1 
    FB_VS_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_VS10_R_Like_Correct_NZMean_1 FB_VS10_R_Like_Incorrect_NZMean_1 
    FB_VS10_R_Dislike_Correct_NZMean_1 FB_VS10_R_Dislike_Incorrect_NZMean_1 
    FB_VS10_R_WinGames_Correct_NZMean_1 FB_VS10_R_WinGames_Incorrect_NZMean_1 
    FB_VS10_R_LoseGames_Correct_NZMean_1 FB_VS10_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=task 2 Polynomial games 2 Polynomial outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID
  /PLOT=PROFILE(games*outcome*task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(task) 
  /EMMEANS=TABLES(games) 
  /EMMEANS=TABLES(outcome) 
  /EMMEANS=TABLES(task*games) 
  /EMMEANS=TABLES(task*outcome) 
  /EMMEANS=TABLES(games*outcome) 
  /EMMEANS=TABLES(task*games*outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=task games outcome task*games task*outcome games*outcome task*games*outcome.

DATASET ACTIVATE DataSet2.
GLM FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_Like_Incorrect_NZMean_1 
    FB_VS10_L_Dislike_Correct_NZMean_1 FB_VS10_L_Dislike_Incorrect_NZMean_1 
    FB_VS10_L_WinGames_Correct_NZMean_1 FB_VS10_L_WinGames_Incorrect_NZMean_1 
    FB_VS10_L_LoseGames_Correct_NZMean_1 FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=task 2 Polynomial games 2 Polynomial outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID
  /PLOT=PROFILE(games*outcome*task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(task) 
  /EMMEANS=TABLES(games) 
  /EMMEANS=TABLES(outcome) 
  /EMMEANS=TABLES(task*games) 
  /EMMEANS=TABLES(task*outcome) 
  /EMMEANS=TABLES(games*outcome) 
  /EMMEANS=TABLES(task*games*outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=task games outcome task*games task*outcome games*outcome task*games*outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Medial_Prefrontal_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal_R_Like_Incorrect_NZMean_1 FB_Medial_Prefrontal_R_Dislike_Correct_NZMean_1 
    FB_Medial_Prefrontal_R_Dislike_Incorrect_NZMean_1 FB_Medial_Prefrontal_R_WinGames_Correct_NZMean_1 
    FB_Medial_Prefrontal_R_WinGames_Incorrect_NZMean_1 FB_Medial_Prefrontal_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Medial_Prefrontal10_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal10_R_Like_Incorrect_NZMean_1 FB_Medial_Prefrontal10_R_Dislike_Correct_NZMean_1 
    FB_Medial_Prefrontal10_R_Dislike_Incorrect_NZMean_1 FB_Medial_Prefrontal10_R_WinGames_Correct_NZMean_1 
    FB_Medial_Prefrontal10_R_WinGames_Incorrect_NZMean_1 FB_Medial_Prefrontal10_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal10_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.



GLM FB_Anterior_Cingulate_L_Like_Correct_NZMean_1 FB_Anterior_Cingulate_L_Like_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_L_Dislike_Correct_NZMean_1 FB_Anterior_Cingulate_L_Dislike_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_L_WinGames_Correct_NZMean_1 FB_Anterior_Cingulate_L_WinGames_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_L_LoseGames_Correct_NZMean_1 
    FB_Anterior_Cingulate_L_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_Anterior_Cingulate_R_Like_Correct_NZMean_1 FB_Anterior_Cingulate_R_Like_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_R_Dislike_Correct_NZMean_1 FB_Anterior_Cingulate_R_Dislike_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_R_WinGames_Correct_NZMean_1 FB_Anterior_Cingulate_R_WinGames_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_R_LoseGames_Correct_NZMean_1 
    FB_Anterior_Cingulate_R_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.



GLM FB_Medial_Prefrontal_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal_R_Like_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_Dislike_Correct_NZMean_1 FB_Medial_Prefrontal_R_Dislike_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_WinGames_Correct_NZMean_1 FB_Medial_Prefrontal_R_WinGames_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.


GLM FB_VS_L_Like_Correct_NZMean_1 FB_VS_L_Like_Incorrect_NZMean_1 
    FB_VS_L_Dislike_Correct_NZMean_1 FB_VS_L_Dislike_Incorrect_NZMean_1 
    FB_VS_L_WinGames_Correct_NZMean_1 FB_VS_L_WinGames_Incorrect_NZMean_1 
    FB_VS_L_LoseGames_Correct_NZMean_1 
    FB_VS_L_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_Like_Incorrect_NZMean_1 
    FB_VS10_L_Dislike_Correct_NZMean_1 FB_VS10_L_Dislike_Incorrect_NZMean_1 
    FB_VS10_L_WinGames_Correct_NZMean_1 FB_VS10_L_WinGames_Incorrect_NZMean_1 
    FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_VS_R_Like_Correct_NZMean_1 FB_VS_R_Like_Incorrect_NZMean_1 
    FB_VS_R_Dislike_Correct_NZMean_1 FB_VS_R_Dislike_Incorrect_NZMean_1 
    FB_VS_R_WinGames_Correct_NZMean_1 FB_VS_R_WinGames_Incorrect_NZMean_1 
    FB_VS_R_LoseGames_Correct_NZMean_1 
    FB_VS_R_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_VS10_R_Like_Correct_NZMean_1 FB_VS10_R_Like_Incorrect_NZMean_1 
    FB_VS10_R_Dislike_Correct_NZMean_1 FB_VS10_R_Dislike_Incorrect_NZMean_1 
    FB_VS10_R_WinGames_Correct_NZMean_1 FB_VS10_R_WinGames_Incorrect_NZMean_1 
    FB_VS10_R_LoseGames_Correct_NZMean_1 
    FB_VS10_R_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_Nucleus_Accumbens_L_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Like_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_Dislike_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Dislike_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_L_WinGames_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_Medial_Prefrontal_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal_R_Like_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_Dislike_Correct_NZMean_1 FB_Medial_Prefrontal_R_Dislike_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_WinGames_Correct_NZMean_1 FB_Medial_Prefrontal_R_WinGames_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.

GLM FB_Medial_Prefrontal10_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal10_R_Like_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_Dislike_Correct_NZMean_1 FB_Medial_Prefrontal10_R_Dislike_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_WinGames_Correct_NZMean_1 FB_Medial_Prefrontal10_R_WinGames_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal10_R_LoseGames_Incorrect_NZMean_1 WITH ch_totanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_totanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_totanx ch_cdi_total ch_cdi_total*ch_totanx.




GLM FB_Medial_Prefrontal_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal_R_Like_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_Dislike_Correct_NZMean_1 FB_Medial_Prefrontal_R_Dislike_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_WinGames_Correct_NZMean_1 FB_Medial_Prefrontal_R_WinGames_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_Medial_Prefrontal10_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal10_R_Like_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_Dislike_Correct_NZMean_1 FB_Medial_Prefrontal10_R_Dislike_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_WinGames_Correct_NZMean_1 FB_Medial_Prefrontal10_R_WinGames_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal10_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.


GLM FB_VS_L_Like_Correct_NZMean_1 FB_VS_L_Like_Incorrect_NZMean_1 
    FB_VS_L_Dislike_Correct_NZMean_1 FB_VS_L_Dislike_Incorrect_NZMean_1 
    FB_VS_L_WinGames_Correct_NZMean_1 FB_VS_L_WinGames_Incorrect_NZMean_1 
    FB_VS_L_LoseGames_Correct_NZMean_1 
    FB_VS_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_Like_Incorrect_NZMean_1 
    FB_VS10_L_Dislike_Correct_NZMean_1 FB_VS10_L_Dislike_Incorrect_NZMean_1 
    FB_VS10_L_WinGames_Correct_NZMean_1 FB_VS10_L_WinGames_Incorrect_NZMean_1 
    FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_VS_R_Like_Correct_NZMean_1 FB_VS_R_Like_Incorrect_NZMean_1 
    FB_VS_R_Dislike_Correct_NZMean_1 FB_VS_R_Dislike_Incorrect_NZMean_1 
    FB_VS_R_WinGames_Correct_NZMean_1 FB_VS_R_WinGames_Incorrect_NZMean_1 
    FB_VS_R_LoseGames_Correct_NZMean_1 
    FB_VS_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_VS10_R_Like_Correct_NZMean_1 FB_VS10_R_Like_Incorrect_NZMean_1 
    FB_VS10_R_Dislike_Correct_NZMean_1 FB_VS10_R_Dislike_Incorrect_NZMean_1 
    FB_VS10_R_WinGames_Correct_NZMean_1 FB_VS10_R_WinGames_Incorrect_NZMean_1 
    FB_VS10_R_LoseGames_Correct_NZMean_1 
    FB_VS10_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_Nucleus_Accumbens_L_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Like_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_Dislike_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Dislike_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_L_WinGames_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_Anterior_Cingulate_L_Like_Correct_NZMean_1 FB_Anterior_Cingulate_L_Like_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_L_Dislike_Correct_NZMean_1 FB_Anterior_Cingulate_L_Dislike_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_L_WinGames_Correct_NZMean_1 FB_Anterior_Cingulate_L_WinGames_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_L_LoseGames_Correct_NZMean_1 
    FB_Anterior_Cingulate_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_Anterior_Cingulate_R_Like_Correct_NZMean_1 FB_Anterior_Cingulate_R_Like_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_R_Dislike_Correct_NZMean_1 FB_Anterior_Cingulate_R_Dislike_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_R_WinGames_Correct_NZMean_1 FB_Anterior_Cingulate_R_WinGames_Incorrect_NZMean_1 
    FB_Anterior_Cingulate_R_LoseGames_Correct_NZMean_1 
    FB_Anterior_Cingulate_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

CORRELATIONS
  /VARIABLES=FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1 ch_socialanx
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.


DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome
  /DESIGN=ch_socialanx.

DATASET ACTIVATE DataSet2.
GLM FB_VS_L_Like_Correct_NZMean_1 FB_VS_L_Like_Incorrect_NZMean_1 FB_VS_L_Dislike_Correct_NZMean_1 
    FB_VS_L_Dislike_Incorrect_NZMean_1 FB_VS_L_WinGames_Correct_NZMean_1 
    FB_VS_L_WinGames_Incorrect_NZMean_1 FB_VS_L_LoseGames_Correct_NZMean_1 
    FB_VS_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome
  /DESIGN=ch_socialanx.

DATASET ACTIVATE DataSet2.
GLM FB_VS_R_Like_Correct_NZMean_1 FB_VS_R_Like_Incorrect_NZMean_1 FB_VS_R_Dislike_Correct_NZMean_1 
    FB_VS_R_Dislike_Incorrect_NZMean_1 FB_VS_R_WinGames_Correct_NZMean_1 
    FB_VS_R_WinGames_Incorrect_NZMean_1 FB_VS_R_LoseGames_Correct_NZMean_1 
    FB_VS_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome
  /DESIGN=ch_socialanx.

DATASET ACTIVATE DataSet1.
GLM FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 FB_VS10_L_WinGames_Correct_NZMean_1 
    FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome
  /DESIGN=ch_socialanx.

DATASET ACTIVATE DataSet2.
GLM FB_VS10_R_Like_Correct_NZMean_1 FB_VS10_R_Like_Incorrect_NZMean_1 FB_VS10_R_Dislike_Correct_NZMean_1 
    FB_VS10_R_Dislike_Incorrect_NZMean_1 FB_VS10_R_WinGames_Correct_NZMean_1 
    FB_VS10_R_WinGames_Incorrect_NZMean_1 FB_VS10_R_LoseGames_Correct_NZMean_1 
    FB_VS10_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome
  /DESIGN=ch_socialanx.



DATASET ACTIVATE DataSet2.
GLM FB_VS_L_Like_Correct_NZMean_1 FB_VS_L_Like_Incorrect_NZMean_1 FB_VS_L_Dislike_Correct_NZMean_1 
    FB_VS_L_Dislike_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_VS_L_WinGames_Correct_NZMean_1 FB_VS_L_WinGames_Incorrect_NZMean_1 FB_VS_L_LoseGames_Correct_NZMean_1 
    FB_VS_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.


DATASET ACTIVATE DataSet2.
GLM FB_VS10_R_Like_Correct_NZMean_1 FB_VS10_R_Like_Incorrect_NZMean_1 FB_VS10_R_Dislike_Correct_NZMean_1 
    FB_VS10_R_Dislike_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_VS10_R_WinGames_Correct_NZMean_1 FB_VS10_R_WinGames_Incorrect_NZMean_1 FB_VS10_R_LoseGames_Correct_NZMean_1 
    FB_VS10_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_L_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Like_Incorrect_NZMean_1 FB_Nucleus_Accumbens_L_Dislike_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_Dislike_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_L_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_L_WinGames_Incorrect_NZMean_1 FB_Nucleus_Accumbens_L_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.

DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.


GLM FB_VS_L_Like_Correct_NZMean_1 FB_VS_L_Like_Incorrect_NZMean_1 
    FB_VS_L_Dislike_Correct_NZMean_1 FB_VS_L_Dislike_Incorrect_NZMean_1 
    FB_VS_L_WinGames_Correct_NZMean_1 FB_VS_L_WinGames_Incorrect_NZMean_1 
    FB_VS_L_LoseGames_Correct_NZMean_1 
    FB_VS_L_LoseGames_Incorrect_NZMean_1 WITH age gender
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(age=MEAN gender=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= age gender gender*age.

GLM FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_Like_Incorrect_NZMean_1 
    FB_VS10_L_Dislike_Correct_NZMean_1 FB_VS10_L_Dislike_Incorrect_NZMean_1 
    FB_VS10_L_WinGames_Correct_NZMean_1 FB_VS10_L_WinGames_Incorrect_NZMean_1 
    FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1 WITH age gender
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(age=MEAN gender=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= age gender gender*age.


GLM FB_VS_R_Like_Correct_NZMean_1 FB_VS_R_Like_Incorrect_NZMean_1 
    FB_VS_R_Dislike_Correct_NZMean_1 FB_VS_R_Dislike_Incorrect_NZMean_1 
    FB_VS_R_WinGames_Correct_NZMean_1 FB_VS_R_WinGames_Incorrect_NZMean_1 
    FB_VS_R_LoseGames_Correct_NZMean_1 
    FB_VS_R_LoseGames_Incorrect_NZMean_1 WITH age gender
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(age=MEAN gender=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= age gender gender*age.

GLM FB_VS10_R_Like_Correct_NZMean_1 FB_VS10_R_Like_Incorrect_NZMean_1 
    FB_VS10_R_Dislike_Correct_NZMean_1 FB_VS10_R_Dislike_Incorrect_NZMean_1 
    FB_VS10_R_WinGames_Correct_NZMean_1 FB_VS10_R_WinGames_Incorrect_NZMean_1 
    FB_VS10_R_LoseGames_Correct_NZMean_1 
    FB_VS10_R_LoseGames_Incorrect_NZMean_1 WITH age gender
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(age=MEAN gender=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= age gender gender*age.

GLM FB_Nucleus_Accumbens_L_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Like_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_Dislike_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Dislike_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_L_WinGames_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Incorrect_NZMean_1 WITH age gender
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(age=MEAN gender=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= age gender gender*age.


GLM FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1 WITH age gender
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(age=MEAN gender=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= age gender gender*age.

GLM FB_Medial_Prefrontal_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal_R_Like_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_Dislike_Correct_NZMean_1 FB_Medial_Prefrontal_R_Dislike_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_WinGames_Correct_NZMean_1 FB_Medial_Prefrontal_R_WinGames_Incorrect_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal_R_LoseGames_Incorrect_NZMean_1 WITH age gender
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(age=MEAN gender=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= age gender gender*age.

GLM FB_Medial_Prefrontal10_R_Like_Correct_NZMean_1 FB_Medial_Prefrontal10_R_Like_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_Dislike_Correct_NZMean_1 FB_Medial_Prefrontal10_R_Dislike_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_WinGames_Correct_NZMean_1 FB_Medial_Prefrontal10_R_WinGames_Incorrect_NZMean_1 
    FB_Medial_Prefrontal10_R_LoseGames_Correct_NZMean_1 
    FB_Medial_Prefrontal10_R_LoseGames_Incorrect_NZMean_1 WITH age gender
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(age=MEAN gender=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(age=MEAN gender=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= age gender gender*age.



DATASET ACTIVATE DataSet2.
GLM FB_VS_L_Like_Correct_NZMean_1 FB_VS_L_Like_Incorrect_NZMean_1 FB_VS_L_Dislike_Correct_NZMean_1 
    FB_VS_L_Dislike_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

DATASET ACTIVATE DataSet2.
GLM FB_VS_L_WinGames_Correct_NZMean_1 FB_VS_L_WinGames_Incorrect_NZMean_1 FB_VS_L_LoseGames_Correct_NZMean_1 
    FB_VS_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

DATASET ACTIVATE DataSet1.
GLM FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

DATASET ACTIVATE DataSet1.
GLM FB_VS10_L_WinGames_Correct_NZMean_1 FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.


DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_L_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_L_Like_Incorrect_NZMean_1 FB_Nucleus_Accumbens_L_Dislike_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_Dislike_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_L_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_L_WinGames_Incorrect_NZMean_1 FB_Nucleus_Accumbens_L_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.



DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_R_Like_Correct_NZMean_1 FB_Nucleus_Accumbens_R_Like_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_Dislike_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_Dislike_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

DATASET ACTIVATE DataSet2.
GLM FB_Nucleus_Accumbens_R_WinGames_Correct_NZMean_1 FB_Nucleus_Accumbens_R_WinGames_Incorrect_NZMean_1 FB_Nucleus_Accumbens_R_LoseGames_Correct_NZMean_1 
    FB_Nucleus_Accumbens_R_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.







DATASET ACTIVATE DataSet2.
GLM FB_NewVS_R_Like_Correct_NZMean_1 FB_NewVS_R_Like_Incorrect_NZMean_1 FB_NewVS_R_Dislike_Correct_NZMean_1 
    FB_NewVS_R_Dislike_Incorrect_NZMean_1 FB_NewVS_R_WinGames_Correct_NZMean_1 
    FB_NewVS_R_WinGames_Incorrect_NZMean_1 FB_NewVS_R_LoseGames_Correct_NZMean_1 
    FB_NewVS_R_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.



DATASET ACTIVATE DataSet2.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ch_socialanx
  /METHOD=ENTER ch_cdi_total
  /SAVE RESID.

DATASET ACTIVATE DataSet2.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ch_cdi_total
  /METHOD=ENTER ch_socialanx
  /SAVE RESID.

CORRELATIONS
  /VARIABLES=RES_9 RES_10
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

COMPUTE Outcome_Correct=MEAN(FB_VS10_L_LoseGames_Correct_NZMean_1,FB_VS10_L_WinGames_Correct_NZMean_1,
    FB_VS10_L_Dislike_Correct_NZMean_1,FB_VS10_L_Like_Correct_NZMean_1).
EXECUTE.

COMPUTE Outcome_Incorrect=MEAN(FB_VS10_L_LoseGames_Incorrect_NZMean_1,FB_VS10_L_WinGames_Incorrect_NZMean_1,
    FB_VS10_L_Dislike_Incorrect_NZMean_1,FB_VS10_L_Like_Incorrect_NZMean_1).
EXECUTE.

COMPUTE Games_Positive=MEAN(FB_VS10_L_WinGames_Correct_NZMean_1,FB_VS10_L_Like_Correct_NZMean_1,FB_VS10_L_WinGames_Incorrect_NZMean_1,FB_VS10_L_Like_Incorrect_NZMean_1).
EXECUTE.

COMPUTE Games_Negative=MEAN(FB_VS10_L_LoseGames_Correct_NZMean_1,FB_VS10_L_Dislike_Correct_NZMean_1,FB_VS10_L_LoseGames_Incorrect_NZMean_1,FB_VS10_L_Dislike_Incorrect_NZMean_1).
EXECUTE.

DATASET ACTIVATE DataSet1.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Outcome_Incorrect
  /METHOD=ENTER Outcome_Correct
  /SAVE RESID.


DATASET ACTIVATE DataSet1.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Outcome_Correct
  /METHOD=ENTER Outcome_Incorrect
  /SAVE RESID.

DATASET ACTIVATE DataSet1.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Games_Positive
  /METHOD=ENTER Games_Negative
  /SAVE RESID.


DATASET ACTIVATE DataSet1.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Games_Negative
  /METHOD=ENTER Games_Positive
  /SAVE RESID.



DATASET ACTIVATE DataSet1.
CORRELATIONS
  /VARIABLES=RES_13 RES_9
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

DATASET ACTIVATE DataSet1.
CORRELATIONS
  /VARIABLES=RES_13 RES_10
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

DATASET ACTIVATE DataSet1.
CORRELATIONS
  /VARIABLES=RES_14 RES_9
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

DATASET ACTIVATE DataSet1.
CORRELATIONS
  /VARIABLES=RES_14 RES_10
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_16
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_16
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_15
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_15
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.





REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_Like_Correct_NZMean_1
  /METHOD=ENTER FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 FB_VS10_L_WinGames_Correct_NZMean_1 
    FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_Dislike_Correct_NZMean_1
  /METHOD=ENTER FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Like_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 FB_VS10_L_WinGames_Correct_NZMean_1 
    FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_Like_Incorrect_NZMean_1
  /METHOD=ENTER FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 FB_VS10_L_WinGames_Correct_NZMean_1 
    FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_Dislike_Incorrect_NZMean_1
  /METHOD=ENTER FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_WinGames_Correct_NZMean_1 
    FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_WinGames_Correct_NZMean_1
  /METHOD=ENTER FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 FB_VS10_L_Like_Correct_NZMean_1 
    FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_WinGames_Incorrect_NZMean_1
  /METHOD=ENTER FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 FB_VS10_L_WinGames_Correct_NZMean_1 
    FB_VS10_L_Like_Correct_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_LoseGames_Correct_NZMean_1
  /METHOD=ENTER FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 FB_VS10_L_WinGames_Correct_NZMean_1 
    FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_Like_Correct_NZMean_1 
    FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /METHOD=ENTER FB_VS10_L_Like_Incorrect_NZMean_1 FB_VS10_L_Dislike_Correct_NZMean_1 
    FB_VS10_L_Dislike_Incorrect_NZMean_1 FB_VS10_L_WinGames_Correct_NZMean_1 
    FB_VS10_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_Like_Correct_NZMean_1
  /SAVE RESID.


CORRELATIONS
  /VARIABLES=RES_9 RES_17
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_18
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_19
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_20
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_21
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_22
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_23
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_9 RES_24
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.




CORRELATIONS
  /VARIABLES=RES_10 RES_17
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_18
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_19
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_20
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_21
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_22
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_23
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_10 RES_24
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_Like_Correct_NZMean_1
  /METHOD=ENTER  FB_VS10_L_Like_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_Dislike_Correct_NZMean_1
  /METHOD=ENTER  FB_VS10_L_Dislike_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_WinGames_Correct_NZMean_1
  /METHOD=ENTER  FB_VS10_L_WinGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS10_L_LoseGames_Correct_NZMean_1
  /METHOD=ENTER  FB_VS10_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.


CORRELATIONS
  /VARIABLES=RES_25 RES_26
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_25 RES_27
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_25 RES_28
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_26 RES_27
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_26 RES_28
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_27 RES_28
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.








DATASET ACTIVATE DataSet2.
GLM FB_VS8_L_Like_Correct_NZMean_1 FB_VS8_L_Like_Incorrect_NZMean_1 FB_VS8_L_Dislike_Correct_NZMean_1 
    FB_VS8_L_Dislike_Incorrect_NZMean_1 FB_VS8_L_WinGames_Correct_NZMean_1 
    FB_VS8_L_WinGames_Incorrect_NZMean_1 FB_VS8_L_LoseGames_Correct_NZMean_1 
    FB_VS8_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.


DATASET ACTIVATE DataSet2.
GLM FB_VS6_L_Like_Correct_NZMean_1 FB_VS6_L_Like_Incorrect_NZMean_1 FB_VS6_L_Dislike_Correct_NZMean_1 
    FB_VS6_L_Dislike_Incorrect_NZMean_1 FB_VS6_L_WinGames_Correct_NZMean_1 
    FB_VS6_L_WinGames_Incorrect_NZMean_1 FB_VS6_L_LoseGames_Correct_NZMean_1 
    FB_VS6_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.

GLM FB_VS8_L_Like_Correct_NZMean_1 FB_VS8_L_Like_Incorrect_NZMean_1 
    FB_VS8_L_Dislike_Correct_NZMean_1 FB_VS8_L_Dislike_Incorrect_NZMean_1 
    FB_VS8_L_WinGames_Correct_NZMean_1 FB_VS8_L_WinGames_Incorrect_NZMean_1 
    FB_VS8_L_LoseGames_Correct_NZMean_1 
    FB_VS8_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

GLM FB_VS8new_L_Like_Correct_NZMean_1 FB_VS8new_L_Like_Incorrect_NZMean_1 
    FB_VS8new_L_Dislike_Correct_NZMean_1 FB_VS8new_L_Dislike_Incorrect_NZMean_1 
    FB_VS8new_L_WinGames_Correct_NZMean_1 FB_VS8new_L_WinGames_Incorrect_NZMean_1 
    FB_VS8new_L_LoseGames_Correct_NZMean_1 
    FB_VS8new_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.






DATASET ACTIVATE DataSet4.
GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Task) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Task*Games) 
  /EMMEANS=TABLES(Task*Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /EMMEANS=TABLES(Task*Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Task Games Outcome Task*Games Task*Outcome Games*Outcome Task*Games*Outcome.


GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 
    FB_VS6new_L_Dislike_Correct_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 
    FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 
    FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Task 2 Polynomial Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /SAVE=RESID ZRESID SRESID
  /PLOT=PROFILE(Games*Outcome*Task) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Task*Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.



DATASET ACTIVATE DataSet4.
GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Games) 
  /EMMEANS=TABLES(Outcome) 
  /EMMEANS=TABLES(Games*Outcome) 
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Games Outcome Games*Outcome.

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_socialanx ch_cdi_total ch_cdi_total*ch_socialanx.


DATASET ACTIVATE DataSet1.
T-TEST PAIRS=FB_VS6new_L_Like_Correct_NZMean_1 WITH FB_VS6new_L_Like_Incorrect_NZMean_1 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

DATASET ACTIVATE DataSet1.
T-TEST PAIRS=FB_VS6new_L_Dislike_Correct_NZMean_1 WITH FB_VS6new_L_Dislike_Incorrect_NZMean_1 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

DATASET ACTIVATE DataSet1.
T-TEST PAIRS=FB_VS6new_L_WinGames_Correct_NZMean_1 WITH FB_VS6new_L_WinGames_Incorrect_NZMean_1 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

DATASET ACTIVATE DataSet1.
T-TEST PAIRS=FB_VS6new_L_LoseGames_Correct_NZMean_1 WITH FB_VS6new_L_LoseGames_Incorrect_NZMean_1 (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.


GLM FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Like_Incorrect_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Outcome 
  /DESIGN=ch_socialanx ch_cdi_total.

GLM FB_VS6new_L_Dislike_Correct_NZMean_1 FB_VS6new_L_Dislike_Incorrect_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Outcome 
  /DESIGN=ch_socialanx ch_cdi_total.


GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Outcome 
  /DESIGN=ch_socialanx ch_cdi_total.

GLM FB_VS6new_L_LoseGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Outcome 
  /DESIGN=ch_socialanx ch_cdi_total.



REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_Like_Correct_NZMean_1
  /METHOD=ENTER  FB_VS6new_L_Like_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_Dislike_Correct_NZMean_1
  /METHOD=ENTER  FB_VS6new_L_Dislike_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_WinGames_Correct_NZMean_1
  /METHOD=ENTER  FB_VS6new_L_WinGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_LoseGames_Correct_NZMean_1
  /METHOD=ENTER  FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.


CORRELATIONS
  /VARIABLES=RES_41 RES_42
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_41 RES_43
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_41 RES_44
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_42 RES_43
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_42 RES_44
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_43 RES_44
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.






REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_Like_Correct_NZMean_1
  /METHOD=ENTER FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_Dislike_Correct_NZMean_1
  /METHOD=ENTER FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Like_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_Like_Incorrect_NZMean_1
  /METHOD=ENTER FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_Dislike_Incorrect_NZMean_1
  /METHOD=ENTER FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_WinGames_Correct_NZMean_1
  /METHOD=ENTER FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_Like_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_WinGames_Incorrect_NZMean_1
  /METHOD=ENTER FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 
    FB_VS6new_L_Like_Correct_NZMean_1 FB_VS6new_L_LoseGames_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_LoseGames_Correct_NZMean_1
  /METHOD=ENTER FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS6new_L_Like_Correct_NZMean_1 
    FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FB_VS6new_L_LoseGames_Incorrect_NZMean_1
  /METHOD=ENTER FB_VS6new_L_Like_Incorrect_NZMean_1 FB_VS6new_L_Dislike_Correct_NZMean_1 
    FB_VS6new_L_Dislike_Incorrect_NZMean_1 FB_VS6new_L_WinGames_Correct_NZMean_1 
    FB_VS6new_L_WinGames_Incorrect_NZMean_1 FB_VS10_L_LoseGames_Correct_NZMean_1 
    FB_VS10_L_Like_Correct_NZMean_1
  /SAVE RESID.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ch_socialanx
  /METHOD=ENTER ch_cdi_total
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT ch_cdi_total
  /METHOD=ENTER ch_socialanx
  /SAVE RESID.



CORRELATIONS
  /VARIABLES=RES_53 RES_45
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_53 RES_46
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_53 RES_47
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_53 RES_48
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_53 RES_49
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_53 RES_50
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_53 RES_51
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_53 RES_52
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.




CORRELATIONS
  /VARIABLES=RES_54 RES_45
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_54 RES_46
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_54 RES_47
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_54 RES_48
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_54 RES_49
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_54 RES_50
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_54 RES_51
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=RES_54 RES_52
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


