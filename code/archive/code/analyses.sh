#!/bin/bash

export BIDS_DIR="/data/projects/social_doors"
cd ${BIDS_DIR}


# Set up "good" participants list
subj_list=( 010 013 028 036 3845 3846 3848 3849 3852 3855
            3864 3865 3874 3880 3882 3883 3886 3887 3889 3890
            3891 3892 3893 3895 3910 3912 3920 3967 3989 3992
            4011 4017 4018 4019 4020 4069 5049 5051 5054 5058
            5064 5067 5068 5082 5083 5084 5085 5090 5091 5092
            5093 5094 5095 5098 5102 5108 5125 5126 5130 5131
            5133 5136 5140 5145 6003 6004 6005 6006 )


# Prep


# Run univariate analysis
python code/univariate_roi_contrast.py




# Run first level RSA analysis
count=1
for subj in "${subj_list[@]}"; do 
	python code/rsa_searchlight.py "$subj" &
    count=$((count+1))
    if (( $count > 24 )); then
        sleep 30m
        count=1
    fi
done




# SUIT cerebellum toolbox

## Create suit directory in subj folders and copy relevant files

for subj in "${subj_list[@]}"; do 
    mkdir derivatives/social_doors-nilearn/sub-${subj}/suit
    cp derivatives/fmriprep/sub-${subj}/anat/sub-${subj}*preproc_T1w.nii.gz derivatives/social_doors-nilearn/sub-${subj}/suit/
    cp derivatives/fmriprep/sub-${subj}/anat/sub-${subj}*GM_probseg.nii.gz derivatives/social_doors-nilearn/sub-${subj}/suit/
    cp derivatives/fmriprep/sub-${subj}/anat/sub-${subj}*WM_probseg.nii.gz derivatives/social_doors-nilearn/sub-${subj}/suit/
    gzip -d derivatives/social_doors-nilearn/sub-${subj}/suit/*.nii.gz
    gzip -d derivatives/social_doors-nilearn/sub-${subj}/zmap_*.nii.gz
done

# Move files around for better organization
for subj in "${subj_list[@]}"; do 
    mv derivatives/social_doors-nilearn/sub-${subj}/wdzmap_* derivatives/social_doors-nilearn/sub-${subj}/suit/
done


# Copy over some files for the individual run data
for subj in "${subj_list[@]}"; do 
    gzip -d derivatives/social_doors-nilearn-indiv_runs/sub-${subj}/zmap_*.nii.gz
    cp -r derivatives/social_doors-nilearn/sub-${subj}/suit derivatives/social_doors-nilearn-indiv_runs/sub-${subj}/
    rm derivatives/social_doors-nilearn-indiv_runs/sub-${subj}/suit/wdzmap_*
done



# Recombine new cerebellum SUIT data with original first level maps
# Dont actually run

# Resample to original functional space
flirt -in derivatives/social_doors/sub-010/suit/c_sub-010_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb.nii \
      -ref derivatives/social_doors/sub-010/tmap_social_facesVoutcm.nii \
      -out derivatives/social_doors/sub-010/suit/c_sub-010_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb_2mm.nii -applyxfm

flirt -in derivatives/social_doors/sub-010/suit/iw_wdtmap_social_facesVoutcm_u_a_sub-010_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii \
      -ref derivatives/social_doors/sub-010/tmap_social_facesVoutcm.nii \
      -out derivatives/social_doors/sub-010/suit/iw_wdtmap_social_facesVoutcm_u_a_sub-010_run-1_space-MNI152NLin2009cAsym.nii -applyxfm

fslmaths derivatives/social_doors/sub-010/suit/iw_wdtmap_social_facesVoutcm_u_a_sub-010_run-1_space-MNI152NLin2009cAsym.nii -bin derivatives/social_doors/sub-010/suit/iw_wdtmap_social_facesVoutcm_u_a_sub-010_run-1_space-MNI152NLin2009cAsym.nii

# Subtract old data
fslmaths derivatives/social_doors/sub-010/tmap_social_facesVoutcm.nii \
         -sub derivatives/social_doors/sub-010/suit/c_sub-010_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb_2mm.nii \
         derivatives/social_doors/sub-010/suit/tmap_social_facesVoutcm_suit.nii.gz

# Add cerebellum SUIT data to original functional data
fslmaths derivatives/social_doors/sub-010/suit/tmap_social_facesVoutcm_suit.nii.gz \
         -add derivatives/social_doors/sub-010/suit/iw_wdtmap_social_facesVoutcm_u_a_sub-010_run-1_space-MNI152NLin2009cAsym.nii \
         derivatives/social_doors/sub-010/suit/tmap_social_facesVoutcm_suit.nii.gz




# PPI Analysis

for subj in "${subj_list[@]}"; do 
    python code/prep_task_onset_ppi.py $subj
done







# Searchlight RSA
## Run 24 participants at a time
" This needs to be run the in py27 environtment ('conda actiavte py27'), and then the subj_list 
needs to be redefined "

count=1
for subj in "${subj_list[@]}"; do 
	python code/rsa_searchlight.py "$subj" &
    count=$((count+1))
    if (( $count > 24 )); then
        sleep 30m
        count=1
    fi
done



