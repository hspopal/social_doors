* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 
    FB_VS6new_L_LoseGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1 WITH ch_socialanx 
    ch_cdi_total
  /WSFACTOR=Games 2 Polynomial Outcome 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Games*Outcome) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(OVERALL) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /EMMEANS=TABLES(Games*Outcome) WITH(ch_socialanx=MEAN ch_cdi_total=MEAN)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= ch_cdi_total*ch_socialanx ch_socialanx ch_cdi_total.



GLM FB_VS6new_L_WinGames_Correct_NZMean_1 FB_VS6new_L_WinGames_Incorrect_NZMean_1 
    FB_VS6new_L_LoseGames_Correct_NZMean_1 FB_VS6new_L_LoseGames_Incorrect_NZMean_1
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
