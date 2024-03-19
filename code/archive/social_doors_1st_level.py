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


#subj = 'sub-'+str(sys.argv[1])
#task = str(sys.argv[2])

subj = 'sub-010'
task = 'social'


bids_dir = '/data/projects/social_doors/'
os.chdir(bids_dir)

all_runs_dir = bids_dir + 'derivatives/social_doors/'
#odd_runs_dir = bids_dir + 'derivatives/relscenarios_odd/'
#evn_runs_dir = bids_dir + 'derivatives/relscenarios_evn/'


#subjs_scan_info = pd.read_csv(bids_dir+'derivatives/mriqc/mriqc_summary_poor.csv')

#subjs_list = list(subjs_scan_info['subject'].unique())
#subjs_list = [subjs_list[-1]]

#subjs_list = pd.read_csv(bids_dir+'Nifti/participants.tsv', sep='\t')
#subjs_list = subjs_list['participant_id'].to_list()

## Find preprocessed functional runs

#mni_template = "derivatives/fmriprep/sub-/ses-001/func/sub-301_ses-001_task-relscenarios_run-001_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz"

#for task in ['mdoors', 'social']:
#    for subj in subjs_list:
print('Starting 1st-level analysis for '+subj)
if not os.path.exists(all_runs_dir+subj):
    os.makedirs(all_runs_dir+subj)



func_runs = [f for f in glob.glob(bids_dir + '/derivatives/fmriprep/'+subj+'/func/'+subj+'_task-'+task+'*space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz', recursive=True)]
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

## Add design matrices to brain data objects
all_cat_run_data.X = pd.read_csv(bids_dir+'/derivatives/fmriprep/'+subj+'/func/'+subj+'_task-'+task+'_run-all_cat_desc-design_matrix.csv')
all_cat_run_data.X = all_cat_run_data.X.drop(['fixation_c0'], axis=1)
plt.figure(figsize=(30,15))
plt.title(subj+" design matrix for all runs", fontsize =20)
sns.heatmap(data=all_cat_run_data.X,vmin=-1,vmax=1, cmap=sns.color_palette("Greys"))
plt.savefig(all_runs_dir+subj+'/design_matrix_'+task+'.png')
plt.close()






## Estimate model for all voxels
stats_all_runs = all_cat_run_data.regress()


## Visualize data in jupyter notebook
#stats['beta'][77].iplot()

# Save the betas maps for relevant conditions
relv_conds = ['positive_c0','positive_win_c0','positive_loss_c0',
              'negative_c0','negative_win_c0','negative_loss_c0']

for cond in relv_conds:
    # Find the index of the condition
    temp_idx = all_cat_run_data.X.columns.to_list().index(cond)
    
    stats_all_runs['t'][temp_idx].write(os.path.join(all_runs_dir, subj, 
                                                    'tmap_'+task+'_'+cond[:-3]+'.nii.gz'))

#for cond in range(0,78):
#    stats_all_runs['beta'][cond].write(os.path.join(all_runs_dir,subj,'beta_'+"{0:03}".format(cond+1)+'.nii.gz'))

    #temp_subj_mni_beta = Brain_Data(os.path.join(all_runs_dir,subj,'beta_'+"{0:03}".format(cond+1)+'.nii.gz'), 
    #                                mask=subj_t1)
    #temp_subj_mni_beta.write(os.path.join(all_runs_dir,subj,'beta_'+"{0:03}".format(cond+1)+'_space-MNI152NLin2009cAsym.nii.gz'))

#niplt.plot_roi(all_runs_dir+subj+'/beta_'+"{0:03}".format(cond+1)+'.nii.gz',
#              display_mode='x', cut_coords=range(-50, 52, 2), draw_cross=False)


# Create contrast for all vs rest (fixation)

# Faces vs outcome (kind of), only relevant for social contrast
c_facesVoutcm = np.zeros(len(stats_all_runs['beta']))
faces_idx = [all_cat_run_data.X.columns.to_list().index('positive_c0')]
faces_idx.append(all_cat_run_data.X.columns.to_list().index('negative_c0'))
outcm_idx = [all_cat_run_data.X.columns.to_list().index('positive_loss_c0')]
outcm_idx.append(all_cat_run_data.X.columns.to_list().index('positive_win_c0'))
outcm_idx.append(all_cat_run_data.X.columns.to_list().index('negative_loss_c0'))
outcm_idx.append(all_cat_run_data.X.columns.to_list().index('negative_win_c0'))

c_facesVoutcm[faces_idx] = 0.5
c_facesVoutcm[outcm_idx] = -0.25
#print(c_relVfix)

smoothed = stats_all_runs['beta'].smooth(fwhm=6)
facesVoutcm_tmap = stats_all_runs['beta'] * c_facesVoutcm

facesVoutcm_tmap.write(os.path.join(all_runs_dir,subj,'tmap_'+task+'_facesVoutcm.nii.gz'))


# Trial positive wins versus loses
c_winVlos = np.zeros(len(stats_all_runs['beta']))
pos_win_idx = all_cat_run_data.X.columns.to_list().index('positive_win_c0')
pos_los_idx = all_cat_run_data.X.columns.to_list().index('positive_loss_c0')
c_winVlos[pos_win_idx] = 1
c_winVlos[pos_los_idx] = -1
#print(c_relVfix)

smoothed = stats_all_runs['beta'].smooth(fwhm=6)
winVlos_tmap = stats_all_runs['beta'] * c_winVlos

winVlos_tmap.write(os.path.join(all_runs_dir,subj,'tmap_'+task+'_positive_winVlos.nii.gz'))


# Trial all wins versus loses
c_winVlos = np.zeros(len(stats_all_runs['beta']))
win_idx = [all_cat_run_data.X.columns.get_loc(c) for c in all_cat_run_data.X.columns if 'win_c0' in c]
los_idx = [all_cat_run_data.X.columns.get_loc(c) for c in all_cat_run_data.X.columns if 'loss_c0' in c]
c_winVlos[win_idx] = 1
c_winVlos[los_idx] = -1
#print(c_relVfix)

smoothed = stats_all_runs['beta'].smooth(fwhm=6)
winVlos_tmap = stats_all_runs['beta'] * c_winVlos

winVlos_tmap.write(os.path.join(all_runs_dir,subj,'tmap_'+task+'_all_winVlos.nii.gz'))





# F-test for multiple conditions
## Valence (positive/negative) x outcome (correct/incorrect)

conditions = {}



#effects_of_interest(np.vstack)
    
    
    










