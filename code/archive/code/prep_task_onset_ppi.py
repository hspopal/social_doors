# -*- coding: utf-8 -*-

import pandas as pd
import sys
import warnings
warnings.filterwarnings('ignore')

#sys.path.insert(0, '/data/projects/relationship_knowledge/code/')
#import onsets_to_dm_relation

from nltools.file_reader import onsets_to_dm
from nltools.data import Design_Matrix




subj = str(sys.argv[1])
#ses = int(sys.argv[2])


#subj = '013'
TR = 2.1
n_TRs = 130
sampling_freq = 1/TR
all_runs = Design_Matrix(sampling_freq = sampling_freq)
all_runs_cat = Design_Matrix(sampling_freq = sampling_freq)
all_runs_cat_cov = Design_Matrix(sampling_freq = sampling_freq)
odd_runs = Design_Matrix(sampling_freq = sampling_freq)
even_runs = Design_Matrix(sampling_freq = sampling_freq)

all_runs_cat_noconv = Design_Matrix(sampling_freq = sampling_freq)

bids_dir = '/data/projects/social_doors/'

fmri_run_data_dir = bids_dir+"derivatives/fmriprep/sub-"+str(subj)+"/func/"
#task_file = pd.read_csv(bids_dir+"archive/fMRI_task/task/data/relationships_scanner_"+str(subj)+".csv")
#temp_event_dir = "~/Desktop/projects/relationship_knowledge/event_files_exclude/"
outp_event_dir = bids_dir+"derivatives/ppi_analysis/design_matrices/"
#rel_idxs = pd.read_csv(bids_dir+"archive/fMRI_task/task/relationships_index.csv")

#if task_file['SUBJECT_#'].iloc[0] == 'SUBJECT_#':
#    task_file = task_file[1:]

#task_file[[' TRIAL_START',' TRIAL_END']] = task_file[[' TRIAL_START',' TRIAL_END']].apply(pd.to_numeric)


# Load mriqc rating summaries
#mriqc_summary = pd.read_csv(bids_dir+'derivatives/mriqc/mriqc_summary_poor.csv')
mriqc_summary = pd.read_csv(bids_dir+'derivatives/qc_summary.csv')

# Filter task runs for mriqc runs
task_runs = list(mriqc_summary[mriqc_summary['subject'] == 'sub-'+str(subj)]['run'])

print('Prepping event files for sub-'+str(subj))

#for run in range(1,int(task_file[' RUN_#'].max())+1):       
for run in task_runs:
    #run = int(run.lstrip('0'))  

    print('Prepping run '+str(run))

    fmrip_task_file = pd.read_csv(bids_dir+'Nifti/sub-'+str(subj)+
                     "/func/sub-"+str(subj)+"_task-"+run+"_events.tsv", sep="\t")
    #fmrip_task_file[['onset', 'duration']] = fmrip_task_file[['onset', 'duration']].apply(pd.to_numeric)

    # 1) Load in onsets for this run
    onsetsFile = fmrip_task_file[['onset','duration','trial_type']]
    onsetsFile.columns = ['Onset', 'Duration', 'Stim']

    #for i in onsetsFile.index[:-1]:
        #onsetsFile.loc[i, 'Duration'] = onsetsFile.loc[i+1, 'Onset'] - onsetsFile.loc[i, 'Onset']
    #onsetsFile.loc[onsetsFile.index[-1], 'Duration'] = 0
    
    # Setting the duration to less than it actually is because of potential bug with nltools
    onsetsFile.loc[:,'Duration'] = 5
    onsetsFile[['Onset','Duration']] = onsetsFile[['Onset','Duration']].apply(pd.to_numeric)
    dm = onsets_to_dm(onsetsFile, sampling_freq=sampling_freq, run_length=n_TRs, sort=True)
    #dm['response_time'] = 0
    #for col in dm.columns[:-3]:
        #print(fmrip_task_file[fmrip_task_file['trial_type'] == col]['response_time'])
        #dm['response_time'].loc[dm[dm[col] != 0][col].index] = fmrip_task_file[fmrip_task_file['trial_type'] == col]['response_time'].iloc[0]
    
    # Add regressor for whether any relationship was shown
    #dm['All'] = 0
    #for n in dm.index:
    #    if dm.iloc[n,:76].sum() > 0:
    #        dm.loc[n,'All'] = 1
    
    # Remove all relationships so only "All" is left
    #dm.drop(dm.columns[:76], axis=1, inplace=True)
    
    #all_runs_cat = all_runs_cat.append(dm,axis=0)

    #sns.heatmap(dm, cmap='gray')
    #plt.savefig(temp_event_dir+'dm_sub-'+str(subj)+'.png')

    
    # 2) Load in covariates for this run
    add_regressors = pd.read_csv(fmri_run_data_dir+"sub-"+str(subj)+"_task-"+run+"_desc-confounds_timeseries.tsv", sep="\t")
    
    #add_regressors.loc[:,'response_time'] = 0
    #for col in dm.columns[:-3]:
        #print(fmrip_task_file[fmrip_task_file['trial_type'] == col]['response_time'])
        #add_regressors.loc[dm[dm[col] != 0][col].index,'response_time'] = fmrip_task_file[fmrip_task_file['trial_type'] == col]['response_time'].iloc[0]
    


    #mot_regressors = Design_Matrix(add_regressors[['response_time','trans_x','trans_y','trans_z','rot_x','rot_y','rot_z']], sampling_freq=sampling_freq)
    mot_regressors = Design_Matrix(add_regressors[['trans_x','trans_y','trans_z','rot_x','rot_y','rot_z']], sampling_freq=sampling_freq)


    # 3) In the covariates, fill any NaNs with 0, add intercept and linear trends and dct basis functions
    cov = mot_regressors.fillna(0)
    
    # Retain a list of nuisance covariates (e.g. motion and spikes) which we'll also want to also keep separate for each run
    #cov_columns = cov.columns
    #cov.columns = [e[2:] for e in cov.columns]
    cov = cov.add_poly(1)
    
    
    # 4) Join the onsets and covariates together
    full_dm = dm.append(cov, axis=1)
    #full_dm.to_csv(temp_event_dir+"sub-"+str(subj)+"_ses-00"+str(ses)+"_task-relscenarios_run-00"+str(run)+"_desc-design_matrix.tsv", sep="\t", index=False)
    #full_dm_reidx = dm.append(cov, axis=1)
    #full_dm_reidx.index = np.arange(len(dm)*run-1, len(dm) + len(dm)*run-1)
    

    # 5) Export run design matrix
    full_dm.to_csv(outp_event_dir+"sub-"+str(subj)+"_task-"+run+"_desc-design_matrix.csv", index=False)





















