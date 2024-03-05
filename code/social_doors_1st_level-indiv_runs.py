# -*- coding: utf-8 -*-
"""
Spyder Editor

First and Second Level Analysis with nltools
"""

from nltools.data import Brain_Data
import glob
import os
import sys

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns


subj = 'sub-'+str(sys.argv[1])
task = str(sys.argv[2])

#subj = 'sub-013'
#task = 'mdoors'


bids_dir = '/data/projects/social_doors/'
os.chdir(bids_dir)

all_runs_dir = bids_dir + 'derivatives/social_doors-indiv_runs/'
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
func_runs.sort()


# Check to see if two runs exist
if len(func_runs) < 2:
    sys.exit("Only 1 "+task+" run for "+subj)


print('Number of functional runs for '+subj+': '+str(len(func_runs)))


# Load the brain data
## Takes about 10 mins for all four datasets

# Grab subject's T1 as a mask to keep analysis in subject space
subj_t1 = bids_dir+"derivatives/fmriprep/"+subj+"/anat/"+subj+"_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii.gz"

print("Loading brain data...")



# Design Matrix
dm = pd.read_csv(bids_dir+'/derivatives/fmriprep/'+subj+'/func/'+subj+'_task-'+task+'_run-all_cat_desc-design_matrix.csv')
dm = dm.drop(['fixation_c0'], axis=1)
plt.figure(figsize=(30,15))
plt.title(subj+" design matrix for all runs", fontsize =20)
sns.heatmap(data=dm,vmin=-1,vmax=1, cmap=sns.color_palette("Greys"))
plt.savefig(all_runs_dir+subj+'/design_matrix_'+task+'.png')
plt.close()

    
    
# Save the betas maps for relevant conditions
relv_conds = ['positive_c0','positive_win_c0','positive_loss_c0',
              'negative_c0','negative_win_c0','negative_loss_c0']



# Split design matrix by run
dms = {}
for n in range(2):
    dms['run'+str(n+1)] = dm[dm[str(n)+'_poly_0'] == 1]
    
    # Import brain data
    run_data = Brain_Data(func_runs[n], mask=subj_t1)
    run_data.X = dms['run'+str(n+1)]
    

    ## Estimate model for all voxels
    func_stats = run_data.regress()


    # Save data for each conditions, for each run
    for cond in relv_conds:
        # Find the index of the condition
        temp_idx = run_data.X.columns.to_list().index(cond)
        
        func_stats['t'][temp_idx].write(os.path.join(all_runs_dir, subj, 
                                                     'tmap_'+task+'_'+cond[:-3]+'_run'+str(n+1)+'.nii.gz'))












