#!/bin/python

import sys
import numpy as np
#import pylab as pl
import os
import pandas as pd
import glob
from mvpa2.datasets.mri import fmri_dataset

from mvpa2.measures import rsa
from mvpa2.measures.searchlight import sphere_searchlight

#from mvpa2.base.learner import ChainLearner
#from mvpa2.mappers.shape import TransposeMapper

import nibabel as nib

import time
start_time = time.time()



subj = 'sub-'+str(sys.argv[1])
#subj = 'sub-010'


bids_dir = '/data/projects/social_doors/'
os.chdir(bids_dir)

outp_dir = os.path.join(bids_dir, 'derivatives', 'rsa_searchlight')
data_dir = os.path.join(bids_dir, 'derivatives','social_doors')


conditions = ['negative','negative_win','negative_loss',
             'positive','positive_win','positive_loss']


#dscm = rsa.PDistConsistency()
#sl_cons = sphere_searchlight(dscm, 2)


# Hypothesis RDMs

def prep_hyp_rdm(raw_df):
    # Temporarily replace the zeros in this dataframe so that the lower triangle can be captured by filtering out zeros
    raw_df = raw_df.replace(0, 5)
    
    # Make the diagonal 0 again
    for i in raw_df.index:
        for j in raw_df.columns:
            if i == j:
                raw_df.loc[i, j] = 0


    # Create 1-D vectors for each component and 
    upper_rdm = np.triu(np.array(raw_df)).flatten()
    upper_rdm = upper_rdm[upper_rdm != 0]
    
    upper_rdm[upper_rdm == 5] = 0
    
    return(upper_rdm)


## Valence
valence_df = pd.DataFrame([[0,0,0,1,1,1],
                          [0,0,0,1,1,1],
                          [0,0,0,1,1,1],
                          [1,1,1,0,0,0],
                          [1,1,1,0,0,0],
                          [1,1,1,0,0,0]],
                         index=conditions, columns=conditions)

valence_upper = prep_hyp_rdm(valence_df)


## Correct
correct_df = pd.DataFrame([[0,0,0,0,0,0],
                          [0,0,1,0,0,1],
                          [0,1,0,0,1,0],
                          [0,0,0,0,0,0],
                          [0,0,1,0,0,1],
                          [0,1,0,0,1,0]],
                         index=conditions, columns=conditions)

correct_upper = prep_hyp_rdm(correct_df)


crctval_df = pd.DataFrame([[0,0,0,0,0,0],
                          [0,1,1,0,1,1],
                          [0,1,0,0,1,0],
                          [0,0,0,0,0,0],
                          [0,1,1,0,1,1],
                          [0,1,0,0,1,0]],
                         index=conditions, columns=conditions)

crctval_upper = prep_hyp_rdm(crctval_df)

## Combine all hypothesis RDMs
rdms_all = np.array([valence_upper, correct_upper, crctval_upper]).T

rdm_names = ['valence', 'correct', 'crctval']


# Searchlight
## Define searchlight
tdsm = rsa.Regression(rdms_all, normalize=True)
sl_tdsm = sphere_searchlight(tdsm, 4)


print("Running subject ...")
print("..."+subj)
    
file_list = glob.glob(os.path.join(data_dir, subj, 'tmap*.nii.gz'))
file_list.sort()
    
for task in ['mdoors','social']:
    func_files = [x for x in file_list if 'tmap_'+task in x]
    func_files = [x for x in func_files if 'V' not in x]
    func_files.sort()

    if len(func_files) < 6:
        continue
    else:

        subj_mni_mask = bids_dir+"derivatives/fmriprep/"+subj+"/anat/"+subj+"_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii.gz"

        betas = fmri_dataset(func_files, mask=subj_mni_mask)
        betas.sa.targets = np.array(conditions)

        slres_tdsm = sl_tdsm(betas)

        for n in range(rdms_all.shape[1]):
            vol = betas.a.mapper.reverse1(slres_tdsm.samples[n])
            img = nib.Nifti1Image(vol, betas.a.imgaffine)
            nib.save(img, os.path.join(outp_dir, subj+'_sl_'+task+'_'+rdm_names[n]+'.nii.gz')) 

print("--- %s seconds ---" % (time.time() - start_time))
