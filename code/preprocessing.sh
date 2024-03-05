#!/bin/bash

# Prep and preprocessing for the social doors dataset cerebellum reward processing project

# Define subjects

subj_list=( s010 s011 s013 s015 s024 s028 s036 s5049 
            s5051 s5054 s5058 s5059 s5064 s5067 s5068 
            s5082 s5083 s5084 s5085 s5090 s5091 s5092 
            s5093 s5094 s5095 s5098 s5102 s5108 s5123  
            s5125 s5126 s5130 s5131 s5133 s5136 s5140 s5145 )

export BIDS_DIR="/data/projects/Social_Doors_KIDS"
cd ${BIDS_DIR}


# Unzip Dicoms

for subj in "${subj_list[@]}"; do 
    cd ${BIDS_DIR}/archive/Data/dicoms/${subj}/DICOM/
    for zip in *.tar.gz; do tar -xf $zip; done
done


# Read dicom headers and create heudiconv directory on linux machine (cla27562)
docker run --rm -it \
	-v /data/projects/Social_Doors_KIDS:/base nipy/heudiconv:latest \
	-d /base/sourcedata/s{subject}/DICOM/*/*.dcm \
	-o /base/ \
	-f reproin \
	-s 010 011 013 015 024 028 036 5049 5051 5054 5058 5059 5064 5067 5068 5082 5083 5084 5085 5090 5091 5092 5093 5094 5095 5098 5102 5108 5123 5125 5126 5130 5131 5133 5136 5140 5145 \
	-c none \
	--overwrite


# Unpack and create nifti files
docker run --rm -it \
	-v /data/projects/Social_Doors_KIDS:/base nipy/heudiconv:latest \
	-d /base/sourcedata/s{subject}/DICOM/*/*.dcm \
	-o /base/Nifti \
	-f /base/code/heuristic.py \
	-s 010 011 013 015 024 028 036 5049 5051 5054 5058 5059 5064 5067 5068 5082 5083 5084 5085 5090 5091 5092 5093 5094 5095 5098 5102 5108 5123 5125 5126 5130 5131 5133 5136 5140 5145 \
	-c dcm2niix -b \
	--overwrite


# Rerun for college cohort

# Read dicom headers and create heudiconv directory on linux machine (cla27562)
docker run --rm -it \
	-v /data/projects/social_doors_college:/base nipy/heudiconv:latest \
	-d /base/sourcedata/s{subject}/*/*.dcm \
	-o /base/ \
	-f reproin \
	-s 3836 3845 3846 3847 3848 3849 3851 3852 3854 3855 3864 3865 3871 3874 3877 3880 3882 3883 3886 3887 3889 3890 3891 3892 3893 3895 3896 3910 3912 3914 3920 3967 3989 3992 4011 4017 4018 4019 4020 4069 6001 6003 6004 6005 6006 6007 \
	-c none \
	--overwrite


# Unpack and create nifti files
docker run --rm -it \
	-v /data/projects/social_doors:/base nipy/heudiconv:latest \
	-d /base/sourcedata/s{subject}/*/*.dcm \
	-o /base/Nifti \
	-f /base/code/heuristic.py \
	-s 3836 3845 3846 3847 3848 3849 3851 3852 3854 3855 3864 3865 3871 3874 3877 3880 3882 3883 3886 3887 3889 3890 3891 3892 3893 3895 3896 3910 3912 3914 3920 3967 3989 3992 4011 4017 4018 4019 4020 4069 6001 6003 6004 6005 6006 6007 \
	-c dcm2niix -b \
	--overwrite


# Preprocess subjects on owlsnest
subj_list=( 010 011 013 015 024 028 036 5049 5051 5054 
            5058 5059 5064 5067 5068 5082 5083 5084 5085 5090 
            5091 5092 5093 5094 5095 5098 5102 5108 5123 5125 
            5126 5130 5131 5133 5136 5140 5145 3836 3845 3846 
            3847 3848 3849 3851 3852 3854 3855 3864 3865 3871 
            3874 3877 3880 3882 3883 3886 3887 3889 3890 3891 
            3892 3893 3895 3896 3910 3912 3914 3920 3967 3989 
            3992 4011 4017 4018 4019 4020 4069 6001 6003 6004 
            6005 6006 6007 )

for ((i=0; i < ${#subj_list[@]}; i+=6)); do
	part=( "${subj_list[@]:i:6}" )
	qsub code/fmriprep_hpc_batch.sh -v subjects="${part[*]}"
done


subj_list=( 5059 3914 3920 3967 3989 3992 4011 4017 4018 4019 4020 4069 6001 6003 6004 6005 6006 6007 )
for ((i=0; i < ${#subj_list[@]}; i+=6)); do
	part=( "${subj_list[@]:i:6}" )
	qsub code/fmriprep_hpc_batch.sh -v subjects="${part[*]}"
done


# Copy fmriprep qc output to local machine
for subj in "${subj_list[@]}"; do 	
    mkdir sub-${subj}
    rsync -a 155.247.66.250:/data/projects/social_doors/derivatives/fmriprep/sub-${subj}.html ./
    rsync -a 155.247.66.250:/data/projects/social_doors/derivatives/fmriprep/sub-${subj}/figures sub-${subj}/
done

# Copy over relevant fmriprep output
for subj in "${subj_list[@]}"; do 	
	mkdir sub-${subj}/anat
	mkdir sub-${subj}/func
    rsync -a tuk12127@cla27562.tu.temple.edu:/data/projects/social_doors/derivatives/fmriprep/sub-${subj}/anat/\*-GM_probseg_bin.nii.gz sub-${subj}/anat/
    rsync -a tuk12127@cla27562.tu.temple.edu:/data/projects/social_doors/derivatives/fmriprep/sub-${subj}/func/\*desc-preproc_bold.nii.gz sub-${subj}/func/
done


# Preprocess subjects on owlsnest
lsa 

for ((i=0; i < ${#subj_list[@]}; i+=6)); do
	part=( "${subj_list[@]:i:6}" )
	qsub code/mriqc_hpc_batch.sh -v subjects="${part[*]}"
done


# Get good participants list from fmri_qc_summary.ipynb
# Set up "good" participants list
subj_list=( 010 013 028 036 3845 3846 3848 3849 3852 3855
            3864 3865 3874 3880 3882 3883 3886 3887 3889 3890
            3891 3892 3893 3895 3910 3912 3920 3967 3989 3992
            4011 4017 4018 4019 4020 4069 5049 5051 5054 5058
            5064 5067 5068 5082 5083 5084 5085 5090 5091 5092
            5093 5094 5095 5098 5102 5108 5125 5126 5130 5131
            5133 5136 5140 5145 6003 6004 6005 6006 )


# Prep event files on linux

for subj in "${subj_list[@]}"; do
	python code/prep_event_files.py ${subj} mdoors
	python code/prep_event_files.py ${subj} social
	sudo mv archive/prepped_event_files/sub-${subj}*.tsv Nifti/sub-${subj}/func/
done



# Create design matrices
for subj in "${subj_list[@]}"; do
	python code/prep_social_doors_design_matrix.py ${subj} mdoors
	python code/prep_social_doors_design_matrix.py ${subj} social
	sudo mv archive/prepped_event_files/sub-${subj}*design_matrix.csv derivatives/fmriprep/sub-${subj}/func/
done


# Create grey matter masks for each participant
for subj in "${subj_list[@]}"; do 
	flirt -in derivatives/fmriprep/sub-"$subj"/anat/sub-"$subj"_run-1_space-MNI152NLin2009cAsym_label-GM_probseg.nii.gz \
	      -ref derivatives/fmriprep/sub-"$subj"/func/sub-"$subj"_task-mdoors_run-1_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz \
	      -out derivatives/fmriprep/sub-"$subj"/anat/sub-"$subj"_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii.gz \
	      -applyxfm
	fslmaths derivatives/fmriprep/sub-"$subj"/anat/sub-"$subj"_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii.gz -thr 0.2 -bin derivatives/fmriprep/sub-"$subj"/anat/sub-"$subj"_space-MNI152NLin2009cAsym_label-GM_probseg_bin.nii.gz
done


# Run first level analyses
for subj in "${subj_list[@]}"; do
	python code/social_doors_1st_level.py ${subj} mdoors
	python code/social_doors_1st_level.py ${subj} social
done

for subj in "${subj_list[@]}"; do
	python code/social_doors_1st_level-indiv_runs.py ${subj} mdoors
	python code/social_doors_1st_level-indiv_runs.py ${subj} social
done

for subj in "${subj_list[@]}"; do
	python code/social_doors_1st_level-nilearn.py ${subj} mdoors
	python code/social_doors_1st_level-nilearn.py ${subj} social
done

for subj in "${subj_list[@]}"; do
	python code/social_doors_1st_level-nilearn-indiv_runs.py ${subj} mdoors
	python code/social_doors_1st_level-nilearn-indiv_runs.py ${subj} social
done

# This is just to run the faces vs doors contrast as a sanity check for FFA
for subj in "${subj_list[@]}"; do
	python code/social_doors_1st_level-combined_tasks.py ${subj}
done


# Run Quarmley replication
for subj in "${subj_list[@]}"; do
	python code/prep_quarmley_replication.py ${subj} mdoors
	python code/prep_quarmley_replication.py ${subj} social
done


