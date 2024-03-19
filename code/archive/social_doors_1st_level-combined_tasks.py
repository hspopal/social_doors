# -*- coding: utf-8 -*-
"""
Spyder Editor

First and Second Level Analysis with nltools
"""

from nltools.data import Brain_Data
import glob
import os
import sys

from nilearn import plotting as niplt
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import numpy as np


subj = 'sub-'+str(sys.argv[1])
#task = str(sys.argv[2])

#subj = 'sub-010'
#task = 'social'


bids_dir = '/data/projects/social_doors/'
os.chdir(bids_dir)

all_runs_dir = bids_dir + 'derivatives/social_doors/'


## Find preprocessed functional runs

#mni_template = "derivatives/fmriprep/sub-/ses-001/func/sub-301_ses-001_task-relscenarios_run-001_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz"

#for task in ['mdoors', 'social']:
#    for subj in subjs_list:
print('Starting 1st-level analysis for '+subj)
if not os.path.exists(all_runs_dir+subj):
    os.makedirs(all_runs_dir+subj)



func_runs = [f for f in glob.glob(bids_dir + '/derivatives/fmriprep/'+subj+'/func/'+subj+'_task-*space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz', recursive=True)]
#func_runs = list('derivatives/fmriprep/'+subj+'/ses-001/func/'+subjs_scan_info[subjs_scan_info['subject']==subj]['run'].str[:-5]+'_space-T1w_desc-preproc_bold.nii.gz')
func_runs.sort()
#func_runs = func_runs[1:] + [func_runs[0]]



#func_run_nums =  [s.lstrip('0') for s in subjs_scan_info[subjs_scan_info['subject']==subj]['run'].str[-8:-5]]
#func_run_nums = [int(i) for i in func_run_nums]
print('Number of functional runs for '+subj+': '+str(len(func_runs)))


# Load the brain data
## Takes about 10 mins for all four datasets

# Grab subject's T1 as a mask to keep analysis in subject space
subj_t1 = bids_dir+"derivatives/fmriprep/"+subj+"/anat/"+subj+"_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii.gz"
#subj_t1 = "derivatives/reliability_analysis/relscenarios/Anatomy/"+subj+"_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii"

print("Loading brain data...")
all_cat_run_data = Brain_Data(func_runs, mask=subj_t1)


#odd_run_data = Brain_Data(func_runs[::2])
#even_run_data = Brain_Data(func_runs[1::2])


# Design Matrix

## Find design matrices for both tasks and combine
dm_mdoors = pd.read_csv(bids_dir+'/derivatives/fmriprep/'+subj+'/func/'+subj+'_task-mdoors_run-all_cat_desc-design_matrix.csv')
dm_social = pd.read_csv(bids_dir+'/derivatives/fmriprep/'+subj+'/func/'+subj+'_task-social_run-all_cat_desc-design_matrix.csv')

dm_mdoors = dm_mdoors.rename(columns={"negative_c0": "negative_c0-mdoors",
                          "negative_loss_c0": "negative_loss_c0-mdoors",
                          "negative_win_c0": "negative_win_c0-mdoors",
                          "positive_c0": "positive_c0-mdoors",
                          "positive_loss_c0": "positive_loss_c0-mdoors",
                          "positive_win_c0": "positive_win_c0-mdoors",
                          "0_poly_1": "0_poly_1-mdoors",
                          "1_poly_1": "1_poly_1-mdoors",
                          "0_poly_0": "0_poly_0-mdoors",
                          "1_poly_0": "1_poly_0-mdoors",
                          "0_poly_2": "0_poly_2-mdoors",
                          "1_poly_2": "1_poly_2-mdoors"})
dm_social = dm_social.rename(columns={"negative_c0": "negative_c0-social",
                          "negative_loss_c0": "negative_loss_c0-social",
                          "negative_win_c0": "negative_win_c0-social",
                          "positive_c0": "positive_c0-social",
                          "positive_loss_c0": "positive_loss_c0-social",
                          "positive_win_c0": "positive_win_c0-social",
                          "0_poly_1": "0_poly_1-social",
                          "1_poly_1": "1_poly_1-social",
                          "0_poly_0": "0_poly_0-social",
                          "1_poly_0": "1_poly_0-social",
                          "0_poly_2": "0_poly_2-social",
                          "1_poly_2": "1_poly_2-social"})

dm_comb = pd.concat([dm_mdoors, dm_social])
dm_comb.fillna(0, inplace=True)



## Add design matrices to brain data objects
all_cat_run_data.X = dm_comb
all_cat_run_data.X = all_cat_run_data.X.drop(['fixation_c0'], axis=1)

# Drop run regressor
#all_cat_run_data.X = all_cat_run_data.X.drop(['0_poly_0-mdoors'], axis=1)
#all_cat_run_data.X = all_cat_run_data.X.drop(['1_poly_0-mdoors'], axis=1)
#all_cat_run_data.X = all_cat_run_data.X.drop(['0_poly_0-social'], axis=1)
#all_cat_run_data.X = all_cat_run_data.X.drop(['1_poly_0-social'], axis=1)


plt.figure(figsize=(30,15))
plt.title(subj+" design matrix for all runs", fontsize =20)
sns.heatmap(data=all_cat_run_data.X,vmin=-1,vmax=1, cmap=sns.color_palette("Greys"))
plt.savefig(all_runs_dir+subj+'/design_matrix_comb.png')
plt.close()






## Estimate model for all voxels
stats_all_runs = all_cat_run_data.regress()


## Visualize data in jupyter notebook
#stats['beta'][77].iplot()

# Save the betas maps for relevant conditions
relv_conds = ['positive_c0','positive_win_c0','positive_loss_c0',
              'negative_c0','negative_win_c0','negative_loss_c0']

#for cond in relv_conds:
    # Find the index of the condition
#    temp_idx = all_cat_run_data.X.columns.to_list().index(cond)
    
#    stats_all_runs['t'][temp_idx].write(os.path.join(all_runs_dir, subj, 
#                                                    'tmap_'+task+'_'+cond[:-3]+'.nii.gz'))

#for cond in range(0,78):
#    stats_all_runs['beta'][cond].write(os.path.join(all_runs_dir,subj,'beta_'+"{0:03}".format(cond+1)+'.nii.gz'))

    #temp_subj_mni_beta = Brain_Data(os.path.join(all_runs_dir,subj,'beta_'+"{0:03}".format(cond+1)+'.nii.gz'), 
    #                                mask=subj_t1)
    #temp_subj_mni_beta.write(os.path.join(all_runs_dir,subj,'beta_'+"{0:03}".format(cond+1)+'_space-MNI152NLin2009cAsym.nii.gz'))

#niplt.plot_roi(all_runs_dir+subj+'/beta_'+"{0:03}".format(cond+1)+'.nii.gz',
#              display_mode='x', cut_coords=range(-50, 52, 2), draw_cross=False)


# Create contrast for all vs rest (fixation)

# Faces vs outcome (kind of), only relevant for social contrast
c_facesVdoors = np.zeros(len(stats_all_runs['beta']))
faces_idx = [all_cat_run_data.X.columns.to_list().index('positive_c0-social')]
faces_idx.append(all_cat_run_data.X.columns.to_list().index('negative_c0-social'))
doors_idx = [all_cat_run_data.X.columns.to_list().index('positive_c0-mdoors')]
doors_idx.append(all_cat_run_data.X.columns.to_list().index('negative_c0-mdoors'))


c_facesVdoors[faces_idx] = 0.5
c_facesVdoors[doors_idx] = -0.5
#print(c_relVfix)

smoothed = stats_all_runs['beta'].smooth(fwhm=6)
facesVdoors_tmap = stats_all_runs['beta'] * c_facesVdoors

facesVdoors_tmap.write(os.path.join(all_runs_dir,subj,'tmap_facesVdoors.nii.gz'))
















