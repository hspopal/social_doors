# -*- coding: utf-8 -*-

import pandas as pd
import numpy as np
import sys
import os
import glob

from nltools.utils import get_resource_path
from nltools.file_reader import onsets_to_dm
from nltools.data import Design_Matrix


subj = str(sys.argv[1])
task = str(sys.argv[2])


#subj = f'{10:03}'
#task = 'mdoors'
TR = 2.1
sampling_freq = 1/TR


all_runs = Design_Matrix(sampling_freq = sampling_freq)
all_runs_cat = Design_Matrix(sampling_freq = sampling_freq)
all_runs_cat_cov = Design_Matrix(sampling_freq = sampling_freq)

bids_dir = '/data/projects/social_doors/'

fmri_run_data_dir = bids_dir+"derivatives/fmriprep/sub-"+str(subj)+"/func/"
#task_file = pd.read_csv(bids_dir+"archive/fMRI_task/task/data/relationships_scanner_"+str(subj)+".csv")
temp_event_dir = bids_dir+"archive/prepped_event_files/"
#rel_idxs = pd.read_csv(bids_dir+"archive/fMRI_task/task/relationships_index.csv")

task_file_paths = glob.glob(os.path.join(bids_dir, 'Nifti','sub-'+subj, 'func',
                                         'sub-'+subj+'_task-'+task+f'*_events.tsv'))
fmrip_task_file = pd.DataFrame()
for n in range(len(task_file_paths)):
    temp_file = pd.read_csv(task_file_paths[n], sep='\t')
    temp_file['run'] = n+1
    fmrip_task_file = pd.concat([fmrip_task_file, temp_file], ignore_index=True)

#if task_file['SUBJECT_#'].iloc[0] == 'SUBJECT_#':
#    task_file = task_file[1:]

#task_file[['onset','duration']] = task_file[['onset','duration']].apply(pd.to_numeric)


# Load mriqc rating summaries
#mriqc_summary = pd.read_csv(bids_dir+'derivatives/mriqc/mriqc_summary_poor.csv')

# Filter task runs for mriqc runs
#mriqc_runs = list(mriqc_summary[mriqc_summary['subject'] == 'sub-'+str(subj)]['run'].str[-8:-5])
mriqc_runs = fmrip_task_file['run'].unique()


#for run in range(1,int(task_file[' RUN_#'].max())+1):        
for run in mriqc_runs:
    # 1) Load in onsets for this run
    onsetsFile = fmrip_task_file[fmrip_task_file['run']==run]
    onsetsFile = onsetsFile[['onset','duration','trial_type']]
    onsetsFile.columns = ['Onset', 'Duration', 'Stim']
    #onsetsFile['Duration'] = 5
    n_trs = len(fmrip_task_file[fmrip_task_file['run'] == run])
    dm = onsets_to_dm(onsetsFile, sampling_freq=sampling_freq, run_length=132, 
                      sort=True)
    
    # Drop the first two TRs
    dm = dm.iloc[2:]
    dm = dm.reset_index(drop=True)
    #dm['response_time'] = 0
    #for col in dm.columns[:-3]:
        #print(fmrip_task_file[fmrip_task_file['trial_type'] == col]['response_time'])
    #    dm['response_time'].loc[dm[dm[col] != 0][col].index] = fmrip_task_file[fmrip_task_file['trial_type'] == col]['response_time'].iloc[0]
    #all_runs_cat = all_runs_cat.append(dm,axis=0)
    
    
    # 2) Convolve them with the hrf
    dm_conv = dm.convolve()
    
    # 3) Load in covariates for this run
    add_regressors = pd.read_csv(fmri_run_data_dir+"sub-"+str(subj)+"_task-"+task+"_run-"+str(run)+"_desc-confounds_timeseries.tsv", sep="\t")
    
    mot_regressors = Design_Matrix(add_regressors[['trans_x','trans_y','trans_z','rot_x','rot_y','rot_z']], sampling_freq=sampling_freq)
    
    # 4) In the covariates, fill any NaNs with 0, add intercept and linear trends and dct basis functions
    cov = mot_regressors.fillna(0)
    
    # Retain a list of nuisance covariates (e.g. motion and spikes) which we'll also want to also keep separate for each run
    #cov_columns = cov.columns
    cov.columns = [e[2:] for e in cov.columns]
    cov = cov.add_poly(2)
    all_runs_cat_cov = all_runs_cat_cov.append(cov,axis=0)
    
    
    # 4) Join the onsets and covariates together
    full_dm = dm_conv.append(cov, axis=1)
    #full_dm.to_csv(temp_event_dir+"sub-"+str(subj)+"_ses-00"+str(ses)+"_task-relscenarios_run-00"+str(run)+"_desc-design_matrix.tsv", sep="\t", index=False)
    full_dm_reidx = dm_conv.append(cov, axis=1)
    full_dm_reidx.index = np.arange(len(dm)*run-1, len(dm) + len(dm)*run-1)
    
    
    # 5) Append it to the master Design Matrix keeping things separated by run
    all_runs = all_runs.append(full_dm_reidx,axis=0,unique_cols=full_dm.columns)
    all_runs_cat = all_runs_cat.append(full_dm)
    

    
    
#all_runs.heatmap(vmin=-1,vmax=1)
#all_runs_cat = all_runs_cat.convolve()
#all_runs_cat = all_runs_cat.append(all_runs_cat_cov, axis=1)

all_runs.to_csv(temp_event_dir+"sub-"+str(subj)+"_task-"+task+"-all_desc-design_matrix.csv", index=False)
all_runs_cat.to_csv(temp_event_dir+"sub-"+str(subj)+"_task-"+task+"_run-all_cat_desc-design_matrix.csv", index=False)
print(temp_event_dir+"sub-"+str(subj)+"_task-"+task+"_run-all_cat_desc-design_matrix.csv")




















