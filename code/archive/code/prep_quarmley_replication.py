# -*- coding: utf-8 -*-
"""
Spyder Editor

First and Second Level Analysis with nltools
"""

from nltools.data import Brain_Data
import os
import sys

import pandas as pd


subj = 'sub-'+str(sys.argv[1])
task = str(sys.argv[2])

#subj = 'sub-010'
#task = 'social'


bids_dir = '/data/projects/social_doors/'
os.chdir(bids_dir)

data_dir = bids_dir + 'derivatives/social_doors-nilearn/'
outp_dir = bids_dir + 'derivatives/quarmley_replication/'


#subjs_scan_info = pd.read_csv(bids_dir+'derivatives/mriqc/mriqc_summary_poor.csv')

#subjs_list = list(subjs_scan_info['subject'].unique())
#subjs_list = [subjs_list[-1]]

#subjs_list = pd.read_csv(bids_dir+'Nifti/participants.tsv', sep='\t')
#subjs_list = subjs_list['participant_id'].to_list()

## Find preprocessed functional runs
#subj = 'sub-'+str(693)

#mni_template = "derivatives/fmriprep/sub-/ses-001/func/sub-301_ses-001_task-relscenarios_run-001_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz"

#for task in ['mdoors', 'social']:
#    for subj in subjs_list:
print('Starting Quarmley analysis for '+subj)
#subj = 'sub-'+str(693)
#if not os.path.exists(all_runs_dir+subj):
#    os.makedirs(all_runs_dir+subj)


# Use ROI to mask
roi_names = ['VS_L', 'VS_R']
con_names = ['positive_win', 'positive_loss', 'negative_win', 'negative_loss']
#roi_dict['VS_l'] = bids_dir+'derivatives/rois/roi_bin_reward_VS_l.nii.gz'
#roi_dict['VS_r'] = bids_dir+'derivatives/rois/roi_bin_reward_VS_r.nii.gz'

subj_t1 = bids_dir+"derivatives/fmriprep/"+subj+"/func/"+subj+"_task-"+task+"_run-1_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz"


# Create dataframe to store mean responses for subject
subj_roi_data = pd.DataFrame(columns=roi_names)


print("Loading brain data...")
for cond in con_names:
    for roi in roi_names:
        roi_path = bids_dir+'derivatives/rois/'+roi+'.nii'
        roi_mask = Brain_Data(roi_path, mask=subj_t1)
        
        # Binarize mask
        roi_mask = roi_mask.threshold(upper=0.1, binarize=True)

        
        # Import beta map for condition
        fnc_data = data_dir+subj+'/zmap_'+task+'_'+cond+'.nii'
        roi_data = Brain_Data(fnc_data, mask=subj_t1)
        
        
        # Mask beta map and get average value for ROI
        fnc_masked = roi_data.apply_mask(roi_mask)
        
        
        # Attach data to subject dataframe
        subj_roi_data.loc[cond,roi] = fnc_masked.mean()
        

subj_roi_data.to_csv(outp_dir+'roi_mean_betas_'+subj+'_'+task+'.csv')










