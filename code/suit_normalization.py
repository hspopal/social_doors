#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul  3 14:35:13 2026

@author: haroonpopal
"""

# Import necessary packages
import os
import sys
from nilearn import plotting
import SUITPy as suit
import nibabel as nib
import ants
import nilearn.plotting as  npl
import matplotlib.pyplot as plt



beta_test = False

if beta_test:
    subj = 'sub-010'
    task = 'mdoors'
    contrast = 'positive_winVlos'
    
    print('---BETA TESTING---')
    
else:
    subj = 'sub-'+str(sys.argv[1])
    task = str(sys.argv[2])
    contrast = str(sys.argv[3])
    

print('Running SUIT cerebellum normalization for ...')
print('Subject:' + subj)
print('Task:' + task)
print('Contrast:' + contrast)


# Set directories
bids_dir = '/Volumes/HP-SOC-DOOR/social_doors/'
os.chdir(bids_dir)

#all_runs_dir = bids_dir + 'derivatives/social_doors-nilearn/'


# Define path for subject anatomical
subj_anat_prefix = bids_dir+'derivatives/fmriprep/'+subj+'/anat/'+subj+'_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w'


# Check to see if cerebellum has already been isolated
if not os.path.exists(subj_anat_prefix+'_cerebellum_dseg.nii.gz'): 
    print('Normalized SUIT cerebellum does not exist, creating now...')
    
    # Isolate the cerebellum
    
    # This function generates isolation mask for the cerebellum based on a T1 scan
    suit.isolate(subj_anat_prefix+'.nii.gz')
    
    
    # Visualize the mask on the T1 image
    #img = nib.load(subj_anat_prefix+'.nii.gz')
    #mask = nib.load(subj_anat_prefix+'_cerebellum_dseg.nii.gz')
    #plotting.plot_roi(img, mask)
    
    
    # This function normalizes a source image to the SUIT cerebellar template using a provided cerebellum
    results = suit.normalize(source_file = subj_anat_prefix+'.nii.gz', 
                             mask_file = subj_anat_prefix+'_cerebellum_dseg.nii.gz')
    
    
      
    
    # Load as NiBabel image
    """
    norm_img = nib.load(subj_anat_prefix+'_space-SUIT.nii.gz')
    # Load SUIT template
    template_img = nib.load(bids_dir+'derivatives/SUITPy/templates/SUIT.nii')
    # Visualize the result
    npl.plot_anat(template_img, title="SUIT Template",  display_mode='yz',
                  cut_coords=(-60, -30), colorbar=False)
    npl.plot_anat(norm_img, title="Warped T1w", display_mode='yz',
                  cut_coords=(-60, -30), colorbar=False)
    """



# Reslice functional contrasts into SUIT space

# Apply the reslice function
print('Normalizing functional data...')
src = bids_dir+'derivatives/social_doors-nilearn/'+subj+'/zmap_'+task+'_'+contrast+'.nii.gz'
deform = subj_anat_prefix+'_to-SUIT_mode-image_xfm.nii.gz'
mask = subj_anat_prefix+'_cerebellum_dseg.nii.gz'
img = suit.reslice_image(source_image = src, deformation = deform, 
                         mask = mask, voxelsize=2)

# Save the resliced image under a new filename
nib.save(img, bids_dir+'derivatives/social_doors-nilearn/'+subj+'/zmap_'+task+'_'+contrast+'_space-SUIT.nii.gz')






