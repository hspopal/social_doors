# -*- coding: utf-8 -*-
"""
Spyder Editor

First and Second Level Analysis with nltools
"""

from nltools.data import Brain_Data
import os
import sys
import glob

import pandas as pd


#subj = 'sub-'+str(sys.argv[1])
#task = str(sys.argv[2])

#subj = 'sub-010'
#task = 'social'

# Define paths
bids_dir = '/data/projects/social_doors/'
os.chdir(bids_dir)

data_dir = bids_dir + 'derivatives/social_doors-nilearn/'
outp_dir = bids_dir + 'derivatives/univariate_roi/'


# Import subject list
subjs_scan_info = pd.read_csv(bids_dir+'derivatives/participants_good.tsv', sep='\t')

subjs_list = list(subjs_scan_info['participant_id'].unique())
subjs_list.sort()

# Remove bad subjects
#subjs_list.remove('sub-5049')
subjs_list.remove('sub-3880')
subjs_list.remove('sub-4069')

print('Found '+str(len(subjs_list))+' subjects')

# Set an example subject
subj = subjs_list[0]



#mni_template = "derivatives/fmriprep/sub-/ses-001/func/sub-301_ses-001_task-relscenarios_run-001_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz"

#for task in ['mdoors', 'social']:
#    for subj in subjs_list:
#subj = 'sub-'+str(693)
#if not os.path.exists(all_runs_dir+subj):
#    os.makedirs(all_runs_dir+subj)


# Import ROIs
reward_roi_list = glob.glob(os.path.join(bids_dir,'derivatives','rois', f'roi_bin_reward_*.nii.gz'))
reward_roi_names = [os.path.basename(x)[:-7].split('roi_bin_reward_')[-1] for x in reward_roi_list]

reward_roi_dict = dict(zip(reward_roi_names, reward_roi_list))


social_roi_list = glob.glob(os.path.join(bids_dir,'derivatives','rois', f'roi_bin_social_*.nii.gz'))
social_roi_names = [os.path.basename(x)[:-7].split('roi_bin_social_')[-1] for x in social_roi_list]

social_roi_dict = dict(zip(social_roi_names, social_roi_list))


mdtbcb_roi_list = glob.glob(os.path.join(bids_dir,'derivatives','rois', f'mdtb_region*.nii.gz'))
mdtbcb_roi_names = [os.path.basename(x)[:-7].split('mdtb_')[-1] for x in mdtbcb_roi_list]

mdtbcb_roi_dict = dict(zip(mdtbcb_roi_names, mdtbcb_roi_list))


striat_roi_list = glob.glob(os.path.join(bids_dir,'derivatives','rois', f'striatum_*.nii.gz'))
striat_roi_names = [os.path.basename(x)[:-7].split('rois/')[-1] for x in striat_roi_list]

striat_roi_dict = dict(zip(striat_roi_names, striat_roi_list))



rois = list(reward_roi_dict.values()) + list(social_roi_dict.values()) + list(mdtbcb_roi_dict.values()) + list(striat_roi_dict.values())
roi_names = [x + '-reward' for x in reward_roi_names] + [x + '-social' for x in social_roi_names] + mdtbcb_roi_names + striat_roi_names


# Use ROI to mask
#roi_names = ['VS_L', 'VS_R']
con_names = ['all_winVlos', 'positive_winVlos']
#roi_dict['VS_l'] = bids_dir+'derivatives/rois/roi_bin_reward_VS_l.nii.gz'
#roi_dict['VS_r'] = bids_dir+'derivatives/rois/roi_bin_reward_VS_r.nii.gz'



# Create a dataframe for all subjects data
all_sub_roi_betas = pd.DataFrame(columns=['subject_id','group','task',
                                          'contrast','roi','contrast_mean'])


# Loop through all subjects to find the mean_beta for each ROI, for each task

for subj in subjs_list:
    print('Starting univariate analysis for '+subj)

    group_id = subjs_scan_info[subjs_scan_info['participant_id'] == subj]['group'].iloc[0]
    
    for task in ['mdoors','social']:
        # Find the subject brain mask
        subj_t1 = bids_dir+"derivatives/fmriprep/"+subj+"/func/"+subj+"_task-"+task+"_run-1_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz"
        subj_suit = bids_dir+'derivatives/social_doors/'+subj+'/suit/iw_c_'+subj+'_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb_u_a_'+subj+'_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii'

        # Create dataframe to store mean responses for subject
        #subj_roi_data = pd.DataFrame(columns=roi_names)
        
        
        #print("Loading brain data...")
        for cond in con_names:
            for n in range(len(rois)):
                #roi_path = rois[n]
                # If there is a cerebellum ROI, use the suit data
                if 'region' in roi_names[n] or 'C1' in roi_names[n] or 'LIX' in roi_names[n]:
                    roi_mask = Brain_Data(rois[n], mask=subj_suit)
                    
                    # Binarize mask
                    roi_mask = roi_mask.threshold(upper=0.1, binarize=True)
            
                    
                    # Import beta map for condition
                    fnc_data = os.path.join(data_dir, subj, 'suit', 
                               'iw_wdzmap_'+task+'_'+cond+'_u_a_'+subj+'_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii')
                
                    roi_data = Brain_Data(fnc_data, mask=subj_suit)
                    
                else:
                    roi_mask = Brain_Data(rois[n], mask=subj_t1)
                    
                    # Binarize mask
                    roi_mask = roi_mask.threshold(upper=0.1, binarize=True)
            
                    
                    # Import beta map for condition
                    fnc_data = data_dir+subj+'/zmap_'+task+'_'+cond+'.nii'
                    roi_data = Brain_Data(fnc_data, mask=subj_t1)
                
                
                # Mask beta map and get average value for ROI
                if roi_data.apply_mask(roi_mask).data.shape[0] == 0:
                    continue
                else:
                
                    fnc_masked = roi_data.apply_mask(roi_mask)
                    
                    
                    # Attach data to subject dataframe
                    all_sub_roi_betas = all_sub_roi_betas.append({'subject_id':subj,
                                                                  'group':group_id,
                                                                  'task':task,
                                                                  'contrast':cond
,                                                                  'roi':roi_names[n],
                                                                  'contrast_mean':fnc_masked.mean()},
                                                                  ignore_index=True)
                    
        

all_sub_roi_betas.to_csv(outp_dir+'all_sub_roi_contrasts.csv', index=False)










