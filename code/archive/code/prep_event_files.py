#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Dec  9 15:06:17 2022

@author: tuk12127
"""

import pandas as pd
from nltools.data import Design_Matrix
import numpy as np
import sys
import os
import glob
from nltools.file_reader import onsets_to_dm


subj = str(sys.argv[1])
task = str(sys.argv[2])

#subj = '011'
#task = 'mdoors'
TR = 2.1
sampling_freq = 1/TR

print("prepping sub-"+subj+" "+task+" event files")

bids_dir = '/data/projects/social_doors/'

orig_onset_dir = bids_dir+'archive/Data/CompletedData/s'+subj+'/doors/s'+subj+'_onset/'


# Set task path name (name of task in file names)
if task == 'mdoors':
    orig_onset_dir = os.path.join(bids_dir,'archive','Data','CompletedData',
                                  's'+subj,'doors')
    
    task_header = 'Doors'
    
    proc_options = ['PrizeProc','LoseProc']
    
    
elif task =='social':
    orig_onset_dir = os.path.join(bids_dir,'archive','Data','CompletedData',
                                  's'+subj,'social')
    
    task_header='Faces'
    
    proc_options = ['LikeProc','DislikeProc']

"""
file_list = glob.glob(os.path.join(orig_onset_dir, f'*.txt'))
file_list.sort()

onset_dict = {}
for file in file_list:
    ### Loop the data lines
    #with open(file, 'r') as temp_f:
        # get No of columns in each line
    #    col_count = [ len(l.split(" ")) for l in temp_f.readlines() ]

    ### Generate column names  (names will be 0, 1, 2, ..., maximum columns - 1)
    #column_names = [i for i in range(0, max(col_count)-1)]
    temp_df = pd.read_csv(file, sep=' ', index_col=False)
    temp_trial_type = file.split('/')[-1][:4]
    onset_dict[temp_trial_type] = temp_df

with open(file) as f:
    lines = f.readlines()
    
lines[0] = lines[0].strip()
lines[1] = lines[1].strip()    

run1_df = pd.DataFrame(columns=['onset', 'duration', 'trial_type', 'response_time'])
run2_df = pd.DataFrame(columns=['onset', 'duration', 'trial_type', 'response_time'])

run1_df['onset'] = lines[0].split(' ')
run2_df['onset'] = lines[1].split(' ')

#run1_df['duration'] = TR

run1_df['trial_type'] = temp_trial_type
run2_df['trial_type'] = temp_trial_type
"""

onset_file_path = glob.glob(os.path.join(orig_onset_dir,f'*.xlsx'))[-1]
raw_df = pd.read_excel(onset_file_path, header=1)

if raw_df.columns[0] != 'ExperimentName':
    raw_df = pd.read_excel(onset_file_path, header=0)

relv_cols = [task_header+'.OnsetTime', task_header+'.OnsetToOnsetTime', 'Procedure[Trial]',
             'TrialType', 'Outcome.OnsetTime', 'Outcome.OnsetToOnsetTime',
             'Running[Trial]']
fixs_cols = ['Fixation1.OnsetTime', 'Fixation1.OnsetToOnsetTime',
             'Fixation2.OnsetTime', 'Fixation2.OnsetToOnsetTime', 
             'Running[Trial]']
itis_cols = ['ITI.OnsetTime', 'ITI', 'Running[Trial]']

runs_df = raw_df[relv_cols]
runs_df = runs_df.dropna()
fixs_df = raw_df[fixs_cols]
fixs_df = fixs_df.dropna()
itis_df = raw_df[itis_cols]
itis_df = itis_df.dropna()

scan_trigger_name = [col for col in raw_df.columns if col.startswith('ScannerTrigger')]
scan_trigger_name = [col for col in scan_trigger_name if col.endswith('.OffsetTime')][0]

scan_st = raw_df[scan_trigger_name].unique()


#pleaserest_onsettime = temp_df['PleaseRest.OnsetTime'].unique()

#temp_df_filter = temp_df.loc[:,temp_df.columns != 'PleaseRest.OnsetTime']
#temp_df_melt = pd.melt(temp_df, var_name='trial_type', value_name='onset')
#temp_df_melt = temp_df_melt.dropna()
#pleaserest_df = pd.DataFrame([['PleaseRest.OnsetTime', pleaserest_onsettime[0]],
#                               ['PleaseRest.OnsetTime', pleaserest_onsettime[1]]],
#                             columns=['trial_type', 'onset'])
#temp_df_melt.append(pleaserest_df, ignore_index=True)

run_order = runs_df['Running[Trial]'].unique()

run1_df = runs_df[runs_df['Running[Trial]'] == run_order[0]]
run2_df = runs_df[runs_df['Running[Trial]'] == run_order[1]]

fix1_df = fixs_df[fixs_df['Running[Trial]'] == run_order[0]]
fix2_df = fixs_df[fixs_df['Running[Trial]'] == run_order[1]]

iti1_df = itis_df[itis_df['Running[Trial]'] == run_order[0]]
iti2_df = itis_df[itis_df['Running[Trial]'] == run_order[1]]

#fix1_df_join = pd.DataFrame()
#fix2_df_join = pd.DataFrame()
#fix1_df_join['Fixation.OnsetTime'] = fix1_df['Fixation1.OnsetTime'].append(fix1_df['Fixation2.OnsetTime'], ignore_index=True)
#fix2_df_join['Fixation.OnsetTime'] = fix2_df['Fixation1.OnsetTime'].append(fix2_df['Fixation2.OnsetTime'], ignore_index=True)


# Define function for prepping dataframes to be onset files
def prep_run_data(df, run_num):
    # Drop run identifier columns
    df = df.drop('Running[Trial]', axis=1)
    
    if any('Fixation' in string for string in df.columns):
        # Create empty dataframe
        df_fix = pd.DataFrame()
        
        # Fill empty dataframe with combined fixation column data
        df_fix['onset'] = df['Fixation1.OnsetTime'].append(df['Fixation2.OnsetTime'], 
                                                                        ignore_index=True)
        df_fix['duration'] = df['Fixation1.OnsetToOnsetTime'].append(df['Fixation2.OnsetToOnsetTime'],
                                                                                      ignore_index=True)
        
        df_fix['trial_type'] = 'fixation'    
        
        # Reassign temporary dataframe to variable dataframe
        df = df_fix.copy(deep=True)
        
    elif any('ITI' in string for string in df.columns):
        df_iti = pd.DataFrame()
        
        df_iti['onset'] = df['ITI.OnsetTime']
        
        df_iti['duration'] = df['ITI']
        
        df_iti['trial_type'] = 'fixation'
        
        df = df_iti.copy(deep=True)
        
    else:
        #df['trial_type'] = df['Procedure[Trial]']
        #df['trial_type'] = df['trial_type'].replace(to_replace='PrizeProc', value='positive')
        #df['trial_type'] = df['trial_type'].replace(to_replace='LoseProc', value='negative')
        #df['trial_type'] = df['trial_type'] + '_' + df['TrialType']
        
        df_run_door = df.copy(deep=True)
        df_run_door['trial_type'] = df_run_door['Procedure[Trial]']
        df_run_door['trial_type'] = df_run_door['trial_type'].replace(
            to_replace=proc_options[0], value='positive')
        df_run_door['trial_type'] = df_run_door['trial_type'].replace(
            to_replace=proc_options[1], value='negative')
        df_run_door['onset'] = df_run_door[task_header+'.OnsetTime']
        df_run_door['duration'] = df_run_door[task_header+'.OnsetToOnsetTime']
        #print(df_run_door['trial_type'])
        
        df_run_outc = df_run_door.copy(deep=True)
        df_run_outc['trial_type'] = df_run_door['trial_type'] + '_' + df_run_door['TrialType']
        df_run_outc['onset'] = df_run_door['Outcome.OnsetTime']
        df_run_outc['duration'] = df_run_door['Outcome.OnsetToOnsetTime']
        
        # Merge run dataframes
        df = pd.concat([df_run_door, df_run_outc])
        
        
    # Change times to be scan specific
    #onset_col = [string for string in df.columns if string.endswith('.OnsetTime')][0]
    #durat_col = [string for string in df.columns if string.endswith('.OnsetToOnsetTime')][0]
    df['onset'] = (df['onset'] - scan_st[run_num-1]) / 1000
    df['duration'] = round(df['duration'] / 1000, 1)
    
    
    # Drop all non-relevant columns
    df = df[['onset', 'duration', 'trial_type']]
    
    
    return(df)


run1_df_clean = prep_run_data(run1_df, 1)
run2_df_clean = prep_run_data(run2_df, 2)

fix1_df_clean = prep_run_data(fix1_df, 1)
fix2_df_clean = prep_run_data(fix2_df, 2)

iti1_df_clean = prep_run_data(iti1_df, 1)
iti2_df_clean = prep_run_data(iti2_df, 2)

run1_df_total = pd.concat([run1_df_clean, fix1_df_clean, iti1_df_clean])
run2_df_total = pd.concat([run2_df_clean, fix2_df_clean, iti2_df_clean])

# Sort by onset times
run1_df_total = run1_df_total.sort_values(by=['onset'], ignore_index=True)
run2_df_total = run2_df_total.sort_values(by=['onset'], ignore_index=True)


# Adjust for fmriprep slice time correction
## See more info here: https://reproducibility.stanford.edu/slice-timing-correction-in-fmriprep-and-linear-modeling/
#run1_df_total['onset'] = run1_df_total['onset'] + TR/2
#run2_df_total['onset'] = run2_df_total['onset'] + TR/2


# Export to BIDS directory
run1_df_total.to_csv(os.path.join(bids_dir,'archive','prepped_event_files',
                                  'sub-'+subj+'_task-'+task+'_run-1_events.tsv'),
                     sep='\t', index=False)
run2_df_total.to_csv(os.path.join(bids_dir,'archive','prepped_event_files',
                                  'sub-'+subj+'_task-'+task+'_run-2_events.tsv'),
                     sep='\t', index=False)



