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

for subj in "${subj_list[@]}"; do 
    sshpass -p "" rsync tuk12127@cla27562.tu.temple.edu:/data/projects/social_doors/derivatives/fmriprep/sub-${subj}/func/sub-${subj}_task-mdoors_run-1_desc-confounds_timeseries.tsv derivatives/fmriprep/sub-${subj}/func/
    sshpass -p "" rsync tuk12127@cla27562.tu.temple.edu:/data/projects/social_doors/derivatives/fmriprep/sub-${subj}/func/sub-${subj}_task-mdoors_run-2_desc-confounds_timeseries.tsv derivatives/fmriprep/sub-${subj}/func/
    sshpass -p "" rsync tuk12127@cla27562.tu.temple.edu:/data/projects/social_doors/derivatives/fmriprep/sub-${subj}/func/sub-${subj}_task-social_run-1_desc-confounds_timeseries.tsv derivatives/fmriprep/sub-${subj}/func/
    sshpass -p "" rsync tuk12127@cla27562.tu.temple.edu:/data/projects/social_doors/derivatives/fmriprep/sub-${subj}/func/sub-${subj}_task-social_run-2_desc-confounds_timeseries.tsv derivatives/fmriprep/sub-${subj}/func/
done

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
    #mkdir derivatives/ppi_analysis/subject_results/sub-${subj}/suit
    #cp derivatives/fmriprep/sub-${subj}/anat/sub-${subj}*preproc_T1w.nii.gz derivatives/ppi_analysis/subject_results/sub-${subj}/suit/
    #cp derivatives/fmriprep/sub-${subj}/anat/sub-${subj}*GM_probseg.nii.gz derivatives/ppi_analysis/subject_results/sub-${subj}/suit/
    #cp derivatives/fmriprep/sub-${subj}/anat/sub-${subj}*WM_probseg.nii.gz derivatives/ppi_analysis/subject_results/sub-${subj}/suit/
    gzip -d derivatives/ppi_analysis/subject_results/sub-${subj}/suit/*.nii.gz
    gzip -d derivatives/ppi_analysis/subject_results/sub-${subj}/*.nii.gz
done

# Move files around for better organization
for subj in "${subj_list[@]}"; do 
    mv derivatives/ppi_analysis/subject_results/sub-${subj}/wd* derivatives/ppi_analysis/subject_results/sub-${subj}/suit/
done


# Copy over some files for the individual run data
for subj in "${subj_list[@]}"; do 
    gzip -d derivatives/social_doors-nilearn-indiv_runs/sub-${subj}/zmap_*.nii.gz
    cp -r derivatives/social_doors-nilearn/sub-${subj}/suit derivatives/social_doors-nilearn-indiv_runs/sub-${subj}/
    rm derivatives/social_doors-nilearn-indiv_runs/sub-${subj}/suit/wdzmap_*
done



# Recombine new cerebellum SUIT data with original first level maps
# Dont actually run

data_dir="${BIDS_DIR}/derivatives/social_doors-nilearn"
analysis_prefix="social_positive_winVlos"

# Resample to original functional space
flirt -in ${data_dir}/sub-010/suit/c_sub-010_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb.nii \
      -ref ${data_dir}/sub-010/zmap_${analysis_prefix}.nii \
      -out ${data_dir}/sub-010/suit/c_sub-010_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb_2mm.nii \
      -applyxfm

#flirt -in ${data_dir}/sub-010/suit/iw_wdzmap_${analysis_prefix}_u_a_sub-010_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii \
#      -ref ${data_dir}/sub-010/zmap_${analysis_prefix}.nii \
#      -out ${data_dir}/sub-010/suit/iw_wdzmap_${analysis_prefix}_u_a_sub-010_run-1_space-MNI152NLin2009cAsym.nii \
#      -applyxfm

fslmaths ${data_dir}/sub-010/suit/iw_c_sub-010_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb_u_a_sub-010_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii \
        -nan ${data_dir}/sub-010/suit/iw_c_sub-010_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb_u_a_sub-010_run-1_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii

# Use cerebellum mask to capture original data for only the cerebellum
fslmaths ${data_dir}/sub-010/zmap_${analysis_prefix}.nii \
         -mas ${data_dir}/sub-010/suit/iw_c_sub-010_run-1_space-MNI152NLin2009cAsym_desc-preproc_T1w_pcereb_u_a_sub-010_run-1_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii.gz \
         ${data_dir}/sub-010/suit/zmap_${analysis_prefix}_pcereb.nii.gz

# Subtract cerebellum masked data from original data
fslmaths ${data_dir}/sub-010/zmap_${analysis_prefix}.nii \
         -sub ${data_dir}/sub-010/suit/zmap_${analysis_prefix}_pcereb.nii.gz \
         ${data_dir}/sub-010/suit/zmap_${analysis_prefix}_suit.nii.gz

# Add cerebellum SUIT data to original functional data
fslmaths ${data_dir}/sub-010/suit/zmap_${analysis_prefix}_suit.nii.gz \
         -add ${data_dir}/sub-010/suit/iw_wdzmap_${analysis_prefix}_u_a_sub-010_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii \
         ${data_dir}/sub-010/suit/zmap_${analysis_prefix}_suit.nii.gz




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



